#!/usr/bin/env bash
# 39a39917: a PLL whose feedback runs through a BUFG (the clocking wizard's
# clkf_buf) must still get its VCO and output constraints derived.  Pre-fix
# the log stopped at "Input frequency of PLL ..." and the output domains were
# timed at the 12 MHz default.  Assert the VCO line and the 100 MHz constraint
# on the BUFG output net that clocks the counter.
set -euo pipefail
d="$(dirname "$0")"
log="$d/nextpnr.log"
grep -qE "Derived VCO frequency 1000\.0 MHz for PLL 'pll_i'" "$log" || {
    echo "FAIL: no derived VCO frequency for pll_i (feedback through clkf_buf)"
    exit 1
}
grep -qE 'Derived frequency constraint of 100\.0 MHz for net clk100$' "$log" || {
    echo "FAIL: clk100 (CLKOUT0 through a BUFG) has no derived 100.0 MHz constraint"
    exit 1
}
echo "ok: VCO 1000.0 MHz and clk100 at 100.0 MHz derived through the BUFG in the feedback loop"
