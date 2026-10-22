#!/usr/bin/env bash
# Each BUFGMUX* instance is a BUFGCTRL that carries exactly the site bits
# Vivado 2026.1 writes for it (xc7a200tfbg484-2, same placement): BUFGMUX and
# BUFGMUX_1 switch on the clock enables (ZINV_CE0 clear: CE0 = S inverted),
# BUFGMUX_CTRL on the selects (ZINV_S0 clear: S0 = S inverted); IGNORE0/1 low
# leaves IS_IGNORE*_INVERTED clear and CLK_SEL_TYPE "ASYNC" sets both;
# INIT_OUT only on BUFGMUX_1. The sel pad reaches both CE pins (or both S
# pins), and I0/I1 carry the clk0/clk1 pads; each pad enters the fabric
# through its input buffer (PAD -> OUT) in the routed JSON.
# The instance -> site map comes from the routed JSON (NEXTPNR_BEL); FASM
# names the site by its index inside the tile: BUFGCTRL_X0Y0..15 in
# CLK_BUFG_BOT_R, BUFGCTRL_X0Y16..31 in CLK_BUFG_TOP_R.
set -euo pipefail
exec python3 - "${FASM:?}" "${CASE_DIR:?}/top_routed.json" <<'PY'
import json
import re
import sys

fasm, routed = sys.argv[1:3]
feats = set()
for ln in open(fasm):
    ln = ln.split("#", 1)[0].strip()
    if ln:
        feats.add(ln.split()[0])

WANT = {
    "m_sync": ({"IN_USE", "ZINV_CE1", "ZINV_S0", "ZINV_S1"}, ("CE0", "CE1")),
    "m_one": ({"IN_USE", "INIT_OUT", "ZINV_CE1", "ZINV_S0", "ZINV_S1"}, ("CE0", "CE1")),
    "m_ctrl": ({"IN_USE", "ZINV_CE0", "ZINV_CE1", "ZINV_S1"}, ("S0", "S1")),
    "m_async": ({"IN_USE", "IS_IGNORE0_INVERTED", "IS_IGNORE1_INVERTED", "ZINV_CE1", "ZINV_S0", "ZINV_S1"},
                ("CE0", "CE1")),
}

cells, ports = {}, {}
for m in json.load(open(routed))["modules"].values():
    ports.update(m["ports"])
    for name, c in m["cells"].items():
        cells[name.split(".")[-1]] = c

pad_net = {}
for c in cells.values():
    for port, p in ports.items():
        if c["connections"].get("PAD") == p["bits"] and "OUT" in c["connections"]:
            pad_net[port] = c["connections"]["OUT"]
sel, clk0, clk1 = (pad_net.get(p) for p in ("sel", "clk0", "clk1"))

fails, oks = [], []
for inst, (want, sel_pins) in WANT.items():
    c = cells.get(inst)
    if c is None or c["type"] != "BUFGCTRL":
        fails.append(f"{inst}: no BUFGCTRL cell (got {c and c['type']})")
        continue
    m = re.match(r"^BUFGCTRL_X0Y(\d+)/", c["attributes"].get("NEXTPNR_BEL", ""))
    if not m:
        fails.append(f"{inst}: not placed on a BUFGCTRL ({c['attributes'].get('NEXTPNR_BEL')})")
        continue
    y = int(m.group(1))
    tile = "CLK_BUFG_BOT_R" if y < 16 else "CLK_BUFG_TOP_R"
    pat = re.compile(rf"^{tile}_X\d+Y\d+\.BUFGCTRL\.BUFGCTRL_X0Y{y % 16}\.(.+)$")
    got = {mm.group(1) for f in feats for mm in [pat.match(f)] if mm}
    a, b = (c["connections"].get(p) for p in sel_pins)
    i0, i1 = (c["connections"].get(p) for p in ("I0", "I1"))
    if got != want:
        fails.append(f"{inst} (BUFGCTRL_X0Y{y}): extra {sorted(got - want)}, missing {sorted(want - got)}")
    elif not sel or not a == b == sel:
        fails.append(f"{inst}: the sel pad {sel} does not reach both {sel_pins[0]} and {sel_pins[1]} ({a}, {b})")
    elif not clk0 or not clk1 or (i0, i1) != (clk0, clk1):
        fails.append(f"{inst}: I0/I1 are {i0}, {i1}, not the clk0/clk1 pads {clk0}, {clk1}")
    else:
        oks.append(f"{inst}=X0Y{y}")
if fails:
    sys.exit("FAIL: " + "; ".join(fails))
print("ok: BUFGCTRL bits as Vivado writes them for " + ", ".join(oks))
PY
