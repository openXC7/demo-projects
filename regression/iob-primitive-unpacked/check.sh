#!/usr/bin/env bash
# IBUF_ANALOG is accepted as a top-level pad buffer and the packer does not
# implement it. Before the fix the flow exits 0 and deletes the cell. The
# packer must stop, and name the primitive.
set -euo pipefail
log="${CASE_DIR:?}/nextpnr.log"
if ! grep -q "IBUF_ANALOG .* has no packer" "$log"; then
  echo "FAIL: packer did not reject IBUF_ANALOG"
  grep -m1 '^ERROR' "$log" || true
  exit 1
fi
echo "ok: IBUF_ANALOG is rejected instead of building without a buffer"
