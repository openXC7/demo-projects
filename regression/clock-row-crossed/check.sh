#!/usr/bin/env bash
# The ODDR (pad D9) is clocked from the CLK_HROW_TOP_R_X60Y130 clock row, and
# its global line comes from a BUFG in the middle of the clock column
# (CLK_BUFG_*_X60Y48/Y53), so it crosses CLK_HROW_TOP_R_X60Y78 without being
# used there. Vivado sets CLK_HROW_R_CK_GCLK<n>_ACTIVE in every clock row a
# global line passes through, from its BUFG to the furthest row that uses it,
# and not only in the rows that use it.
set -euo pipefail
fasm="${FASM:?FASM is not set}"
[ -s "$fasm" ] || { echo "FAIL: no $fasm"; exit 1; }
far=CLK_HROW_TOP_R_X60Y130
mid=CLK_HROW_TOP_R_X60Y78
lanes=$(sed -nE "s/^$far\.CLK_HROW_CK_MUX_OUT_[LR][0-9]+\.CLK_HROW_R_CK_GCLK([0-9]+)[[:space:]]*\$/\1/p" "$fasm" | sort -un)
crossed=""
for n in $lanes; do
    grep -qE "^CLK_BUFG_(BOT|TOP)_R_X60Y(48|53)\.CLK_BUFG_CK_GCLK$n\." "$fasm" || continue
    grep -qE "^$mid\.CLK_HROW_CK_MUX_OUT_[LR][0-9]+\.CLK_HROW_R_CK_GCLK$n[[:space:]]*\$" "$fasm" && continue
    crossed="$crossed $n"
done
if [ -z "$crossed" ]; then
    echo "FAIL: no global line from a BUFG is used in $far without being used in $mid,"
    echo "      so the case no longer crosses a clock row (the ODDR is expected at D9)"
    exit 1
fi
for n in $crossed; do
    if ! grep -qE "^$mid\.CLK_HROW_R_CK_GCLK${n}_ACTIVE[[:space:]]*\$" "$fasm"; then
        echo "FAIL: GCLK$n is used in $far and crosses $mid, but $mid.CLK_HROW_R_CK_GCLK${n}_ACTIVE is not set"
        exit 1
    fi
done
names=$(for n in $crossed; do printf ' GCLK%s' "$n"; done)
echo "ok:$names, used in $far, active in the crossed row $mid"
