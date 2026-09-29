#!/usr/bin/env bash
# openXC7/nextpnr#56: a RAM32X2S must pack into ONE LUT position, both bits
# of the cell there -- bit 0 (INIT_00) in the O5 half and bit 1 (INIT_01)
# in the O6 half of the same INIT[63:0] -- mirroring how the RAM32M path
# builds a letter.
#
# "It built" is not enough: the pre-#56 failure was the placer error, but a
# partial fix could still emit a plausible-looking FASM with the two bits in
# two LUTs (halving site capacity), or with both INIT params collapsed into
# one half.  Assert the structure instead:
#   - exactly 1 LUT-as-RAM feature (one cell = one LUT position),
#   - the split INIT in that LUT: upper 32 bits = INIT_01, lower 32 = INIT_00,
#   - SMALL set,
#   - no WA7USED/WA8USED: those are the 128/256-deep write-address muxes.
set -euo pipefail

fasm="${FASM:?FASM is not set}"
fail() { echo "FAIL: $*"; exit 1; }

mapfile -t ram_lines < <(grep -E '^[^#[:space:]].*\.SLICEM_X[01]\.[A-D]LUT\.RAM$' "$fasm" || true)
[ "${#ram_lines[@]}" -eq 1 ] || \
    fail "expected 1 SLICEM LUT-as-RAM feature (one RAM32X2S = one LUT position), got ${#ram_lines[@]}"

lut="${ram_lines[0]%.RAM}"
init="$(grep -F "${lut}.INIT[63:0] = " "$fasm" | sed "s/.*= 64'b//" | tr -d '[:space:]')"
expected="00010010001101000101011001111000"   # INIT_01 = 32'h12345678 (O6 half)
expected+="11001010111111101011101010111110"  # INIT_00 = 32'hCAFEBABE (O5 half)
[ "$init" = "$expected" ] || \
    fail "${lut} INIT[63:0] is ${init:-missing}, expected ${expected} (INIT_01 upper, INIT_00 lower)"

grep -qxF "${lut}.SMALL" "$fasm" || fail "${lut}.SMALL not set"

if grep -qE '\.(WA7USED|WA8USED)' "$fasm"; then
    fail "WA7USED/WA8USED programmed: that is the 128/256-deep write-address mux"
fi

echo "ok: one LUT-RAM for the RAM32X2S, INIT split 12345678/CAFEBABE across the O6/O5 halves"
