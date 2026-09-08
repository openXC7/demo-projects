#!/usr/bin/env bash
# Regression for openXC7/nextpnr-xilinx#179 (fixes #178).
#
# An FDSE/FDPE with a present-but-undefined INIT ('x') must behave like one
# whose INIT parameter is absent: fall back to the primitive default INIT=1.
# A ZINI feature is only emitted for INIT=0, so the FASM of this FDPE-only
# design (every FF is a reset-to-1 FDPE with INIT=x) must contain no ZINI
# feature at all.  Before #179 each FF got one: its 'x' INIT was read as 0
# and the FF was programmed to power up 0 instead of the correct 1.
#
# PASS = no ZINI feature in the FASM.
if grep -qE '\.ZINI([^A-Z]|$)' "$FASM"; then
    echo "an FDPE with an undefined INIT got a ZINI feature (programmed INIT=0);" \
         "the primitive's default INIT=1 must stand" >&2
    exit 1
fi
exit 0
