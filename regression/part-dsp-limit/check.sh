#!/usr/bin/env bash
# An xc7a35t offers 90 DSP48E1.  91 must stop the flow with a message that
# names both numbers; before the fix they placed and routed (exit 0).
set -euo pipefail
case_dir="${CASE_DIR:?CASE_DIR is not set}"
log="$case_dir/nextpnr.log"
[ -f "$log" ] || { echo "FAIL: no $log"; exit 1; }
grep -qE 'The design needs 91 DSP48E1; xc7a35t[a-z0-9-]* has 90\.' "$log" || {
    echo "FAIL: missing the DSP48E1 count error"
    exit 1
}
echo "ok: 91 DSP48E1 rejected on an xc7a35t, which has 90"
