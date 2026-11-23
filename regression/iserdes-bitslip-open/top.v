// An ISERDESE2 whose BITSLIP the design leaves unconnected.
//
// With nothing routed to it, BITSLIP's IMUX reads VCC (the default pip of
// every IMUX), so the cell bitslips on every CLKDIV cycle and its outputs bear
// no relation to the input, while place, route and the bitstream all succeed.
// Measured on silicon on the same die and I/O tile (an xc7a35t board, pad
// IOB_X0Y27). Vivado ties an open BITSLIP to GND: IMUX <- GFAN <- GND_WIRE.
//
// The pad is fixed (N16, IOB_X0Y27), so the ISERDESE2 sits in
// LIOI3_X0Y27.ILOGIC_Y1 and BITSLIP comes from INT_L_X0Y27.IMUX_L0.
// PASS = check.sh finds that IMUX tied to GND in the .fasm.
module top (input wire clk, input wire d_in, output wire led);
    wire fb, c0, c1, locked;
    PLLE2_BASE #(.CLKIN1_PERIOD(10.0), .CLKFBOUT_MULT(10), .DIVCLK_DIVIDE(1),
                 .CLKOUT0_DIVIDE(10), .CLKOUT1_DIVIDE(20))
        pll (.CLKIN1(clk), .CLKFBIN(fb), .CLKFBOUT(fb), .CLKOUT0(c0), .CLKOUT1(c1),
             .LOCKED(locked), .RST(1'b0), .PWRDWN(1'b0));
    wire clk_fast, clk_div;
    BUFG bfast (.I(c0), .O(clk_fast));
    BUFG bdiv (.I(c1), .O(clk_div));
    reg [1:0] rs = 2'b00;
    always @(posedge clk_div) rs <= {rs[0], locked};
    wire [3:0] q;
    // BITSLIP is left out of the port list on purpose.
    ISERDESE2 #(.DATA_RATE("DDR"), .DATA_WIDTH(4), .INTERFACE_TYPE("NETWORKING"),
                .IOBDELAY("NONE"), .NUM_CE(1), .SERDES_MODE("MASTER"))
        iser (.D(d_in), .CLK(clk_fast), .CLKB(~clk_fast), .CLKDIV(clk_div), .CE1(1'b1),
              .RST(~rs[1]), .Q1(q[0]), .Q2(q[1]), .Q3(q[2]), .Q4(q[3]));
    reg r = 1'b0;
    always @(posedge clk_div) r <= ^q;
    assign led = r;
endmodule
