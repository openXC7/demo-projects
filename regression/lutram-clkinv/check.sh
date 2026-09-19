#!/usr/bin/env bash
# #201: a LUT-RAM with an inverted write clock must program the slice's CLKINV.
#
# "It built" proves nothing here.  Pre-fix the flow packed, placed, routed and
# wrote a FASM that was byte-identical to the non-inverted design -- the wrong
# clock edge reached silicon with a clean exit 0 -- so assert the bit:
#   - the SLICEM half-slice holding the RAM programs CLKINV and not NOCLKINV,
#   - the 64x1 RAM mode is still there: one LUT-RAM, no SMALL (that is the
#     32-deep mode) and no WA7USED/WA8USED (the 128/256-deep write-address mux).
set -euo pipefail

fasm="${FASM:?FASM is not set}"
fail() { echo "FAIL: $*"; exit 1; }

clkinv=$(grep -cE '^[^#[:space:]].*\.SLICEM_X0\.CLKINV$' "$fasm" || true)
[ "$clkinv" -eq 1 ] || fail "expected CLKINV on the SLICEM half-slice holding the RAM, got $clkinv"

if grep -qE '^[^#[:space:]].*\.SLICEM_X0\.NOCLKINV$' "$fasm"; then
    fail "SLICEM_X0 programs NOCLKINV as well as CLKINV"
fi

ram=$(grep -cE '^[^#[:space:]].*\.SLICEM_X0\.[A-D]LUT\.RAM$' "$fasm" || true)
[ "$ram" -eq 1 ] || fail "expected 1 LUT-RAM in SLICEM_X0, got $ram"

if grep -qE '^[^#[:space:]].*\.SLICEM_X0\.[A-D]LUT\.SMALL$' "$fasm"; then
    fail "SMALL set: that is the 32-deep RAM mode, this design is 64 deep"
fi

if grep -qE '\.(WA7USED|WA8USED)$' "$fasm"; then
    fail "WA7USED/WA8USED programmed: 128/256-deep write-address mux on a 64-deep RAM"
fi

echo "ok: SLICEM_X0 CLKINV with a 64x1 LUT-RAM (no NOCLKINV, no SMALL, no WA7/WA8USED)"
