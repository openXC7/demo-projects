// An ODDR on an HP bank of a Zynq: xc7z030, pad B5, bank 34.
module top(input clk_in, output io);
  wire clk;
  BUFG bufg_clk (.I(clk_in), .O(clk));
  wire q;
  ODDR #(.DDR_CLK_EDGE("OPPOSITE_EDGE"), .INIT(1'b0), .SRTYPE("SYNC")) oddr (
    .Q(q), .C(clk), .CE(1'b1), .D1(1'b1), .D2(1'b0), .R(1'b0), .S(1'b0)
  );
  assign io = q;
endmodule
