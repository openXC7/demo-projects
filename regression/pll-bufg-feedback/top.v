// Regression for openXC7/nextpnr 39a39917 (PLL/MMCM feedback through a clock
// buffer).
//
// generate_constraints() derived a PLL's VCO and output clocks only when
// CLKFBIN was driven by the PLL itself.  Vivado's clocking wizard always puts
// a global buffer in the loop (BUFG clkf_buf between CLKFBOUT and CLKFBIN), so
// such a PLL was skipped entirely: no VCO frequency, no output constraints,
// and every domain it clocks analysed against the 12 MHz default.  The design
// routed and wrote a FASM either way, so "it built" is not the criterion; the
// case asserts the derived VCO and the constraint on an output's own net.
//
// clk (R4, 200 MHz) -> PLLE2_ADV, CLKFBOUT -> BUFG -> CLKFBIN.  VCO = 200 MHz
// x CLKFBOUT_MULT 5 = 1000 MHz; CLKOUT0 / 10 = 100 MHz, CLKOUT1 / 5 = 200 MHz,
// each through a BUFG to a counter on a LED.
module top (
    input  wire clk,
    output wire [3:0] led
);
    wire clk_ibuf, clkfbout, clkfbout_buf, clk100_pll, clk200_pll, clk100, clk200, locked;
    IBUF clk_ibuf_i (.I(clk), .O(clk_ibuf));
    PLLE2_ADV #(
        .CLKIN1_PERIOD(5.000),
        .DIVCLK_DIVIDE(1),
        .CLKFBOUT_MULT(5),
        .CLKFBOUT_PHASE(0.000),
        .CLKOUT0_DIVIDE(10),
        .CLKOUT1_DIVIDE(5)
    ) pll_i (
        .CLKFBOUT(clkfbout),
        .CLKOUT0(clk100_pll),
        .CLKOUT1(clk200_pll),
        .CLKFBIN(clkfbout_buf),
        .CLKIN1(clk_ibuf),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .DADDR(7'h0),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI(16'h0),
        .DWE(1'b0),
        .LOCKED(locked),
        .PWRDWN(1'b0),
        .RST(1'b0)
    );
    BUFG clkf_buf (.I(clkfbout), .O(clkfbout_buf));
    BUFG clk100_buf (.I(clk100_pll), .O(clk100));
    BUFG clk200_buf (.I(clk200_pll), .O(clk200));
    reg [26:0] cnt100 = 27'd0;
    reg [27:0] cnt200 = 28'd0;
    always @(posedge clk100) cnt100 <= cnt100 + 1'b1;
    always @(posedge clk200) cnt200 <= cnt200 + 1'b1;
    assign led = {locked, cnt100[26], cnt200[27], cnt200[26]};
endmodule
