// Regression for openXC7/nextpnr-xilinx 7c4f00df (pad-fed BUFR dedicated site).
//
// A pad-fed BUFR's I pin has no fabric input: the only wire that reaches it is
// the I2IOCLK leg its own clock-capable pad drives into the HCLK_IOI tile, so
// of the four BUFR_BUFR bels of a tile exactly one is routable from a given
// pad.  Nothing told the placer which, so it took any free site and the design
// died in the router:
//
//   ERROR: Failed to route arc 0 of net 'clk_ibuf'
//
// This case stops after placement (--no-route) and asserts the BUFR's
// NEXTPNR_BEL is the one next to the pad's IOB tile, because the dedicated
// path cannot route on this tree's chipdb (no I2IOCLK segbits until the
// prjxray-db bump that also unblocks bufio-in-use).  "It built" is not enough:
// pre-fix the flow placed the BUFR on a random free site and exited 0, and the
// router then failed on the I pin.
//
// IBUF (R4, MRCC bank 34) -> BUFR -> counter -> LED (bank 16, half a die away).
// The distant LED is what the sink-region fix (bufr-sink-region) is about; this
// case asserts only the buffer's own site.
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
