// Regression for openXC7/nextpnr-xilinx#111.
//
// A BUFG driven from the fabric rather than from a pin. Before #111 the placer aborted
// instead of pre-placing such a buffer, so any design that gates or divides a clock in
// logic and re-buffers it failed to place at all.
//
// PASS = a .fasm is produced. FAIL = placement aborts.
module top (input wire clk_p, input wire clk_n, output wire [3:0] led);
    wire clk;
    IBUFDS #(.DIFF_TERM("FALSE"), .IOSTANDARD("LVDS_25")) ib (.I(clk_p), .IB(clk_n), .O(clk));
    // divide in the fabric, then re-buffer -- this is the fabric-driven BUFG
    reg div = 1'b0;
    always @(posedge clk) div <= ~div;
    wire clk_div;
    BUFG bufg_i (.I(div), .O(clk_div));
    reg [24:0] cnt = 25'd0;
    always @(posedge clk_div) cnt <= cnt + 1'b1;
    assign led = cnt[24:21];
endmodule
