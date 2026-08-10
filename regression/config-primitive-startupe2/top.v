// Regression for openXC7/nextpnr-xilinx#113.
//
// STARTUPE2 exists once per die. Before #113 the single-site configuration primitives
// had no pre-placement, so instantiating one failed to place.
//
// PASS = a .fasm is produced. FAIL = placement fails to find a site.
module top (input wire clk_p, input wire clk_n, output wire [3:0] led);
    wire clk;
    IBUFDS #(.DIFF_TERM("FALSE"), .IOSTANDARD("LVDS_25")) ib (.I(clk_p), .IB(clk_n), .O(clk));
    wire cfgmclk;
    STARTUPE2 #(.PROG_USR("FALSE")) su (
        .CFGMCLK(cfgmclk), .CLK(1'b0), .GSR(1'b0), .GTS(1'b0),
        .KEYCLEARB(1'b1), .PACK(1'b0), .USRCCLKO(1'b0), .USRCCLKTS(1'b1),
        .USRDONEO(1'b1), .USRDONETS(1'b1));
    reg [23:0] cnt = 24'd0;
    always @(posedge cfgmclk) cnt <= cnt + 1'b1;
    assign led = cnt[23:20];
endmodule
