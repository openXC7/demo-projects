// The device utilisation nextpnr prints after packing (and writes to
// --report) must count what the part offers, as Vivado reports it available:
// an xc7a35tcsg324 has 20800 LUTs, 41600 flip-flops, 50 RAMB36E1 (100
// RAMB18E1), 90 DSP48E1 and 210 bonded IOBs.  Before the fix it counted the
// xc7a50t die, each LUT twice and every IOB of the die: 65200 LUTs, 65200
// flip-flops, 75 RAMB36E1, 120 DSP48E1, 250 IOBs and 512 pads.
//
// A counter on the LEDs, with one DSP48E1, so that the design uses a little
// of each kind it checks.
module top (
    input  wire clk,
    output wire [3:0] led
);
    reg [23:0] cnt = 24'd0;
    always @(posedge clk) cnt <= cnt + 1'b1;
    wire [47:0] p;
    DSP48E1 d (
        .CLK(clk), .A({6'd0, cnt}), .B({cnt[17:0]}), .C(48'd0), .D(25'd0),
        .CEA1(1'b1), .CEA2(1'b1), .CEB1(1'b1), .CEB2(1'b1), .CEC(1'b1), .CED(1'b1),
        .CEM(1'b1), .CEP(1'b1), .CEAD(1'b1), .CECTRL(1'b1), .CEALUMODE(1'b1),
        .CEINMODE(1'b1), .CECARRYIN(1'b1),
        .RSTA(1'b0), .RSTB(1'b0), .RSTC(1'b0), .RSTD(1'b0), .RSTM(1'b0), .RSTP(1'b0),
        .RSTCTRL(1'b0), .RSTALLCARRYIN(1'b0), .RSTALUMODE(1'b0), .RSTINMODE(1'b0),
        .OPMODE(7'b0000101), .ALUMODE(4'b0000), .INMODE(5'b00000), .CARRYINSEL(3'b000),
        .CARRYIN(1'b0), .P(p));
    assign led = p[23:20];
endmodule
