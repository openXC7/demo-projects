#!/usr/bin/env bash
# set_property on get_nets or get_pins used to stop the run ("targets other
# than 'get_ports' or 'get_cells' are not supported"). An XDC shared with
# Vivado has many such lines; each one must be skipped with a warning.
set -euo pipefail
log="${CASE_DIR:?}/nextpnr.log"
for line in 6 7 8; do
    grep -qE "^Warning: ignoring set_property .* on \[get_(nets|pins) .*\]: only get_ports and get_cells targets are supported \(on line $line\)$" "$log" || {
        echo "FAIL: no warning for line $line"
        exit 1
    }
done
echo "ok: lines 6, 7 and 8 skipped with a warning"
