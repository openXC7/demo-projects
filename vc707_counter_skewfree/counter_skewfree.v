// SPDX-License-Identifier: ISC
//
// VC707 8-bit "timing-free" counter — no clock buffer, pushbutton-clocked.
//
// The pushbutton (sw_clk) drives the clock pin directly, through general
// routing — there is no IBUFG / BUFG / BUFR / BUFH anywhere. To make the
// design skew-resilient, each counter bit goes through a TWO-STAGE pipeline:
//
//   1) negative-edge FF  count_sampled <= count + 1
//      Captured on the falling edge of sw_clk, giving a full half-period
//      of setup time for the adder to settle before the posedge sample.
//
//   2) positive-edge FF  count <= count_sampled
//      Captured on the rising edge of sw_clk. Because the input to this FF
//      (count_sampled) has been stable since the previous falling edge,
//      it doesn't matter how much the rising edge is skewed across the
//      eight bits — every flop sees a fully-settled value.
//
// One counter advance per full pushbutton cycle (press + release).
module top (
    input  wire       sw_clk,
    output wire [7:0] led
);
    reg  [7:0] count         = 8'h00;
    reg  [7:0] count_sampled = 8'h00;
    wire [7:0] count_next    = count + 8'h01;

    // neg-edge sampler: pre-charges count_sampled with the next value
    always @(negedge sw_clk)
        count_sampled <= count_next;

    // pos-edge logic flop: copies the pre-charged value to count
    always @(posedge sw_clk)
        count <= count_sampled;

    assign led = count;
endmodule
