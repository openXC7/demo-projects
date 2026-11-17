#!/usr/bin/env bash
# Every row of the JSON --report must have 0 <= used <= available.
# The log already hides a type with nothing available; this is the file apio reads.
set -euo pipefail
case_dir="${CASE_DIR:?CASE_DIR is not set}"
report="$case_dir/report.json"
[ -s "$report" ] || { echo "FAIL: no $report"; exit 1; }
python3 - "$report" << 'PY'
import json
import sys

report = json.load(open(sys.argv[1]))
rows = report.get("utilization") or {}
if not rows:
    print("FAIL: utilization is empty")
    sys.exit(1)
fail = 0
for name in sorted(rows):
    used = int(rows[name]["used"])
    available = int(rows[name]["available"])
    if used < 0 or used > available:
        print("FAIL: %s used %d available %d" % (name, used, available))
        fail = 1
    else:
        print("ok: %s %d/%d" % (name, used, available))
sys.exit(fail)
PY
