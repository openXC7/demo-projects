#!/usr/bin/env bash
# FASM content check for openXC7/nextpnr-xilinx#159.
#
# INMODE0..4, ALUMODE2/3 and OPMODE6 have no interconnect path into the DSP
# site, so a tile constant bit is the only way to give them a value.  On main
# none of the eight is written, the pin comes up as its complement on silicon,
# and INMODE[1]=1 gates the multiplier's A operand to zero (UG479 Table 1-11).
#
# Runs after run.sh has produced the FASM, which it exports as $FASM.  Pass
# criterion: every placed DSP site carries all eight const-only pins tied to
# GND or VCC.  A placed design without a DSP48E1 must fail, not pass vacuously.
set -euo pipefail

: "${FASM:?run.sh must export FASM}"

sites=$(grep -oE '^DSP_[LR]_X[0-9]+Y[0-9]+\.DSP_[01]' "$FASM" | sort -u)
[ -n "$sites" ] || { echo "FAIL: no DSP48E1 placed -- the run proved nothing"; exit 1; }

rc=0
for site in $sites; do
    n=$(grep -cE "^${site}_(INMODE[0-4]|ALUMODE[23]|OPMODE6)\.DSP_(GND|VCC)_[LR]$" "$FASM" || true)
    [ "$n" = 8 ] || rc=1
    echo "$site: $n/8 const-only pins tied"
done
[ $rc = 0 ] && echo "PASS" || echo "FAIL: an untied pin reads as its complement on silicon"
exit $rc
