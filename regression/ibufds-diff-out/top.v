module top(input clk_p, input clk_n, output led);
  wire clk, clkb;
  IBUFDS_DIFF_OUT ib (.I(clk_p), .IB(clk_n), .O(clk), .OB(clkb));
  reg [7:0] c = 8'd0;
  always @(posedge clk) c <= c + 8'd1;
  assign led = c[7] ^ clkb;
endmodule
