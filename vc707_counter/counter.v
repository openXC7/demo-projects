// SPDX-License-Identifier: ISC
//
// VC707 8-bit binary counter smoke-test
// -------------------------------------
// Smallest non-trivial design that exercises the path picosoc/attosoc will
// later need on the open flow:
//   - VC707's 200 MHz LVDS sysclk through IBUFDS + BUFG
//   - LVCMOS18 output to user LEDs (HP-only fabric)
//   - synchronous active-high reset
//
// The 24-bit prescaler slows the 200 MHz clock to ~12 Hz so the 8-bit
// counter's bit-0 blinks visibly on LED[0] and bit-7 toggles every ~10 s.

module top (
    input  wire       clk_p,   // VC707 sysclk P (E19, LVDS, 200 MHz)
    input  wire       clk_n,   // VC707 sysclk N (E18, LVDS)
    input  wire       rst,     // VC707 CPU_RESET pushbutton (AV40, active high)
    output wire [7:0] led      // VC707 GPIO_LED_0..7_LS (LVCMOS18)
);

    // ------------------------------------------------------------------
    // Differential clock input -> global clock buffer
    // ------------------------------------------------------------------
    wire clk_ibuf;
    wire clk;

    IBUFDS #(
        .DIFF_TERM   ("TRUE"),    // 100 ohm on-chip diff termination
        .IBUF_LOW_PWR("FALSE"),
        .IOSTANDARD  ("LVDS")
    ) sysclk_ibufds (
        .I (clk_p),
        .IB(clk_n),
        .O (clk_ibuf)
    );

    BUFG sysclk_bufg (
        .I(clk_ibuf),
        .O(clk)
    );

    // ------------------------------------------------------------------
    // 24-bit prescaler: 200 MHz / 2**24 ~= 11.92 Hz tick rate
    // ------------------------------------------------------------------
    reg [23:0] prescaler;
    wire       tick = (prescaler == 24'h000000);

    always @(posedge clk) begin
        if (rst) prescaler <= 24'h000000;
        else     prescaler <= prescaler + 24'h000001;
    end

    // ------------------------------------------------------------------
    // 8-bit binary counter -> LEDs
    // ------------------------------------------------------------------
    reg [7:0] count;

    always @(posedge clk) begin
        if (rst)       count <= 8'h00;
        else if (tick) count <= count + 8'h01;
    end

    assign led = count;

endmodule
