// Regression for openXC7/nextpnr-xilinx#201.
//
// A distributed RAM whose write clock is inverted.  The RAM*X1S_1 Unisim
// variants are exactly this cell with IS_WCLK_INVERTED = 1, and a Vivado
// imported netlist sets the parameter directly.  On 7-series the slice has one
// clock inverter (CLKINV/NOCLKINV) shared by every clocked element of the
// half-slice, so the parameter has to reach that bit.  It did not: the flow
// packed, placed, routed and wrote a FASM byte-identical to the non-inverted
// design and exited 0, so the memory wrote on the opposite clock edge on
// silicon.
//
// Keep I/O minimal, like the other cases here, and keep the design free of
// flipflops: the RAM is then the only clocked element in its half-slice, which
// is what makes this case about the CLKINV bit rather than about control-set
// sharing with FFs.  Data and write enable come from pins; the address is tied
// low, so the primitive still needs all six A pins and the RAM stays 64x1.
//
// PASS = the SLICEM half-slice holding the RAM programs CLKINV and not
// NOCLKINV, while the 64x1 RAM mode bits are still emitted (check.sh).
module top (
    input  wire clk,
    input  wire we,
    input  wire d,
    output wire o
);
    wire [5:0] addr = 6'd0;

    RAM64X1S #(.INIT(64'h0), .IS_WCLK_INVERTED(1'b1)) ram (
        .O(o),
        .A0(addr[0]), .A1(addr[1]), .A2(addr[2]),
        .A3(addr[3]), .A4(addr[4]), .A5(addr[5]),
        .WCLK(clk), .WE(we), .D(d)
    );
endmodule
