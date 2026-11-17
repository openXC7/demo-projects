// Only the P port of the differential input is on a package pin. The N port
// goes on the other pin of the pair, as Vivado does: T4 for R4.
module top(input clk_p, input clk_n, output led);
  wire clk;
  IBUFGDS ib (.I(clk_p), .IB(clk_n), .O(clk));
  reg [7:0] c = 0;
  always @(posedge clk) c <= c + 1;
  assign led = c[7];
endmodule
