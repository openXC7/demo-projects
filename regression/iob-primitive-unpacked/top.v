module top(input clk, output led);
  wire cki;
  IBUF_ANALOG ib (.I(clk), .O(cki));
  reg [7:0] c = 8'd0;
  always @(posedge cki) c <= c + 8'd1;
  assign led = c[7];
endmodule
