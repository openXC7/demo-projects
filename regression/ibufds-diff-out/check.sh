#!/usr/bin/env bash
# IBUFDS_DIFF_OUT on E3/D3 (RIOB33_X43Y75, LVDS_25). Before the fix the flow
# exits 0 and writes a bitstream whose IOB has neither input buffer: no
# IN_DIFF, no IN_ONLY, and the pad never reaches a BUFG. OB is the N-half
# input buffer, so the routed netlist must carry that cell and a load of it.
set -euo pipefail
exec python3 - "${FASM:?}" "${CASE_DIR:?}/top_routed.json" <<'PY'
import json
import re
import sys

fasm, routed = sys.argv[1:3]
TILE = "RIOB33_X43Y75"
feats = []
for ln in open(fasm):
    ln = ln.split("#", 1)[0].strip()
    if ln:
        feats.append(ln.split()[0])

def has(half, kind):
    return any(f.startswith(f"{TILE}.{half}.") and f.endswith(kind) for f in feats)

missing = []
for half in ("IOB_Y0", "IOB_Y1"):
    if not has(half, "IN_DIFF"):
        missing.append(f"{half}.IN_DIFF")
    if not has(half, "IN_ONLY"):
        missing.append(f"{half}.IN_ONLY")
clock = [f for f in feats if re.search(r"CLK_BUFG_BUFGCTRL\d+_I0\..*CK_MUXED", f)]
if not clock:
    missing.append("pad clock into a BUFG (CK_MUXED)")
if missing:
    sys.exit("FAIL: bitstream has no input buffer: " + ", ".join(missing))

cells = {}
for m in json.load(open(routed))["modules"].values():
    for name, c in m["cells"].items():
        cells[name] = c

def bel(c):
    return c.get("attributes", {}).get("NEXTPNR_BEL", "")

# NEXTPNR_BEL is the site and the bel (IOB_X1Y76/IOB33M.INBUF_EN). The tile
# name is in the FASM, which was checked above, not in this attribute.
masters = [c for c in cells.values() if c.get("type") == "IOB33M_INBUF_EN" and bel(c).startswith("IOB_X1Y76/")]
slaves = [c for c in cells.values() if c.get("type") == "IOB33S_INBUF_EN" and bel(c).startswith("IOB_X1Y75/")]
if len(masters) != 1 or len(slaves) != 1:
    sys.exit(f"FAIL: pair buffers master={len(masters)} slave={len(slaves)}")
ob = slaves[0]["connections"].get("OUT")
if not ob:
    sys.exit("FAIL: N-side input buffer has no OUT net")
loads = 0
for c in cells.values():
    if c is slaves[0]:
        continue
    for bits in c["connections"].values():
        if bits == ob:
            loads += 1
if loads < 1:
    sys.exit("FAIL: OB is not loaded; the complement buffer does not reach the fabric")
print(f"ok: {TILE} both halves IN_DIFF and IN_ONLY, OB loaded, clock pip {clock[0]}")
PY
