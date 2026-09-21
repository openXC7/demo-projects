// Regression for openXC7/nextpnr-xilinx 20dc8309 (regional buffer sink region).
//
// Binding a BUFR to the right site fixes the arc into it.  The arc out of it is
// a separate problem: a BUFR drives one clock region, and nothing told the
// placer that the flops it clocks have to live there.  The placer does not cost
// global nets, so those flops follow whatever data pin they touch -- here, an
// LED in bank 16, half a die from the bank-34 clock -- and the router dies on
// the clock:
//
//   ERROR: Failed to route arc 0 of net 'clk_bufr',
//          from SITEWIRE/BUFR_X1Y8/O to SITEWIRE/SLICE_X42Y222/CLKINV_OUT
//
// This case stops after placement (--no-route) and asserts the fix's own
// contract: every flop clocked by the BUFR sits inside the clock region the
// graph walk derived (and logged as "Constrained N sink(s) ... to its clock
// region x0..x1 y0..y1").  "It built" is not enough: pre-fix the flow placed
// the flops by the LED and exited 0, and the router then failed on the O arc.
//
// IBUF (R4, MRCC bank 34) -> BUFR -> counter -> LED (bank 16, half a die away).
module top (
    input  wire clk,
    output wire [3:0] led
);
    wire clk_ibuf, clk_bufr;
    IBUF clk_ibuf_i (.I(clk), .O(clk_ibuf));
    BUFR #(.BUFR_DIVIDE("BYPASS")) bufr_i (.I(clk_ibuf), .CE(1'b1), .CLR(1'b0), .O(clk_bufr));
    reg [27:0] cnt = 28'd0;
    always @(posedge clk_bufr) cnt <= cnt + 1'b1;
    assign led = cnt[27:24];
endmodule
