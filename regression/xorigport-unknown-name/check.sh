#!/usr/bin/env bash
# #7cfd1e90: an unknown X_ORIG_PORT name must be rejected, not encoded as I0.
#
# The normal flow can't produce such a name, so corrupt the synthesised JSON by
# renaming the LUT's I0 port to "A1" (a physical pin name the packer keeps,
# yielding X_ORIG_PORT_A1="A1", which is not a logical input) and re-run
# nextpnr.  Pre-fix nextpnr accepts it and encodes it as I0; post-fix the
# unknown-name guard rejects it.
set -euo pipefail
d="$(dirname "$0")"
part="$(cat "$d/part.txt")"

chipdb="${CHIPDB:-}"
if [ -z "$chipdb" ]; then
    if [ -f "${CHIPDB_DIR:-}/$part.bin" ]; then
        chipdb="$CHIPDB_DIR/$part.bin"
    elif [ -f "${CHIPDB_DIR:-}/${part%-*}.bin" ]; then
        chipdb="$CHIPDB_DIR/${part%-*}.bin"
    fi
fi
[ -n "$chipdb" ] || { echo "FAIL: no chipdb available to re-run"; exit 1; }

python3 "$d/corrupt_xorig.py" "$d/top.json" "$d/top_corrupt.json"

set +e
nextpnr-xilinx --chipdb "$chipdb" --xdc "$d/top.xdc" --json "$d/top_corrupt.json" \
    --fasm "$d/corrupt.fasm" --timing-allow-fail > "$d/corrupt.log" 2>&1
rc=$?
set -e

if [ "$rc" -eq 0 ]; then
    echo "FAIL: nextpnr accepted an unknown X_ORIG_PORT name and encoded it as I0"
    exit 1
fi
if ! grep -q "X_ORIG_PORT.*names logical input" "$d/corrupt.log"; then
    echo "FAIL: nextpnr rejected the JSON but not with the unknown-name guard:"
    tail -5 "$d/corrupt.log"
    exit 1
fi
echo "ok: unknown X_ORIG_PORT name rejected, not encoded as I0"
