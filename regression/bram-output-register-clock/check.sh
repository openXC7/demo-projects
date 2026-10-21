#!/usr/bin/env bash
# Every block RAM half with DOB_REG gets on row 0 of its INT tiles the global
# clock of row 1 (CLKBWRCLK), and every half with DOA_REG gets on row 4 the
# global of row 3 (CLKARDCLK). Row k is INT_[LR]_X<x>Y<y+k> beside
# BRAM_[LR]_X<x>Y<y>; wire CLK_L0/CLK0 feeds RAMB18_Y0, CLK_L1/CLK1 feeds
# RAMB18_Y1. Pre-fix the flow exited 0 with nothing on rows 0 and 4.
set -euo pipefail
exec python3 - "${FASM:?}" <<'PY'
import re
import sys

text = open(sys.argv[1]).read().splitlines()
feats = {ln.split("#", 1)[0].strip() for ln in text if ln.strip() and not ln.strip().startswith("#")}

halves = {}
for f in feats:
    m = re.match(r"^BRAM_([LR])_X(\d+)Y(\d+)\.RAMB18_(Y[01])\.IN_USE$", f)
    if m:
        halves.setdefault((m.group(1), int(m.group(2)), int(m.group(3))), []).append(m.group(4))

clk = {}
for f in feats:
    m = re.match(r"^(INT_[LR]_X\d+Y\d+)\.(CLK_L0|CLK_L1|CLK0|CLK1)\.(\S+)$", f)
    if m:
        clk[(m.group(1), m.group(2)[-1])] = m.group(3)

fails, oks = [], []
for (side, x, y), hs in sorted(halves.items()):
    for h in sorted(hs):
        wire = h[-1]
        for reg, row, data_row in (("DOB_REG", 0, 1), ("DOA_REG", 4, 3)):
            if f"BRAM_{side}_X{x}Y{y}.RAMB18_{h}.{reg}" not in feats:
                continue
            got = clk.get((f"INT_{side}_X{x}Y{y + row}", wire))
            want = clk.get((f"INT_{side}_X{x}Y{y + data_row}", wire))
            line = f"BRAM_{side}_X{x}Y{y} {h} {reg}: row {row} {got}, row {data_row} {want}"
            if got is not None and got == want and got.startswith("GCLK"):
                oks.append((reg, line))
            else:
                fails.append(line)
if fails:
    sys.exit("FAIL: output register clock missing: " + "; ".join(fails))
n_dob = sum(1 for reg, _ in oks if reg == "DOB_REG")
n_doa = sum(1 for reg, _ in oks if reg == "DOA_REG")
if n_dob < 2 or n_doa < 1:
    sys.exit(f"FAIL: expected DOB_REG on both halves of the RAMB36 and DOA_REG on the RAMB18, got {n_dob} and {n_doa}")
print(f"ok: output register clocks on rows 0 and 4 ({n_dob} DOB_REG, {n_doa} DOA_REG)")
PY
