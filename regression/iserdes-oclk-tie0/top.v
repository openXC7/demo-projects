// An ISERDESE2 in NETWORKING mode whose OCLK is tied to 0.
//
// UG953: OCLK is used when INTERFACE_TYPE is MEMORY. When INTERFACE_TYPE is
// NETWORKING, OCLK is unused and must be connected to GND. The pad is N16
// (IOB_X0Y27), so the cell
// is in LIOI3_X0Y27.ILOGIC_Y1 and a constant 0 on OCLK is inverted onto VCC at
// the OCLK inverter. Before the tie-off handling that route is
// INT_L_X0Y27.IMUX_L31.VCC_WIRE plus LIOI3_X0Y27.ILOGIC_Y1.IFF.INV_OCLK.
// After it, OCLK is left open: the VCC pip and INV_OCLK are gone and the site
// keeps IFF.ZINV_OCLK, the same configuration as an open OCLK.
// OCLKB stays off the port list.
// PASS = check.sh finds ZINV_OCLK and neither INV_OCLK nor that VCC pip.
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
    ISERDESE2 #(.DATA_RATE("DDR"), .DATA_WIDTH(4), .INTERFACE_TYPE("NETWORKING"),
                .IOBDELAY("NONE"), .NUM_CE(1), .SERDES_MODE("MASTER"))
        iser (.D(d_in), .CLK(clk_fast), .CLKB(~clk_fast), .OCLK(1'b0), .CLKDIV(clk_div),
              .CE1(1'b1), .RST(~rs[1]), .Q1(q[0]), .Q2(q[1]), .Q3(q[2]), .Q4(q[3]));
    reg r = 1'b0;
    always @(posedge clk_div) r <= ^q;
    assign led = r;
endmodule
