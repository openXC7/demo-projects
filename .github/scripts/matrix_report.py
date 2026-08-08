#!/usr/bin/env python3
"""Render the demo project test matrix as a static HTML dashboard.

Fetches workflow runs and jobs through the `gh` CLI (GH_TOKEN must be
set), then writes a self-contained index.html to _site/.

Data model:
  runs:      last N runs per tracked workflow (smoke.yml, heavy.yml)
  jobs:      per run, one job per matrix entry; job.name == project name
             for the project stage, "chipdb-*" for chipdb, "determinism-*"
             for the determinism stage.
"""

import datetime
import html
import json
import os
import re
import subprocess
import sys
from pathlib import Path
from typing import Any

TRACKED_WORKFLOWS = ("smoke.yml", "heavy.yml")
RUNS_PER_WORKFLOW = 15

REPO = os.environ.get("GITHUB_REPOSITORY", "openXC7/demo-projects")
DEFAULT_BRANCH = os.environ.get("DEFAULT_BRANCH", "main")
OUT_DIR = Path("_site")
README_MARKER_START = "<!-- matrix-report:start -->"
README_MARKER_END = "<!-- matrix-report:end -->"


def gh(*args: str) -> str:
    res = subprocess.run(
        ["gh", "api", *args],
        check=False,
        capture_output=True,
        text=True,
    )
    if res.returncode != 0:
        err = (res.stderr or res.stdout).strip()
        raise SystemExit(f"gh api {' '.join(args)} failed: {err}")
    return res.stdout


def fetch_json(url: str) -> Any:
    text = gh(url)
    if not text.strip():
        return None
    return json.JSONDecoder().decode(text)


def fetch_workflows() -> dict[str, str]:
    """Map workflow file name -> display name for the tracked workflows.

    The API reports the full path (".github/workflows/smoke.yml"); the
    runs endpoint only accepts the bare file name, so key by basename.
    """
    data = fetch_json(f"repos/{REPO}/actions/workflows")
    names = {}
    for wf in data.get("workflows", []):
        fname = wf["path"].rsplit("/", 1)[-1]
        if fname in TRACKED_WORKFLOWS:
            names[fname] = wf["name"]
    return names


def fetch_projects_from_tree() -> list[str]:
    """All demo projects: every top-level directory that contains a Makefile.

    The dashboard lists the whole demo-projects tree (blinky-*, litex-ddr-*,
    ...) so projects without a recent CI run still show up with "not in
    this run" cells, instead of only the projects that happened to have
    jobs in the last few runs.
    """
    data = fetch_json(f"repos/{REPO}/git/trees/{DEFAULT_BRANCH}?recursive=1")
    projects = set()
    for entry in data.get("tree", []):
        p = entry.get("path", "")
        if p.endswith("/Makefile"):
            projects.add(p[: -len("/Makefile")])
    return sorted(projects)


def fetch_runs(path: str) -> list[dict]:
    url = f"repos/{REPO}/actions/workflows/{path}/runs?per_page={RUNS_PER_WORKFLOW}"
    data = fetch_json(url)
    return data.get("workflow_runs", [])


def fetch_jobs(run_id: int) -> list[dict]:
    url = f"repos/{REPO}/actions/runs/{run_id}/jobs?per_page=100"
    data = fetch_json(url)
    if not data:
        return []
    # The jobs endpoint returns an object ({total_count, jobs}); the
    # --paginate flag only merges array responses, so page manually if a
    # run ever has more jobs than one page.
    jobs = list(data.get("jobs", []))
    total = data.get("total_count", len(jobs))
    while len(jobs) < total:
        url = (
            f"repos/{REPO}/actions/runs/{run_id}/jobs"
            f"?per_page=100&page={len(jobs) // 100 + 1}"
        )
        page = fetch_json(url)
        jobs.extend(page.get("jobs", []))
        if not page.get("jobs"):
            break
    return jobs


def classify_job(name: str) -> str:
    if name.startswith("chipdb"):
        return "chipdb"
    if name.startswith("determinism"):
        return "determinism"
    return "project"


# conclusion -> css class + short label
CONCLUSION = {
    "success": ("ok", "pass"),
    "failure": ("fail", "fail"),
    "cancelled": ("cancel", "cancelled"),
    "skipped": ("skip", "skipped"),
    "timed_out": ("fail", "timeout"),
    "startup_failure": ("fail", "startup"),
    "action_required": ("warn", "action"),
    "neutral": ("warn", "neutral"),
    "stale": ("warn", "stale"),
}
RUNNING = ("running", "running")


def cls_for(run: dict) -> tuple[str, str]:
    status = run.get("status")
    conclusion = run.get("conclusion")
    if status != "completed":
        return RUNNING
    if not isinstance(conclusion, str):
        return ("warn", "?")
    return CONCLUSION.get(conclusion, ("warn", conclusion))


ISO_RE = re.compile(
    r"^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d+)?(Z|[+-]\d{2}:\d{2})?$"
)


def fmt_date(iso: str) -> str:
    if not isinstance(iso, str) or not ISO_RE.match(iso):
        return iso or ""
    dt = datetime.datetime.fromisoformat(iso.replace("Z", "+00:00"))
    return dt.astimezone().strftime("%Y-%m-%d %H:%M")


def fmt_date_short(iso: str) -> str:
    if not isinstance(iso, str) or not ISO_RE.match(iso):
        return ""
    dt = datetime.datetime.fromisoformat(iso.replace("Z", "+00:00"))
    return dt.astimezone().strftime("%m-%d")


def build_data() -> tuple[dict[str, str], list[dict], list[str]]:
    """Return (workflow_names, runs sorted oldest->newest, all projects).

    Only runs on the default branch are kept (PR-triggered runs would
    pollute the public matrix and would be injectable via matrix job
    names in a PR's smoke.yml).
    """
    wf_names = fetch_workflows()

    runs: list[dict] = []
    for path in TRACKED_WORKFLOWS:
        if path not in wf_names:
            continue
        for run in fetch_runs(path):
            if run.get("head_branch") != DEFAULT_BRANCH:
                continue
            run["_wf"] = wf_names[path]
            run["_jobs"] = fetch_jobs(run["id"])
            runs.append(run)

    runs.sort(key=lambda r: r["created_at"])

    # The tree is the source of truth; job names from recent runs only
    # fill gaps (e.g. a project whose Makefile was just renamed).
    projects: set[str] = set(fetch_projects_from_tree())
    for run in runs:
        for job in run["_jobs"]:
            if classify_job(job["name"]) == "project":
                projects.add(job["name"])
    return wf_names, runs, sorted(projects)


def render(wf_names: dict, runs: list[dict], projects: list[str]) -> str:
    now = datetime.datetime.now().astimezone().strftime("%Y-%m-%d %H:%M %Z")

    # --- summary cards -------------------------------------------------
    def latest_of(wf: str) -> str:
        for run in reversed(runs):
            if run["_wf"] == wf:
                c, label = cls_for(run)
                return f'<span class="badge {c}">{html.escape(label)}</span>'
        return '<span class="badge none">no runs</span>'

    # pass rate over the last 5 runs per project
    recent = runs[-5:]
    greens = reds = 0
    for run in recent:
        for job in run["_jobs"]:
            if classify_job(job["name"]) != "project":
                continue
            if job.get("conclusion") == "success":
                greens += 1
            elif job.get("conclusion") == "failure":
                reds += 1
    rate = round(100 * greens / (greens + reds)) if (greens + reds) else None

    cards = f"""
    <div class="cards">
      <div class="card">
        <div class="card-label">smoke (latest)</div>
        <div class="card-value">{latest_of("smoke")}</div>
      </div>
      <div class="card">
        <div class="card-label">heavy (latest)</div>
        <div class="card-value">{latest_of("heavy")}</div>
      </div>
      <div class="card">
        <div class="card-label">demo projects</div>
        <div class="card-value">{len(projects)}</div>
      </div>
      <div class="card">
        <div class="card-label">pass rate (last 5 runs)</div>
        <div class="card-value">{rate}%</div>
      </div>
    </div>
    """

    # --- matrix table ---------------------------------------------------
    # newest run left
    table_runs = list(reversed(runs))

    header = '<th class="proj">project</th><th class="rate">pass rate</th>'
    for run in table_runs:
        c, label = cls_for(run)
        short = fmt_date_short(run.get("created_at", ""))
        header += (
            f'<th class="runcol" title="{html.escape(run["_wf"])} run '
            f"#{run['run_number']} · {fmt_date(run.get('created_at', ''))} · "
            f'{label}">'
            f'<a href="{html.escape(run["html_url"])}">'
            f"{html.escape(run['_wf'])}<br>"
            f'<span class="runno">#{run["run_number"]}</span>'
            f'<span class="rundate"> {short}</span></a></th>'
        )

    rows = ""
    for proj in projects:
        cell_counts = {"ok": 0, "fail": 0, "other": 0}
        cells = f'<td class="proj"><a href="https://github.com/{REPO}/tree/main/{html.escape(proj)}">{html.escape(proj)}</a></td>'
        rate_cells = []
        for run in table_runs:
            job = next((j for j in run["_jobs"] if j["name"] == proj), None)
            if job is None:
                cells += '<td class="cell none" title="not in this run"></td>'
                continue
            c, label = cls_for(job)
            if c == "ok":
                cell_counts["ok"] += 1
            elif c == "fail":
                cell_counts["fail"] += 1
            else:
                cell_counts["other"] += 1
            if c == "ok" or c == "fail":
                rate_cells.append(c)
            cells += (
                f'<td class="cell {c}" '
                f'title="{html.escape(proj)} · {label} · run '
                f'#{run["run_number"]} · {fmt_date(job.get("started_at", ""))}">'
                f'<a href="{html.escape(job["html_url"])}"></a></td>'
            )
        pct = (
            round(100 * rate_cells.count("ok") / len(rate_cells))
            if rate_cells
            else None
        )
        rate_bar = ""
        if pct is not None:
            rate_bar = (
                f'<div class="ratebar"><div class="ratefill" style="width:{pct}%"></div>'
                f"<span>{pct}%</span></div>"
            )
        rows += f'<tr>{cells}<td class="rate">{rate_bar}</td></tr>'

    matrix = f"""
    <h2>Test matrix <span class="hint">newest run left · click a cell for the job</span></h2>
    <div class="tablewrap">
    <table>
      <thead><tr>{header}</tr></thead>
      <tbody>{rows}</tbody>
    </table>
    </div>
    <div class="legend">
      <span><i class="cell ok"></i> pass</span>
      <span><i class="cell fail"></i> fail</span>
      <span><i class="cell running"></i> running</span>
      <span><i class="cell cancel"></i> cancelled / skipped</span>
      <span><i class="cell none"></i> not in run</span>
    </div>
    """

    # --- recent runs detail ----------------------------------------------
    details = ""
    for run in reversed(runs[-10:]):
        c, label = cls_for(run)
        jobs = run["_jobs"]
        n_ok = sum(1 for j in jobs if j.get("conclusion") == "success")
        n_fail = sum(1 for j in jobs if j.get("conclusion") == "failure")
        chipdb = next((j for j in jobs if classify_job(j["name"]) == "chipdb"), None)
        det = next((j for j in jobs if classify_job(j["name"]) == "determinism"), None)
        chips = []
        if chipdb:
            cc, _ = cls_for(chipdb)
            chips.append(f'<i class="cell {cc}" title="chipdb"></i>')
        if det:
            cc, _ = cls_for(det)
            chips.append(f'<i class="cell {cc}" title="determinism"></i>')
        chips_html = " ".join(chips) if chips else ""
        details += f"""
        <li>
          <a href="{html.escape(run["html_url"])}">
            <span class="wf">{html.escape(run["_wf"])} #{run["run_number"]}</span>
            <span class="badge {c}">{label}</span>
            <span class="meta">{fmt_date(run.get("created_at", ""))}</span>
            <span class="meta">{run.get("head_branch") or ""} · {n_ok} ok / {n_fail} fail</span>
            {chips_html}
          </a>
        </li>"""

    recent_html = f"""
    <h2>Recent runs</h2>
    <ul class="runs">{details}</ul>
    """

    return f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>openXC7 demo-projects test matrix</title>
<style>
  :root {{
    --bg: #0d1117; --panel: #161b22; --border: #30363d;
    --fg: #e6edf3; --muted: #8b949e;
    --ok: #3fb950; --fail: #f85149; --run: #d29922; --cancel: #8b949e;
  }}
  * {{ box-sizing: border-box; }}
  body {{
    margin: 0; padding: 24px; background: var(--bg); color: var(--fg);
    font: 14px/1.45 -apple-system, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
  }}
  a {{ color: var(--fg); text-decoration: none; }}
  a:hover {{ text-decoration: underline; }}
  h1 {{ font-size: 22px; margin: 0 0 4px; }}
  h2 {{ font-size: 16px; margin: 28px 0 10px; }}
  .hint {{ color: var(--muted); font-weight: normal; font-size: 12px; }}
  .sub {{ color: var(--muted); margin-bottom: 18px; }}
  .sub a {{ color: #58a6ff; }}
  .cards {{ display: flex; gap: 12px; flex-wrap: wrap; }}
  .card {{
    background: var(--panel); border: 1px solid var(--border); border-radius: 8px;
    padding: 12px 16px; min-width: 160px;
  }}
  .card-label {{ color: var(--muted); font-size: 12px; }}
  .card-value {{ font-size: 20px; margin-top: 4px; }}
  .badge {{
    display: inline-block; padding: 2px 10px; border-radius: 12px;
    font-size: 12px; font-weight: 600;
  }}
  .badge.ok {{ background: rgba(63,185,80,.15); color: var(--ok); }}
  .badge.fail {{ background: rgba(248,81,73,.15); color: var(--fail); }}
  .badge.running {{ background: rgba(210,153,34,.15); color: var(--run); }}
  .badge.cancel, .badge.skip {{ background: rgba(139,148,158,.15); color: var(--cancel); }}
  .badge.warn {{ background: rgba(210,153,34,.15); color: var(--run); }}
  .badge.none {{ background: rgba(139,148,158,.15); color: var(--cancel); }}
  .tablewrap {{ overflow-x: auto; background: var(--panel); border: 1px solid var(--border); border-radius: 8px; }}
  table {{ border-collapse: collapse; min-width: 100%; }}
  th, td {{ padding: 6px 8px; border-bottom: 1px solid var(--border); white-space: nowrap; }}
  thead th {{
    position: sticky; top: 0; background: var(--panel); z-index: 1;
    font-size: 12px; text-align: center; color: var(--muted);
  }}
  th.proj, td.proj {{ text-align: left; font-weight: 600; }}
  th.rate, td.rate {{ text-align: center; min-width: 110px; }}
  td.proj a:hover {{ text-decoration: underline; }}
  .runno {{ color: var(--fg); }}
  .rundate {{ color: var(--muted); }}
  .cell {{ display: inline-block; width: 14px; height: 14px; border-radius: 3px; }}
  .cell a {{ display: block; width: 100%; height: 100%; }}
  .cell.ok {{ background: var(--ok); }}
  .cell.fail {{ background: var(--fail); }}
  .cell.running {{ background: var(--run); }}
  .cell.cancel, .cell.skip {{ background: var(--cancel); }}
  .cell.warn {{ background: var(--run); }}
  .cell.none {{ background: transparent; }}
  .ratebar {{ position: relative; background: var(--border); border-radius: 4px; height: 14px; }}
  .ratefill {{ background: var(--ok); height: 100%; border-radius: 4px; }}
  .ratebar span {{ position: absolute; inset: 0; font-size: 10px; line-height: 14px; color: var(--bg); font-weight: 700; }}
  .legend {{ margin-top: 10px; color: var(--muted); display: flex; gap: 16px; flex-wrap: wrap; }}
  .legend i {{ margin-right: 5px; vertical-align: -2px; }}
  .runs {{ list-style: none; margin: 0; padding: 0; background: var(--panel); border: 1px solid var(--border); border-radius: 8px; }}
  .runs li {{ border-bottom: 1px solid var(--border); }}
  .runs li:last-child {{ border-bottom: none; }}
  .runs a {{ display: flex; gap: 12px; align-items: center; padding: 8px 12px; }}
  .runs .wf {{ font-weight: 600; min-width: 110px; }}
  .runs .meta {{ color: var(--muted); font-size: 12px; }}
  .footer {{ color: var(--muted); font-size: 12px; margin-top: 24px; }}
</style>
</head>
<body>
  <h1>Demo project test matrix</h1>
  <div class="sub">
    <a href="https://github.com/{REPO}">{REPO}</a> ·
    <a href="https://github.com/{REPO}/actions">Actions</a> ·
    generated {now} UTC
  </div>
  {cards}
  {matrix}
  {recent_html}
  <div class="footer">
    Regenerated when the smoke or heavy workflow completes, nightly, or on demand.
    Cell tooltips show run number, status and job link.
  </div>
</body>
</html>
"""


def render_readme(runs: list[dict], projects: list[str]) -> str:
    """Markdown snippet for the README matrix section (newest run left)."""
    table_runs = list(reversed(runs))[:8]

    header = (
        "| project |"
        + "".join(
            f" [{html.escape(r['_wf'])} #{r['run_number']}]"
            f"(https://github.com/{REPO}/actions/runs/{r['id']}) |"
            for r in table_runs
        )
        + " pass rate |"
    )
    sep = "| --- |" + " --- |" * (len(table_runs) + 1)

    rows = []
    for proj in projects:
        cells = []
        rate = []
        for run in table_runs:
            job = next((j for j in run["_jobs"] if j["name"] == proj), None)
            if job is None:
                cells.append("·")
                continue
            c, label = cls_for(job)
            if c == "ok":
                cells.append(f"[✔]({job['html_url']})")
                rate.append(1)
            elif c == "fail":
                cells.append(f"[✖]({job['html_url']})")
                rate.append(0)
            else:
                cells.append("…")
        pct = f"{round(100 * sum(rate) / len(rate))}%" if rate else "—"
        rows.append(
            f"| `{html.escape(proj)}` |"
            + "".join(f" {c} |" for c in cells)
            + f" {pct} |"
        )

    legend = (
        "✔ pass · ✖ fail · … running / cancelled · · not in run. "
        "Newest run left. Cells link to the workflow job."
    )
    return "\n".join([header, sep, *rows, "", legend, ""]) + "\n"


def update_readme(snippet: str) -> bool:
    """Replace the text between the matrix markers in README.md.

    Returns True if README.md changed.  Leaves the file untouched when
    the markers are absent (e.g. the repo has no README section yet).
    """
    path = Path("README.md")
    if not path.exists():
        return False
    text = path.read_text()
    if README_MARKER_START not in text or README_MARKER_END not in text:
        return False
    head, _, tail = text.partition(README_MARKER_END)
    head, _, _ = head.partition(README_MARKER_START)
    new = head + README_MARKER_START + "\n" + snippet + README_MARKER_END + tail
    if new == text:
        return False
    path.write_text(new)
    return True


def main() -> int:
    out_dir = Path(os.environ.get("OUT_DIR", OUT_DIR))
    out_dir.mkdir(parents=True, exist_ok=True)

    wf_names, runs, projects = build_data()
    if not runs:
        print("no tracked workflow runs found", file=sys.stderr)
        return 1

    (out_dir / "index.html").write_text(render(wf_names, runs, projects))
    changed = update_readme(render_readme(runs, projects))
    print(
        f"wrote {out_dir / 'index.html'}: {len(runs)} runs, "
        f"{len(projects)} projects; README {'updated' if changed else 'unchanged'}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
