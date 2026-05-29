// SPDX-License-Identifier: ISC
//
// Minimal LIOI/LIOB18 passthrough smoke test.
// One pushbutton -> one LED, pure combinational. No clock, no flop, no BUFG.
// Both pins picked on Y1 IOB18 sites to land in the better-covered half of
// segbits_liob18.db (Y1 has IN, IN_ONLY, DRIVE, SLEW coverage for LVCMOS18).
module top (
    input  wire sw,    // GPIO_SW_N pushbutton  -> AR40 -> LIOB18_X81Y141 Y1
    output wire led    // GPIO_LED_1            -> AN39 -> LIOB18_X81Y143 Y1
);
    assign led = sw;
endmodule
