#!/usr/bin/env bash
# ODIV2 of the IBUFDS_GTE2 reaches the BUFGCE, which is packed as a BUFGCTRL:
# in the routed JSON its I0 is the ODIV2 net, that net leaves the buffer
# through the MGTCLKOUT wire (the pip MGTCLKOUT <- ODIV2 in its ROUTING), and
# CE0 is the en pad. The site carries exactly the BUFGCTRL bits Vivado 2026.1
# writes for this BUFGCE (xc7a200tfbg484-2, same placement). Nothing here reads
# the ODIV2 select bit of the GT tile: that needs a prjxray-db that has it.
# FASM names the site by its index inside the tile: BUFGCTRL_X0Y0..15 in
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

WANT = {"IN_USE", "IS_IGNORE1_INVERTED", "ZINV_CE0", "ZINV_S0"}

cells, ports, nets = {}, {}, {}
for m in json.load(open(routed))["modules"].values():
    ports.update(m["ports"])
    nets.update(m["netnames"])
    for name, c in m["cells"].items():
        cells[name.split(".")[-1]] = c

pad_net = {}
for c in cells.values():
    for port, p in ports.items():
        if c["connections"].get("PAD") == p["bits"] and "OUT" in c["connections"]:
            pad_net[port] = c["connections"]["OUT"]

ib, bg = cells.get("refclk_buf"), cells.get("odiv2_bufg")
if ib is None or bg is None:
    sys.exit(f"FAIL: cells refclk_buf / odiv2_bufg not found ({ib and ib['type']}, {bg and bg['type']})")
if bg["type"] != "BUFGCTRL":
    sys.exit(f"FAIL: odiv2_bufg is a {bg['type']}, not a BUFGCTRL")
odiv2 = ib["connections"].get("ODIV2")
if not odiv2 or bg["connections"].get("I0") != odiv2:
    sys.exit(f"FAIL: BUFGCTRL I0 is {bg['connections'].get('I0')}, not the ODIV2 net {odiv2}")
routing = next((n["attributes"].get("ROUTING", "") for n in nets.values() if n["bits"] == odiv2), "")
if not re.search(r"_MGTCLKOUT/IBUFDS_GTPE2_[01]_ODIV2;", routing):
    sys.exit("FAIL: the ODIV2 net is not routed through MGTCLKOUT")
en = pad_net.get("en")
if not en or bg["connections"].get("CE0") != en:
    sys.exit(f"FAIL: CE0 is {bg['connections'].get('CE0')}, not the en pad {en}")
m = re.match(r"^BUFGCTRL_X0Y(\d+)/", bg["attributes"].get("NEXTPNR_BEL", ""))
if not m:
    sys.exit(f"FAIL: odiv2_bufg is not placed on a BUFGCTRL ({bg['attributes'].get('NEXTPNR_BEL')})")
y = int(m.group(1))
tile = "CLK_BUFG_BOT_R" if y < 16 else "CLK_BUFG_TOP_R"
pat = re.compile(rf"^{tile}_X\d+Y\d+\.BUFGCTRL\.BUFGCTRL_X0Y{y % 16}\.(.+)$")
got = {mm.group(1) for f in feats for mm in [pat.match(f)] if mm}
if got != WANT:
    sys.exit(f"FAIL: BUFGCTRL_X0Y{y}: extra {sorted(got - WANT)}, missing {sorted(WANT - got)}")
print(f"ok: ODIV2 -> MGTCLKOUT -> BUFGCTRL_X0Y{y} I0, CE0 = en, bits as Vivado writes them")
PY
