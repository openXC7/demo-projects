#!/usr/bin/env bash
# The write enables of a RAMB18E1 in TDP x18 sit on site pins in pairs, as Vivado places them:
# WEA[0] on WEA0/WEA1, WEA[1] on WEA2/WEA3, WEBWE[0] on WEBWE0/WEBWE1, WEBWE[1] on WEBWE2/WEBWE3.
# Pre-fix the flow exited 0 with port B's site pins carrying wb0, wb1, wb0, wb1.  Walk the routed
# JSON: the net on each WE site pin of the block must come from the pad named below.
set -euo pipefail
exec python3 - "${CASE_DIR:-$(dirname "$0")}/top_routed.json" <<'PY'
import json, sys

want = {"WEA0": "wa0", "WEA1": "wa0", "WEA2": "wa1", "WEA3": "wa1",
        "WEBWE0": "wb0", "WEBWE1": "wb0", "WEBWE2": "wb1", "WEBWE3": "wb1"}
net = json.load(open(sys.argv[1]))
mod = next(m for m in net["modules"].values() if m.get("attributes", {}).get("top"))
port_of = {d["bits"][0]: p for p, d in mod["ports"].items() if len(d["bits"]) == 1}
pad_of = {}
for c in mod["cells"].values():
    pad = c["connections"].get("PAD")
    if pad and pad[0] in port_of:
        for p, bits in c["connections"].items():
            if c["port_directions"].get(p) == "output":
                pad_of[bits[0]] = port_of[pad[0]]
rams = [(n, c) for n, c in mod["cells"].items() if c["type"] == "RAMB18E1_RAMB18E1"]
if len(rams) != 1:
    sys.exit(f"FAIL: expected one RAMB18E1_RAMB18E1, got {len(rams)}")
name, ram = rams[0]
bad = []
for pin, pad in want.items():
    bits = ram["connections"].get(pin)
    got = pad_of.get(bits[0], repr(bits[0])) if bits else "unconnected"
    if got != pad:
        bad.append(f"{pin}={got} (want {pad})")
if bad:
    sys.exit("FAIL: " + ", ".join(bad))
print("ok: WEA0..3 = wa0 wa0 wa1 wa1, WEBWE0..3 = wb0 wb0 wb1 wb1")
PY
