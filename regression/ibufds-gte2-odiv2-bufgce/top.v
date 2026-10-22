// IBUFDS_GTE2.ODIV2, the GT reference clock divided by two, into a BUFGCE.
// The packer's list of the fabric clock buffers an IBUFDS_GTE2 output may
// drive held BUFG, BUFH, BUFHCE and BUFR only, so this stopped with "output
// ODIV2 can only drive a BUFG/BUFH/BUFHCE/BUFR, not BUFGCE". The reference
// clock comes in on MGTREFCLK0 of quad 216, the clock enable from a pad, and
// the buffered clock drives a counter.
module top (
    input  wire refclk_p,
    input  wire refclk_n,
    input  wire en,
    output wire led
);
  wire odiv2, clk;
  IBUFDS_GTE2 refclk_buf (.I(refclk_p), .IB(refclk_n), .CEB(1'b0), .O(), .ODIV2(odiv2));
  BUFGCE odiv2_bufg (.I(odiv2), .CE(en), .O(clk));

  reg [25:0] cnt = 26'd0;
  always @(posedge clk) cnt <= cnt + 26'd1;
  assign led = cnt[25];
endmodule
