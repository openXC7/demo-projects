#!/usr/bin/env python3
# #181: SRL16E / SRLC32E INIT must reach the LUT INIT in the bitstream.
#
# Pre-fix the flow exited 0 with a FASM whose SRL LUTs programmed the wrong
# INIT, so presence alone is not enough: assert the exact doubled pattern.
# SRL INIT bit k is stored in the LUT INIT at both bit 2k and 2k+1.
#   - SRLC32E (INIT=32'hF0F0F0F0) fills the full [63:0] with the doubled 32-bit
#     pattern: 0xFF00FF00FF00FF00.
#   - SRL16E (INIT=16'hA5A5) sits in the 6LUT, so its doubled 16-bit pattern
#     0xCC33CC33 lands in one 32-bit half with the other half zero.
import re
import sys

fasm = sys.argv[1] if len(sys.argv) > 1 else "top.fasm"

values = set()
with open(fasm) as f:
    for line in f:
        m = re.search(r"INIT\[63:0\] = 64'b([01]{64})", line)
        if m:
            values.add(int(m.group(1), 2))

srlc32_expected = 0xFF00FF00FF00FF00  # 32'hF0F0F0F0 doubled across [63:0]
srl16_half = 0xCC33CC33              # 16'hA5A5 doubled in its 32-bit half


def fail(msg):
    print("FAIL: " + msg)
    sys.exit(1)


def half(v, upper):
    return (v >> 32) & 0xFFFFFFFF if upper else v & 0xFFFFFFFF


if srlc32_expected not in values:
    fail("SRLC32E INIT 0x%016x not found; got %s" % (srlc32_expected, [hex(v) for v in sorted(values)]))

srl16_found = any(
    (half(v, True) == srl16_half and half(v, False) == 0)
    or (half(v, False) == srl16_half and half(v, True) == 0)
    for v in values
)
if not srl16_found:
    fail("SRL16E INIT 0x%08x doubled in one half not found; got %s" % (srl16_half, [hex(v) for v in sorted(values)]))

print("ok: SRL16E and SRLC32E INIT doubled into the LUT INIT")
