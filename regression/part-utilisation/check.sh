#!/usr/bin/env bash
# The "Device utilisation" table of nextpnr.log: the available count of each
# kind must be what Vivado reports available on an xc7a35tcsg324.
set -euo pipefail
case_dir="${CASE_DIR:?CASE_DIR is not set}"
log="$case_dir/nextpnr.log"
[ -f "$log" ] || { echo "FAIL: no $log"; exit 1; }
fail=0
for want in SLICE_LUTX=20800 SLICE_FFX=41600 CARRY4=8150 RAMB36E1=50 RAMB18E1=100 \
            DSP48E1=90 IOB33_INBUF_EN=210 IOB33_OUTBUF=210 ILOGICE3_IFF=210 \
            OLOGICE3_OUTFF=210 PAD=212; do
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
exit $fail
