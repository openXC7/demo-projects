#!/usr/bin/env bash
# O and ODIV2 of one IBUFDS_GTE2 both drive fabric clock buffers (O a BUFGCE,
# next to a GTPE2_COMMON; ODIV2 a BUFG). They share the buffer's one MGTCLKOUT
# wire, so the design is unbuildable: the verdict is that the packer stops it
# and names that wire, instead of the router failing on one of the two nets.
set -euo pipefail
d="$(dirname "$0")"
log="$d/nextpnr.log"

if ! grep -q "IBUFDS_GTE2 instance .*refclk_buf drives fabric clock buffers from both O and ODIV2, but the buffer has a single wire to the fabric (MGTCLKOUT)" "$log"; then
    echo "FAIL: no packer error for O and ODIV2 sharing MGTCLKOUT"
    grep -m1 '^ERROR' "$log" || true
    exit 1
fi
echo "ok: the packer stops O (BUFGCE) and ODIV2 (BUFG) sharing MGTCLKOUT"
