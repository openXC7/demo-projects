#!/usr/bin/env bash
# 13d88882: a create_clock on the pad must propagate through the clock buffers
# to the nets that actually reach the flops.  Pre-fix, the pad-side net carried
# the constraint but the BUFH output did not, so the flop domain was analysed
# against the --freq default.  The fix logs each derived frequency; assert the
# BUFH output net's derived 200 MHz (200 MHz in -> same out, ratio 1).
set -euo pipefail
d="$(dirname "$0")"
grep -qE 'Derived frequency constraint of 200\.0 MHz for net clk_bufh' "$d/nextpnr.log" || {
    echo "FAIL: BUFH output net clk_bufh has no derived 200.0 MHz constraint"
    exit 1
}
echo "ok: create_clock propagated through BUFH to clk_bufh (200.0 MHz)"
