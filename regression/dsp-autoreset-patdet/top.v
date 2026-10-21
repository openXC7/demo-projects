// Regression for AUTORESET_PATDET = "RESET_NOT_MATCH" on a DSP48E1.
//
// prjxray's 100-dsp-mskpat fuzzer tags AUTORESET_PATDET_RESET for
// RESET_MATCH and for RESET_NOT_MATCH, and AUTORESET_PATDET_RESET_NOT_MATCH
// for RESET_NOT_MATCH only; Vivado writes both features for this value.
// The engine wrote only the second one.
//
// check.sh reads the FASM: the DSP site carries both features.
module top (input wire clk, output wire led);
    reg [29:0] a = 30'd1;
    reg [17:0] b = 18'd1;
    reg [47:0] c = 48'd0;
    always @(posedge clk) begin
        a <= a + 30'd1;
        b <= b + 18'd3;
        c <= c + 48'd5;
    end

    wire [47:0] p;
    wire pd;
    DSP48E1 #(
        .AREG(1), .BREG(1), .CREG(1), .PREG(1), .MREG(0), .ADREG(0), .DREG(0),
        .INMODEREG(0), .OPMODEREG(0), .ALUMODEREG(0), .CARRYINREG(0), .CARRYINSELREG(0),
        .USE_MULT("NONE"),
        .USE_PATTERN_DETECT("PATDET"), .SEL_PATTERN("PATTERN"), .SEL_MASK("MASK"),
        .PATTERN(48'h1234_5678_9abc), .MASK(48'h0f0f_0000_ffff),
        .AUTORESET_PATDET("RESET_NOT_MATCH")
    ) dsp (
        .CLK(clk), .A(a), .B(b), .C(c), .D(25'b0),
        .ALUMODE(4'b0000), .INMODE(5'b00000), .OPMODE(7'b0110011),
        .CARRYIN(1'b0), .CARRYINSEL(3'b000),
        .CEA1(1'b1), .CEA2(1'b1), .CEB1(1'b1), .CEB2(1'b1), .CEC(1'b1), .CEM(1'b0), .CEP(1'b1),
        .CED(1'b0), .CEAD(1'b0), .CEALUMODE(1'b0), .CECARRYIN(1'b0), .CECTRL(1'b0), .CEINMODE(1'b0),
        .RSTA(1'b0), .RSTB(1'b0), .RSTC(1'b0), .RSTD(1'b0), .RSTM(1'b0), .RSTP(1'b0),
        .RSTALLCARRYIN(1'b0), .RSTALUMODE(1'b0), .RSTCTRL(1'b0), .RSTINMODE(1'b0),
        .P(p), .PATTERNDETECT(pd)
    );
    assign led = ^{p, pd};
endmodule
