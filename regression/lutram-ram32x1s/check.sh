#!/usr/bin/env bash
# openXC7/nextpnr#56: a RAM32X1S packs as a single 6LUT-half RAMD32.  Its
# 32-bit INIT must land in BOTH halves of the LUT: A6 is unconnected in the
# 32-deep mode, and equal halves make the read independent of whichever
# level the silicon floats it to.
#
# "It built" is not enough: the pre-#56 failure was the placer error, but a
# partial fix could emit the INIT in only one half -- which reads back wrong
# on silicon whenever the unconnected A6 resolves to the empty half.  Assert
# the structure instead:
#   - exactly 1 LUT-as-RAM feature,
#   - the INIT duplicated: upper 32 bits = lower 32 bits = 32'hDEADBEEF,
#   - SMALL set,
#   - no WA7USED/WA8USED: those are the 128/256-deep write-address muxes.
set -euo pipefail

fasm="${FASM:?FASM is not set}"
fail() { echo "FAIL: $*"; exit 1; }

mapfile -t ram_lines < <(grep -E '^[^#[:space:]].*\.SLICEM_X[01]\.[A-D]LUT\.RAM$' "$fasm" || true)
[ "${#ram_lines[@]}" -eq 1 ] || \
    fail "expected 1 SLICEM LUT-as-RAM feature, got ${#ram_lines[@]}"

lut="${ram_lines[0]%.RAM}"
init="$(grep -F "${lut}.INIT[63:0] = " "$fasm" | sed "s/.*= 64'b//" | tr -d '[:space:]')"
deadbeef="11011110101011011011111011101111"
[ "$init" = "${deadbeef}${deadbeef}" ] || \
    fail "${lut} INIT[63:0] is ${init:-missing}, expected DEADBEEF in BOTH halves (A6-independent read)"

grep -qxF "${lut}.SMALL" "$fasm" || fail "${lut}.SMALL not set"

if grep -qE '\.(WA7USED|WA8USED)' "$fasm"; then
    fail "WA7USED/WA8USED programmed: that is the 128/256-deep write-address mux"
fi

echo "ok: one LUT-RAM for the RAM32X1S, DEADBEEF in both halves (A6-independent read)"
