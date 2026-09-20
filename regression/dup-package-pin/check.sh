#!/usr/bin/env bash
# #8: two IOs on one package pin must produce the pack-time warning in the
# names the user wrote.  nextpnr still fails (the design is unplaceable), so
# this case is expected-fail and the verdict is the warning's presence.
set -euo pipefail
d="$(dirname "$0")"
log="$d/nextpnr.log"

if ! grep -q "Conflicting outputs: IO .* and IO .* are both constrained to package pin 'B13'" "$log"; then
    echo "FAIL: missing pack-time duplicate-package-pin warning"
    exit 1
fi
echo "ok: duplicate package pin B13 warned about at pack time"
