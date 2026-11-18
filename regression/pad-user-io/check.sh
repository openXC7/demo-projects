#!/usr/bin/env bash
# PAD on xc7a35tcpg236-1 is the user I/O: 106 available, and the two
# ports of this design used. 120 is every bonded pad, GTP and XADC
# included, which is what main reports.
set -euo pipefail
case_dir="${CASE_DIR:?CASE_DIR is not set}"
report="$case_dir/report.json"
[ -s "$report" ] || { echo "FAIL: no $report"; exit 1; }
python3 - "$report" << 'PY'
import json
import sys

report = json.load(open(sys.argv[1]))
rows = report.get("utilization") or {}
pad = rows.get("PAD")
if pad is None:
    print("FAIL: no PAD row")
    sys.exit(1)
used = int(pad["used"])
available = int(pad["available"])
fail = 0
if available != 106:
    print("FAIL: PAD available %d, expected 106" % available)
    fail = 1
else:
    print("ok: PAD available 106")
if used != 2:
    print("FAIL: PAD used %d, expected 2" % used)
    fail = 1
else:
    print("ok: PAD used 2")
if used < 0 or used > available:
    print("FAIL: PAD used %d available %d" % (used, available))
    fail = 1
else:
    print("ok: PAD %d/%d" % (used, available))
sys.exit(fail)
PY
