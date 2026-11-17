module top(input clk_in, output led);
  reg [7:0] c = 0;
  always @(posedge clk_in) c <= c + 1;
  assign led = c[7];
endmodule
