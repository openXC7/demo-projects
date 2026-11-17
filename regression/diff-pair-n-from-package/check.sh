#!/usr/bin/env bash
# With only clk_p on R4 the run used to stop with "unconstrained IO not
# supported (pad clk_n)". clk_n must be on T4 (IOB_X1Y123), the N pin of
# the pair of R4 (IOB_X1Y124).
set -euo pipefail
python3 - "${CASE_DIR:?}/top_routed.json" <<'PY'
import json, sys
cells = json.load(open(sys.argv[1]))["modules"]["top"]["cells"]
p = cells["clk_p"]["attributes"].get("NEXTPNR_BEL")
n = cells["clk_n"]["attributes"].get("NEXTPNR_BEL")
if p != "IOB_X1Y124/IOB33M.PAD" or n != "IOB_X1Y123/IOB33S.PAD":
    print(f"FAIL: clk_p at {p}, clk_n at {n}")
    sys.exit(1)
print("ok: clk_p on R4 (IOB_X1Y124), clk_n on T4 (IOB_X1Y123)")
PY
