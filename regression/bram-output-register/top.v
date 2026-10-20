// Regression for the SDP output-register clock bit.
//
// A RAMB36E1 in simple dual port, read on port A at 72 bits and write on
// port B at 72 bits, with both output registers on. Vivado clocks those
// registers from REGCLKARDRCLK and leaves REGCLKB unconnected, so
// ZINV_REGCLKB stays clear on both halves. The narrow-port rule (DOB_REG
// set, so the register clock follows CLKBWRCLK) set that bit instead.
// TDP is a different case and already matched.
//
// check.sh reads the FASM: both halves carry DOA_REG, DOB_REG and
// ZINV_REGCLKARDRCLK, and neither carries ZINV_REGCLKB.
module top (
    input  wire clk,
    input  wire we,
    output wire led
);
    reg [8:0] addr = 9'd0;
    always @(posedge clk) addr <= addr + 1'b1;

    wire [63:0] dout;
    wire [7:0] dop;
    RAMB36E1 #(
        .RAM_MODE("SDP"),
        .READ_WIDTH_A(72), .WRITE_WIDTH_A(0),
        .READ_WIDTH_B(0), .WRITE_WIDTH_B(72),
        .DOA_REG(1), .DOB_REG(1),
        .WRITE_MODE_A("WRITE_FIRST"), .WRITE_MODE_B("WRITE_FIRST")
    ) ram (
        .CLKARDCLK(clk), .CLKBWRCLK(clk),
        .ENARDEN(1'b1), .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1), .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0), .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0), .RSTREGB(1'b0),
        .ADDRARDADDR({1'b0, addr, 6'b0}), .ADDRBWRADDR({1'b0, addr, 6'b0}),
        .DIADI(32'd0), .DIBDI({32{we}}),
        .DIPADIP(4'd0), .DIPBDIP(4'd0),
        .WEA(4'b0), .WEBWE({8{we}}),
        .DOADO(dout[31:0]), .DOBDO(dout[63:32]),
        .DOPADOP(dop[3:0]), .DOPBDOP(dop[7:4])
    );
    assign led = ^{dout, dop};
endmodule
