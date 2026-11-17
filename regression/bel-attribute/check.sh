#!/usr/bin/env bash
# The BEL name nextpnr reports (<site>/<bel>) used to stop the run with
# "No Bel named", and a flip-flop paired with its LUT used to be placed
# with the LUT whatever its BEL said. The routed JSON must put it there.
set -euo pipefail
python3 - "${CASE_DIR:?}/top_routed.json" <<'PY'
import json, sys
cells = json.load(open(sys.argv[1]))["modules"]["top"]["cells"]
bel = cells["ff"]["attributes"].get("NEXTPNR_BEL")
if bel != "SLICE_X0Y0/BFF":
    print(f"FAIL: ff is at {bel}, its BEL is SLICE_X0Y0/BFF")
    sys.exit(1)
print("ok: ff at SLICE_X0Y0/BFF, as its BEL says")
PY
