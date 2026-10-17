#!/usr/bin/env bash
# e229044c: an ODELAYE2 on a high-range bank must be rejected for what it is,
# a bank without ODELAY, not as an unsupported cell type.  nextpnr still fails
# (there is no ODELAY site), so this case is expected-fail and the verdict is
# the message.  Pre-fix: "has DATAOUT connected to unsupported cell type
# IOB33_OUTBUF".
set -euo pipefail
d="$(dirname "$0")"
log="$d/nextpnr.log"
if grep -q "unsupported cell type IOB33_OUTBUF" "$log"; then
    echo "FAIL: ODELAYE2 rejected as an unsupported cell type"
    exit 1
fi
grep -q "is located on a high range bank. High range banks do not have ODELAY" "$log" || {
    echo "FAIL: missing the high-range-bank ODELAY error"
    exit 1
}
echo "ok: ODELAYE2 on bank 16 rejected because high-range banks have no ODELAY"
