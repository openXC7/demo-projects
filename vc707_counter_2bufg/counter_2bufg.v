// SPDX-License-Identifier: ISC
//
// VC707 — 200 MHz LVDS sysclk through IBUFDS → SPLIT into two BUFGs that
// feed two independent counters → split LED nibbles.
//
//   BUFG_A → counter_a[23:0] → led[3:0] = counter_a[23:20]
//   BUFG_B → counter_b[23:0] → led[7:4] = counter_b[23:20]
//
// The placer will land the two BUFGs on different BUFGCTRL sites, so this
// exercises BUFGCTRL_X0Yi and X0Yj for two distinct i/j.
module top (
    input  wire       clk_p,
    input  wire       clk_n,
    input  wire       rst,
    output wire [7:0] led
);
    wire clk_ibuf;
    IBUFDS #(
        .DIFF_TERM   ("TRUE"),
        .IBUF_LOW_PWR("FALSE"),
        .IOSTANDARD  ("LVDS")
    ) sysclk_ibufds (.I(clk_p), .IB(clk_n), .O(clk_ibuf));

    (* DONT_TOUCH = "true" *) wire clk_a, clk_b;
    BUFG bufg_a (.I(clk_ibuf), .O(clk_a));
    BUFG bufg_b (.I(clk_ibuf), .O(clk_b));

    reg [23:0] count_a = 0, count_b = 0;
    always @(posedge clk_a) if (rst) count_a <= 0; else count_a <= count_a + 1;
    always @(posedge clk_b) if (rst) count_b <= 0; else count_b <= count_b + 1;

    assign led = {count_b[23:20], count_a[23:20]};
endmodule
