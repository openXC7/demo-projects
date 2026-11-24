// A forwarded clock whose global line reaches its clock row by crossing
// another one. The clock pad (B8), the MMCM and the ODDR's pad (D9) are all
// in the top clock region of the xc7a35t, CLK_HROW_TOP_R_X60Y130; the BUFG
// sits in the middle of the clock column, so the global line passes
// CLK_HROW_TOP_R_X60Y78, where nothing uses it, on its way up.
module top(input clk_in, output clk_out);
  wire clk_fb, clk_mmcm, clk, locked;
  MMCME2_BASE #(
    .CLKIN1_PERIOD(10.0),
    .CLKFBOUT_MULT_F(10.0),
    .DIVCLK_DIVIDE(1),
    .CLKOUT0_DIVIDE_F(20.0)
  ) mmcm (
    .CLKIN1(clk_in),
    .CLKFBIN(clk_fb),
    .CLKFBOUT(clk_fb),
    .CLKOUT0(clk_mmcm),
    .LOCKED(locked),
    .PWRDWN(1'b0),
    .RST(1'b0)
  );
  BUFG bufg (.I(clk_mmcm), .O(clk));
  ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")) oddr (
    .Q(clk_out), .C(clk), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0)
  );
endmodule
