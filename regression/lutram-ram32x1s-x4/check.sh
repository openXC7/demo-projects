#!/usr/bin/env bash
# Four RAM32X1S with the same clock, WE and address (the RAM32X1S fix posted
# on openXC7/nextpnr#56).  Before it the placer stopped with "Unable to find
# legal placement ... SLICE_LUTX" as soon as a second RAM32X1S joined the
# first; a partial fix could still spread them over several slices or put
# one in the 64-deep mode.  Assert the shape Vivado gives the same cells:
#   - exactly 4 LUT-as-RAM features, all in ONE SLICEM,
#   - SMALL on each of those LUTs,
#   - each INIT duplicated in both halves (A6 is unconnected in the 32-deep
#     mode), and the four INITs are the four of top.v,
#   - no WA7USED/WA8USED: those are the 128/256-deep write-address muxes.
set -euo pipefail

fasm="${FASM:?FASM is not set}"
fail() { echo "FAIL: $*"; exit 1; }

mapfile -t ram_lines < <(grep -E '^[^#[:space:]].*\.SLICEM_X[01]\.[A-D]LUT\.RAM$' "$fasm" || true)
[ "${#ram_lines[@]}" -eq 4 ] || \
    fail "expected 4 SLICEM LUT-as-RAM features, got ${#ram_lines[@]}"

slices="$(printf '%s\n' "${ram_lines[@]}" | sed -E 's/\.[A-D]LUT\.RAM$//' | sort -u)"
[ "$(printf '%s\n' "$slices" | wc -l)" -eq 1 ] || \
    fail "the 4 LUT-RAMs are spread over $(printf '%s\n' "$slices" | wc -l) slices: $(echo $slices)"

got=""
for line in "${ram_lines[@]}"; do
    lut="${line%.RAM}"
    grep -qxF "${lut}.SMALL" "$fasm" || fail "${lut}.SMALL not set"
    init="$(grep -F "${lut}.INIT[63:0] = " "$fasm" | sed "s/.*= 64'b//" | tr -d '[:space:]')"
    [ "${#init}" -eq 64 ] || fail "${lut} INIT[63:0] is ${init:-missing}"
    [ "${init:0:32}" = "${init:32:32}" ] || \
        fail "${lut} INIT halves differ (${init:0:32} / ${init:32:32}): the read would depend on A6"
    got="$got $(printf '%08x' "$((2#${init:32:32}))")"
done
want=" 88aef30e 89aff20f 8aacf10c 8badf00d"
[ "$(printf '%s\n' $got | sort | tr '\n' ' ' | sed 's/ $//;s/^/ /')" = "$want" ] || \
    fail "INITs are$got, expected$want"

if grep -qE '\.(WA7USED|WA8USED)' "$fasm"; then
    fail "WA7USED/WA8USED programmed: that is the 128/256-deep write-address mux"
fi

echo "ok: 4 RAM32X1S in one SLICEM ($slices), SMALL, INIT in both halves"
