// Regression for openXC7/nextpnr-xilinx 13d88882 (clock constraint propagation).
//
// create_clock attaches a ClockConstraint to the net the XDC names -- the pad.
// No flop is clocked by the pad-side net, so the timing walk keys its domains
// by the nets that actually reach the flops (IBUF output, BUFH output, ...),
// and none of those inherited the constraint: every domain but the pad's was
// analysed against the --freq default and reported PASS at 12 MHz on a design
// constrained at 200 MHz.
//
// The fix walks the constraint from every constrained net through the clock
// buffers (BUFH/BUFHCE here; the same pass covers BUFGCTRL I0/I1, BUFR with its
// divider, BUFIO and BUFMRCE) and logs each derived frequency.  "It built" is
// not enough: pre-fix the design routed and produced a FASM while the BUFH
// output net carried no constraint, so the case asserts the derived-frequency
// log line for the BUFH output net.
//
// BUFH is the routable representative of the buffer family (BUFR/BUFIO share
// the code path but their I pins need the I2IOCLK segbits the prjxray-db bump
// supplies).  IBUF (R4, MRCC bank 34) -> BUFH -> counter -> LED (bank 16).
module top (
    input  wire clk,
    output wire [3:0] led
);
    wire clk_ibuf, clk_bufh;
    IBUF clk_ibuf_i (.I(clk), .O(clk_ibuf));
    BUFH bufg_i (.I(clk_ibuf), .O(clk_bufh));
    reg [27:0] cnt = 28'd0;
    always @(posedge clk_bufh) cnt <= cnt + 1'b1;
    assign led = cnt[27:24];
endmodule
