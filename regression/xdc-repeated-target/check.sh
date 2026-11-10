#!/usr/bin/env bash
# The same port named twice in one selector used to be applied twice and
# stop with "found multiple". One clock of 10.00 ns must reach the net.
set -euo pipefail
log="${CASE_DIR:?}/nextpnr.log"
grep -q "found multiple" "$log" && { echo "FAIL: still reporting found multiple"; exit 1; }
grep -qE "^Info: Max frequency for clock .*\(PASS at 100\.00 MHz\)$" "$log" || {
    echo "FAIL: the 10.00 ns clock did not reach the net"
    exit 1
}
echo "ok: repeated name kept once, clock at 100 MHz"
