// openXC7/nextpnr#125: BUFGMUX, BUFGMUX_1 and BUFGMUX_CTRL had no packing
// branch and stopped the placer with "no BELs remaining to implement cell
// type 'BUFGMUX'". One instance of each, plus a BUFGMUX with CLK_SEL_TYPE
// "ASYNC", each in its own BUFGCTRL, between the same two clock pads; the
// select comes from a third pad and every output clocks a counter.
module top (
    input  wire clk0,
    input  wire clk1,
    input  wire sel,
    output wire [3:0] led
);
  wire [3:0] o;
  BUFGMUX m_sync (.I0(clk0), .I1(clk1), .S(sel), .O(o[0]));
  BUFGMUX_1 m_one (.I0(clk0), .I1(clk1), .S(sel), .O(o[1]));
  BUFGMUX_CTRL m_ctrl (.I0(clk0), .I1(clk1), .S(sel), .O(o[2]));
  BUFGMUX #(.CLK_SEL_TYPE("ASYNC")) m_async (.I0(clk0), .I1(clk1), .S(sel), .O(o[3]));

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : g
      reg [23:0] cnt = 24'd0;
      always @(posedge o[i]) cnt <= cnt + 24'd1;
      assign led[i] = cnt[23];
    end
  endgenerate
endmodule
