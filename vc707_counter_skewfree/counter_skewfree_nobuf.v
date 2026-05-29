// SPDX-License-Identifier: ISC
//
// Same 2-stage skew-tolerant counter, but explicitly tag the clock port
// with synth attributes to suppress BUFG insertion.
//
// CLOCK_BUFFER_TYPE = "NONE"   Vivado synth: don't auto-insert clock buffer
// BUFFER_TYPE       = "NONE"   alternative spelling some tools recognise
// keep              = "true"   discourage the net being merged or optimised
module top (
    (* CLOCK_BUFFER_TYPE = "NONE", BUFFER_TYPE = "NONE", IO_BUFFER_TYPE = "NONE" *)
    input  wire       sw_clk,
    output wire [7:0] led
);
    (* keep = "true" *)
    wire clk = sw_clk;

    reg  [7:0] count         = 8'h00;
    reg  [7:0] count_sampled = 8'h00;
    wire [7:0] count_next    = count + 8'h01;

    always @(negedge clk)
        count_sampled <= count_next;

    always @(posedge clk)
        count <= count_sampled;

    assign led = count;
endmodule
