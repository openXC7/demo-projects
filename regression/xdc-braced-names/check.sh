#!/usr/bin/env bash
# A board XDC in the Digilent master form: -dict { ... } [get_ports { name }];
# with spaces inside the braces and a ';' and a comment after every line.
# Before the fix nextpnr-xilinx aborted on the first such line; a reader that
# skipped the lines would leave the pads wherever the placer likes and the
# clock at the default 12 MHz.  So assert, in the FASM, every pad on the tile
# of its pin (xc7a35tcsg324-1: E3 RIOB33_X43Y75, H5 RIOB33_X43Y51, J5
# RIOB33_SING_X43Y50, T9 and T10 LIOB33_X0Y1) with LVCMOS33, no other IOB in
# use, and the 10.00 ns create_clock in the log.
set -euo pipefail

fasm="${FASM:?FASM is not set}"
log="${CASE_DIR:?CASE_DIR is not set}/nextpnr.log"
fail() { echo "FAIL: $*"; exit 1; }

expect() {  # <pin> <tile.IOB_Yn> <feature>
    grep -qxF "$2.$3" "$fasm" || fail "$1: no '$2.$3' in the FASM"
}
expect E3  RIOB33_X43Y75.IOB_Y0      LVCMOS25_LVCMOS33_LVTTL.IN
expect H5  RIOB33_X43Y51.IOB_Y1      LVCMOS33_LVTTL.DRIVE.I12_I16
expect J5  RIOB33_SING_X43Y50.IOB_Y0 LVCMOS33_LVTTL.DRIVE.I12_I16
expect T9  LIOB33_X0Y1.IOB_Y1        LVCMOS33_LVTTL.DRIVE.I12_I16
expect T10 LIOB33_X0Y1.IOB_Y0        LVCMOS33_LVTTL.DRIVE.I12_I16

used=$(grep -oE '^[LR]IOB33(_SING)?_X[0-9]+Y[0-9]+\.IOB_Y[01]' "$fasm" | LC_ALL=C sort -u | tr '\n' ' ')
want="LIOB33_X0Y1.IOB_Y0 LIOB33_X0Y1.IOB_Y1 RIOB33_SING_X43Y50.IOB_Y0 RIOB33_X43Y51.IOB_Y1 RIOB33_X43Y75.IOB_Y0 "
[ "$used" = "$want" ] || fail "IOBs in use: '$used', expected '$want'"

grep -qE "^Info: Max frequency for clock .*\(PASS at 100\.00 MHz\)$" "$log" ||
    fail "the 10.00 ns create_clock did not reach the clock (no 'PASS at 100.00 MHz' in nextpnr.log)"
echo "ok: five pads on the tiles of E3 H5 J5 T9 T10 with LVCMOS33, clock at 100 MHz"
