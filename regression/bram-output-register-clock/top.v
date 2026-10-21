// Regression for the clock of the block RAM output registers (openXC7/nextpnr#120).
//
// A RAMB36E1 in true dual port, the shape of the report: port A writes,
// port B reads at 36 bits through its output register (DOB_REG 1, REGCEB
// tied to 1). Beside it a RAMB18E1 with the output register on port A
// (DOA_REG 1). The registers are clocked through site pins of their own,
// REGCLKB and REGCLKARDRCLK, which prjxray feeds from rows 0 and 4 of the
// INT tiles beside the BRAM (the data clocks use rows 1 and 3). Nothing
// connected them, so no clock reached those rows, the register never
// loaded and the output stayed at its initial value, with a clean exit 0.
//
// check.sh reads the FASM: for every half with DOB_REG, row 0 carries the
// same global clock as row 1; for every half with DOA_REG, row 4 the same
// as row 3.
module top (
    input  wire clk_a,
    input  wire clk_b,
    input  wire we,
    output wire led,
    output wire led2
);
    reg [9:0] addr_a = 10'd0;
    always @(posedge clk_a) addr_a <= addr_a + 1'b1;
    reg [9:0] addr_b = 10'd0;
    always @(posedge clk_b) addr_b <= addr_b + 1'b1;

    wire [31:0] dob;
    wire [3:0] dopb;
    RAMB36E1 #(
        .RAM_MODE("TDP"),
        .READ_WIDTH_A(36), .WRITE_WIDTH_A(36),
        .READ_WIDTH_B(36), .WRITE_WIDTH_B(0),
        .DOA_REG(0), .DOB_REG(1),
        .WRITE_MODE_A("READ_FIRST"), .WRITE_MODE_B("READ_FIRST")
    ) ram36 (
        .CLKARDCLK(clk_a), .CLKBWRCLK(clk_b),
        .ENARDEN(1'b1), .ENBWREN(1'b1),
        .REGCEAREGCE(1'b0), .REGCEB(1'b1),
        .RSTRAMARSTRAM(1'b0), .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0), .RSTREGB(1'b0),
        .ADDRARDADDR({1'b0, addr_a, 5'b0}), .ADDRBWRADDR({1'b0, addr_b, 5'b0}),
        .DIADI({22'd0, addr_a}), .DIPADIP(4'd0),
        .DIBDI(32'd0), .DIPBDIP(4'd0),
        .WEA({4{we}}), .WEBWE(8'd0),
        .DOBDO(dob), .DOPBDOP(dopb)
    );

    wire [15:0] doa;
    RAMB18E1 #(
        .RAM_MODE("TDP"),
        .READ_WIDTH_A(18), .WRITE_WIDTH_A(0),
        .READ_WIDTH_B(0), .WRITE_WIDTH_B(18),
        .DOA_REG(1), .DOB_REG(0)
    ) ram18 (
        .CLKARDCLK(clk_a), .CLKBWRCLK(clk_b),
        .ENARDEN(1'b1), .ENBWREN(1'b1),
        .REGCEAREGCE(1'b1), .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0), .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0), .RSTREGB(1'b0),
        .ADDRARDADDR({addr_a, 4'b0}), .ADDRBWRADDR({addr_b, 4'b0}),
        .DIADI(16'd0), .DIPADIP(2'd0),
        .DIBDI({6'd0, addr_b}), .DIPBDIP(2'd0),
        .WEA(2'b0), .WEBWE({4{we}}),
        .DOADO(doa)
    );

    assign led = ^{dob, dopb};
    assign led2 = ^doa;
endmodule
