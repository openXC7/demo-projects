#!/usr/bin/env bash
# Check for openXC7/nextpnr-xilinx#158.
#
# The bug is in a metadata attribute of the ROUTED JSON, not in the FASM bytes:
# when several logical inputs of one LUT share a physical pin, fixupRouting()
# recorded them in X_ORIG_PORT_A<n> with the separator after each name, so a
# shared pin came out as "I1I3 " instead of "I1 I3".  The FASM backend then
# split on " " and encoded the pin as if it drove I0, permuting the LUT's INIT
# in the bitstream while the JSON, the SDF and every simulation stayed correct
# -- the design failed on the die and nowhere else.
#
# check_orig_port.py splits each X_ORIG_PORT_* value on " " and fails on any
# empty token (trailing/doubled separator) or any non-I<n> name; it also fails
# if nothing shared a pin, because such a run would have proved nothing.
#
# run.sh exports CASE_DIR; the routed JSON is written alongside the FASM by the
# runner's --write flag.
set -euo pipefail

: "${CASE_DIR:?run.sh must export CASE_DIR}"

python3 "$CASE_DIR/check_orig_port.py" "$CASE_DIR/top_routed.json"
