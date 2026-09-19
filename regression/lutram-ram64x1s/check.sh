#!/usr/bin/env bash
# #195: a 64-deep distributed RAM must be packed into SLICEM LUTs in 64x1 mode.
#
# "It built" is not enough here: the pre-fix failure was a hard pack error, but
# a partial fix could still emit a plausible-looking FASM (e.g. one LUT-RAM for
# the whole memory, or the 128-deep write-address mux programmed on a 64-deep
# memory, which reads the wrong half of the LUT contents on silicon).  Assert
# the structure instead:
#   - exactly 8 LUT-as-RAM features (one per data bit of the 64 x 8 memory),
#   - in exactly 2 SLICEM sites, 4 LUTs per site (a slice has four LUTs),
#   - no WA7USED/WA8USED: those are the 128/256-deep write-address muxes.
set -euo pipefail

fasm="${FASM:?FASM is not set}"
fail() { echo "FAIL: $*"; exit 1; }

mapfile -t ram_lines < <(grep -E '^[^#[:space:]].*\.SLICEM_X[01]\.[A-D]LUT\.RAM$' "$fasm" || true)
[ "${#ram_lines[@]}" -eq 8 ] || \
    fail "expected 8 SLICEM LUT-as-RAM features (one per data bit), got ${#ram_lines[@]}"

mapfile -t sites < <(printf '%s\n' "${ram_lines[@]}" | sed -E 's/\.[A-D]LUT\.RAM$//' | sort -u)
[ "${#sites[@]}" -eq 2 ] || \
    fail "expected the 8 LUT-RAMs in 2 SLICEM sites, got ${#sites[@]}: ${sites[*]}"

for s in "${sites[@]}"; do
    n=$(printf '%s\n' "${ram_lines[@]}" | grep -c "^${s}\." || true)
    [ "$n" -eq 4 ] || fail "$s holds $n LUT-RAMs, expected 4"
done

if grep -qE '\.(WA7USED|WA8USED)' "$fasm"; then
    fail "WA7USED/WA8USED programmed: that is the 128/256-deep write-address mux"
fi

echo "ok: 8 LUT-RAMs in 2 sites, 64x1 mode (no WA7USED/WA8USED)"
