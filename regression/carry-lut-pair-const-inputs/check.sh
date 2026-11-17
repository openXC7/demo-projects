#!/usr/bin/env bash
# openXC7/nextpnr#173.  Before the fix the flow stopped in the placer, so a
# FASM is already the main test.  This checks that the run exercised the case:
# the S LUT kept its three tied-low inputs (synthesis did not fold them away),
# it sits in a 6LUT, and those three inputs share one physical pin
# (X_ORIG_PORT_A<n> = "I0 I1 I2").
set -euo pipefail
: "${CASE_DIR:?run.sh must export CASE_DIR}"
python3 - "$CASE_DIR/top_routed.json" << 'PY'
import json, sys
cells = {}
for m in json.load(open(sys.argv[1]))["modules"].values():
    cells.update(m["cells"])
lut = [c for n, c in cells.items() if n == "s_lut" or n.endswith(".s_lut") or n.endswith("/s_lut")]
if len(lut) != 1:
    sys.exit("FAIL: s_lut not found in the routed JSON")
attrs = lut[0]["attributes"]
bel = attrs.get("NEXTPNR_BEL", "")
pins = {k: v for k, v in attrs.items() if k.startswith("X_ORIG_PORT_A")}
print("s_lut", bel, pins)
if not bel.endswith("6LUT"):
    sys.exit("FAIL: s_lut is not in a 6LUT")
shared = any(sorted(str(v).split()) == ["I0", "I1", "I2"] for v in pins.values())
if not shared:
    sys.exit("FAIL: no pin carries I0 I1 I2: the tied-low inputs were folded or split")
print("ok: the tied-low inputs share one pin of the 6LUT")
PY
