#!/usr/bin/env bash
# `{clk {x}` ends in `}` so the outer pair looks closed, and the inner brace
# does not. That used to look up a name `{x` and continue.
set -euo pipefail
log="${CASE_DIR:?}/nextpnr.log"
grep -q "unbalanced brace" "$log" || { echo "FAIL: missing the unbalanced-brace error"; exit 1; }
grep -q "(on line 2)" "$log" || { echo "FAIL: the error does not name the line"; exit 1; }
echo "ok: unclosed brace rejected on line 2"
