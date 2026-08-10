// Regression for openXC7/nextpnr-xilinx#110.
//
// A differential clock arriving on an SRCC pin and reaching a BUFG. Before #110 the
// clock-buffer preplace BFS gave up at 50,000 visited pips while the path from an SRCC
// pin to a clock buffer spans 75,492 wires on xc7a200t, so placement reported the clock
// as unroutable. The cap was below the size of the search space.
//
// PASS = a .fasm is produced. FAIL = placement aborts.
module top (
    input  wire clk_p,
    input  wire clk_n,
    output wire [3:0] led
);
    wire clk;
    IBUFDS #(.DIFF_TERM("FALSE"), .IOSTANDARD("LVDS_25"))
        ibufds_i (.I(clk_p), .IB(clk_n), .O(clk));
    reg [27:0] cnt = 28'd0;
    always @(posedge clk) cnt <= cnt + 1'b1;
    assign led = cnt[27:24];
endmodule
