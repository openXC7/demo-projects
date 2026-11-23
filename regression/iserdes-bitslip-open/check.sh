#!/usr/bin/env bash
# The ISERDESE2 sits in LIOI3_X0Y27.ILOGIC_Y1 (pad N16) and its BITSLIP comes
# from INT_L_X0Y27.IMUX_L0. top.v leaves BITSLIP open, so it must be tied to
# GND as Vivado ties it: IMUX_L0 <- GFAN0 or GFAN1 <- GND_WIRE. Without the
# tie the IMUX reads VCC and the cell bitslips on every CLKDIV cycle.
set -euo pipefail
fasm="${FASM:?FASM is not set}"
[ -s "$fasm" ] || { echo "FAIL: no $fasm"; exit 1; }
if ! grep -qE '^LIOI3_X0Y27\.ILOGIC_Y1\.ISERDES\.IN_USE[[:space:]]*$' "$fasm"; then
    echo "FAIL: no ISERDESE2 in LIOI3_X0Y27.ILOGIC_Y1 (the case expects pad N16 there)"
    exit 1
fi
gfan=$(grep -oE '^INT_L_X0Y27\.IMUX_L0\.GFAN[01][[:space:]]*$' "$fasm" | head -n 1 | sed 's/.*\.//; s/[[:space:]]*$//' || true)
if [ -z "$gfan" ]; then
    echo "FAIL: BITSLIP is open and INT_L_X0Y27.IMUX_L0 is not tied to GND, so it reads VCC"
    grep -E '^INT_L_X0Y27\.IMUX_L0\.' "$fasm" || echo "  (no pip into INT_L_X0Y27.IMUX_L0)"
    exit 1
fi
if ! grep -qE "^INT_L_X0Y27\.$gfan\.GND_WIRE[[:space:]]*\$" "$fasm"; then
    echo "FAIL: INT_L_X0Y27.IMUX_L0 reads $gfan, and $gfan is not driven from GND_WIRE"
    exit 1
fi
echo "ok: BITSLIP tied to GND (INT_L_X0Y27.IMUX_L0.$gfan, INT_L_X0Y27.$gfan.GND_WIRE)"
