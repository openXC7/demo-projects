#!/usr/bin/env bash
# The ODDR drives pad B5 of xc7z030fbg676-2 (IOB_X1Y110, HP bank 34), so it
# has to be in RIOI_X79Y109.OLOGIC_Y0 with its OQ on the pad. Before the fix
# the HP IOI sites of the zynq7 chipdbs were built empty, and nextpnr
# never finished packing the ODDR.
set -euo pipefail
fasm="${FASM:?FASM is not set}"
[ -s "$fasm" ] || { echo "FAIL: no $fasm"; exit 1; }
for f in OLOGIC_Y0.ODDR_TDDR.IN_USE OLOGIC_Y0.OQUSED OLOGIC_Y0.OSERDES.DATA_RATE_OQ.DDR RIOI_O0.RIOI_OLOGIC0_OQ; do
    if ! grep -qE "^RIOI_X79Y109\.${f//./\\.}[[:space:]]*\$" "$fasm"; then
        echo "FAIL: no RIOI_X79Y109.$f (the ODDR of pad B5 is not in RIOI_X79Y109.OLOGIC_Y0 driving the pad)"
        grep -E '^RIOI_X79Y109\.' "$fasm" || echo "  (no line in RIOI_X79Y109)"
        exit 1
    fi
done
echo "ok: ODDR in RIOI_X79Y109.OLOGIC_Y0, OQ on pad B5"
