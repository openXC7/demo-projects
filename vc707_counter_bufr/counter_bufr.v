// SPDX-License-Identifier: ISC
//
// VC707 counter — 200 MHz LVDS sysclk through IBUFDS → BUFR → 24-bit prescaler
//                  → 8-bit counter → LEDs.
//
// Why BUFR (not BUFG): the prjxray virtex7 database we're building has
// segbits for BUFR (HCLK_IOI tile, fuzzer 039) but NOT yet for BUFG / the
// CLK_BUFG_REBUF / CLK_HROW_BOT_R / CLK_BUFG_TOP_R fuzzers (042-046 still
// pending). BUFR drives a regional clock only — fine for this small design
// where the LEDs, the counter flops, and the IOB18 input are all in the
// same clock region around bank 15 / 14 (left-side HP).
module top (
    input  wire       clk_p,   // VC707 sysclk P  (E19, LVDS, 200 MHz)
    input  wire       clk_n,   // VC707 sysclk N  (E18, LVDS)
    input  wire       rst,     // CPU_RESET pushbutton (AV40)
    output wire [7:0] led      // GPIO_LED_0..7_LS (LVCMOS18)
);
    wire clk_ibuf;
    wire clk;

    IBUFDS #(
        .DIFF_TERM   ("TRUE"),
        .IBUF_LOW_PWR("FALSE"),
        .IOSTANDARD  ("LVDS")
    ) sysclk_ibufds (
        .I (clk_p),
        .IB(clk_n),
        .O (clk_ibuf)
    );

    // Regional clock buffer — the input is an IBUFDS-routed signal, so
    // BUFR.I is driven via CKINT (general routing). BUFR_DIVIDE bypass
    // gives us a clean 200 MHz fabric clock without dividing.
    BUFR #(
        .BUFR_DIVIDE("BYPASS"),
        .SIM_DEVICE ("7SERIES")
    ) sysclk_bufr (
        .CE (1'b1),
        .CLR(1'b0),
        .I  (clk_ibuf),
        .O  (clk)
    );

    // 24-bit prescaler → ~12 Hz tick from 200 MHz
    reg [23:0] prescaler;
    wire       tick = (prescaler == 24'h000000);
    always @(posedge clk) begin
        if (rst) prescaler <= 24'h000000;
        else     prescaler <= prescaler + 24'h000001;
    end

    // 8-bit binary counter → LEDs
    reg [7:0] count;
    always @(posedge clk) begin
        if (rst)       count <= 8'h00;
        else if (tick) count <= count + 8'h01;
    end

    assign led = count;
endmodule
