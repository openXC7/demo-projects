#!/usr/bin/env bash
# A second positional word used to be dropped. The reader must stop on that
# line instead of constraining only the first name.
set -euo pipefail
log="${CASE_DIR:?}/nextpnr.log"
grep -q "too many positional options when parsing 'extra' (on line 2)" "$log" || {
    echo "FAIL: missing the extra-word error"
    exit 1
}
echo "ok: extra positional word rejected on line 2"
