#!/usr/bin/env bash
# Q31 leaves the slice only from the A LUT. A BEL on B6LUT used to place and
# then fail while routing the MC31 arc. The packer must say so.
set -euo pipefail
log="${CASE_DIR:?}/nextpnr.log"
grep -q "BEL 'X104Y54/SLICE_X0Y0.B6LUT' is above the A LUT" "$log" || {
    echo "FAIL: the packer did not reject the BEL"
    exit 1
}
echo "ok: BEL above the A LUT rejected by the packer"
