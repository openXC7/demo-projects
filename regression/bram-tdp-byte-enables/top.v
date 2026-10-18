// Regression for openXC7/nextpnr fix/bram-byte-enable-site-pins: the write enables
// of a RAMB18E1 in true dual port, x18.
//
// Each byte enable of the primitive sits on a pair of site pins: Vivado puts WEA[0] on
// WEA0/WEA1 and WEA[1] on WEA2/WEA3, and the same on port B, WEBWE[0] on WEBWE0/WEBWE1 and
// WEBWE[1] on WEBWE2/WEBWE3.  Port A always had that; port B was wired one to one and then
// had WEBWE[3:2] copied from WEBWE[1:0], so its site pins carried we0, we1, we0, we1: a
// byte write on port B with the two enables different put the wrong enable on two of the
// four pins, with a clean exit 0.
//
// WEBWE is written the way yosys infers a 16-bit true-dual-port RAM with a write enable
// per byte, {we1, we0, we1, we0}.  Every enable comes from its own pad so check.sh can
// name the signal on each site pin.
module top (
    input  wire clk,
    input  wire wa0, wa1,
    input  wire wb0, wb1,
    output wire led
);
    reg [9:0]  addr_a = 10'd0, addr_b = 10'd512;
    reg [15:0] din_a = 16'h1234, din_b = 16'hbeef;
    always @(posedge clk) begin
        addr_a <= addr_a + 1'b1;
        addr_b <= addr_b + 2'd3;
        din_a  <= din_a + 16'h0101;
        din_b  <= din_b - 16'h0102;
    end

    wire [15:0] doa, dob;
    wire [1:0]  dopa, dopb;
    RAMB18E1 #(
        .RAM_MODE("TDP"),
        .READ_WIDTH_A(18), .WRITE_WIDTH_A(18),
        .READ_WIDTH_B(18), .WRITE_WIDTH_B(18),
        .DOA_REG(0), .DOB_REG(0)
    ) ram (
        .CLKARDCLK(clk), .CLKBWRCLK(clk), .ENARDEN(1'b1), .ENBWREN(1'b1),
        .REGCEAREGCE(1'b0), .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0), .RSTRAMB(1'b0), .RSTREGARSTREG(1'b0), .RSTREGB(1'b0),
        .ADDRARDADDR({addr_a, 4'b0}), .ADDRBWRADDR({addr_b, 4'b0}),
        .DIADI(din_a), .DIBDI(din_b), .DIPADIP(2'b00), .DIPBDIP(2'b00),
        .WEA({wa1, wa0}), .WEBWE({wb1, wb0, wb1, wb0}),
        .DOADO(doa), .DOBDO(dob), .DOPADOP(dopa), .DOPBDOP(dopb)
    );

    reg q = 1'b0;
    always @(posedge clk) q <= ^{doa, dob};
    assign led = q;
endmodule
