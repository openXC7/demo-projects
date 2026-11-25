#!/usr/bin/env bash
# The ISERDESE2 sits in LIOI3_X0Y27.ILOGIC_Y1 (pad N16). OCLK is tied to 0.
# NETWORKING does not use OCLK. Treating that constant as open must not drive
# INT_L_X0Y27.IMUX_L31 from VCC and must not set IFF.INV_OCLK. The site keeps
# IFF.ZINV_OCLK, which is what an open OCLK already gets.
set -euo pipefail
fasm="${FASM:?FASM is not set}"
[ -s "$fasm" ] || { echo "FAIL: no $fasm"; exit 1; }
if ! grep -qE '^LIOI3_X0Y27\.ILOGIC_Y1\.ISERDES\.IN_USE[[:space:]]*$' "$fasm"; then
    echo "FAIL: no ISERDESE2 in LIOI3_X0Y27.ILOGIC_Y1 (the case expects pad N16 there)"
    exit 1
fi
if grep -qE '^LIOI3_X0Y27\.ILOGIC_Y1\.IFF\.INV_OCLK[[:space:]]*$' "$fasm"; then
    echo "FAIL: OCLK tied to 0 still sets LIOI3_X0Y27.ILOGIC_Y1.IFF.INV_OCLK"
    exit 1
fi
if grep -qE '^INT_L_X0Y27\.IMUX_L31\.VCC_WIRE[[:space:]]*$' "$fasm"; then
    echo "FAIL: OCLK tied to 0 still drives INT_L_X0Y27.IMUX_L31 from VCC_WIRE"
    exit 1
fi
if ! grep -qE '^LIOI3_X0Y27\.ILOGIC_Y1\.IFF\.ZINV_OCLK[[:space:]]*$' "$fasm"; then
    echo "FAIL: LIOI3_X0Y27.ILOGIC_Y1.IFF.ZINV_OCLK is absent"
    exit 1
fi
echo "ok: NETWORKING OCLK tied to 0 leaves ZINV_OCLK and does not drive IMUX_L31 from VCC"
