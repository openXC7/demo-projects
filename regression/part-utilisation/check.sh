#!/usr/bin/env bash
# The available count of each kind must be what Vivado reports available on
# an xc7a35tcsg324, both in the "Device utilisation" table of nextpnr.log
# and in the JSON --report (the file apio reads). PAD is the user I/O, which
# is Vivado's Bonded IOB: the package's GTP and XADC pads are not in it.
set -euo pipefail
case_dir="${CASE_DIR:?CASE_DIR is not set}"
log="$case_dir/nextpnr.log"
report="$case_dir/report.json"
[ -f "$log" ] || { echo "FAIL: no $log"; exit 1; }
[ -s "$report" ] || { echo "FAIL: no $report"; exit 1; }
fail=0
wants="SLICE_LUTX=20800 SLICE_FFX=41600 CARRY4=8150 RAMB36E1=50 RAMB18E1=100 DSP48E1=90 IOB33_INBUF_EN=210 IOB33_OUTBUF=210 ILOGICE3_IFF=210 OLOGICE3_OUTFF=210 PAD=210"
for want in $wants; do
    kind=${want%=*}
    n=${want#*=}
    got=$(awk -v k="$kind:" '$2 == k { s = $0; sub(/.*\//, "", s); split(s, a, " "); print a[1]; exit }' "$log")
    if [ "$got" != "$n" ]; then
        echo "FAIL: $kind available ${got:-missing}, expected $n"
        fail=1
    else
        echo "ok: $kind available $n"
    fi
done
python3 - "$report" $wants << 'PY'
import json
import sys

report = json.load(open(sys.argv[1]))
rows = report.get("utilization") or {}
fail = 0
for want in sys.argv[2:]:
    kind, _, n = want.partition("=")
    got = rows.get(kind, {}).get("available")
    if str(got) != n:
        print("FAIL: %s available %s in the report, expected %s" % (kind, got if got is not None else "missing", n))
        fail = 1
    else:
        print("ok: %s available %s in the report" % (kind, n))
sys.exit(fail)
PY
json_rc=$?
if [ "$json_rc" -ne 0 ]; then
    fail=1
fi
exit $fail
