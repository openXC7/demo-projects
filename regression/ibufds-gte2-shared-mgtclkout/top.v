// Both outputs of an IBUFDS_GTE2 into the fabric: O into a GTPE2_COMMON and a
// BUFGCE, ODIV2 into a BUFG. The two reach the fabric through the buffer's one
// MGTCLKOUT wire, so only one of them can; the packer checks for that, but its
// list of fabric clock buffers left out BUFGCE, the check let this through and
// the flow stopped in the router instead ("Failed to route arc ...").
// The design stays unbuildable: this case is expected-fail and asserts the
// packer's error.
module top (
    input  wire refclk_p,
    input  wire refclk_n,
    input  wire en,
    output wire [2:0] led
);
  wire o, odiv2, clk, clk2, lock;
  IBUFDS_GTE2 refclk_buf (.I(refclk_p), .IB(refclk_n), .CEB(1'b0), .O(o), .ODIV2(odiv2));
  BUFGCE o_bufg (.I(o), .CE(en), .O(clk));
  BUFG odiv2_bufg (.I(odiv2), .O(clk2));
  GTPE2_COMMON common (.GTREFCLK0(o), .PLL0LOCKEN(1'b1), .PLL0PD(1'b0), .PLL0REFCLKSEL(3'b001), .PLL0LOCK(lock));

  reg [25:0] cnt = 26'd0, cnt2 = 26'd0;
  always @(posedge clk) cnt <= cnt + 26'd1;
  always @(posedge clk2) cnt2 <= cnt2 + 26'd1;
  assign led = {lock, cnt2[25], cnt[25]};
endmodule
