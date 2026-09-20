// Regression for openXC7/nextpnr-xilinx#181.
//
// SRL16E and SRLC32E shift registers with non-trivial INIT.  pack_srls()
// keeps each shift register's own 16-/32-bit INIT on the SLICE_LUTX cell it
// creates, but get_lut_init() built every LUT's INIT[63:0] by mapping
// X_ORIG_PORT_A1..A6 through the LUT's logical inputs -- and a packed SRL has
// none of those, so every SRL powered up cleared regardless of its declared
// INIT.  Silent wrong bitstream, clean exit 0.
//
// "It built" proves nothing here: pre-fix the flow exits 0 with a FASM whose
// SRL LUTs program the wrong INIT.  check_init.py asserts the exact doubled
// pattern -- SRL INIT bit k is stored in the LUT INIT at both bit 2k and 2k+1,
// so a 16-bit SRL16E INIT lands doubled in the 6LUT half [63:32] and a 32-bit
// SRLC32E INIT lands doubled across the full [63:0].
//
// CE tied high and D tied low so neither register can shift; each Q taps
// address 0 and is read out combinationally, keeping the cells alive with
// minimal I/O.
module top (
    input  wire clk,
    output wire o16,
    output wire o32
);
    SRL16E #(.INIT(16'hA5A5)) srl16 (
        .Q(o16),
        .CE(1'b1),
        .CLK(clk),
        .D(1'b0),
        .A0(1'b0), .A1(1'b0), .A2(1'b0), .A3(1'b0)
    );

    SRLC32E #(.INIT(32'hF0F0F0F0)) srl32 (
        .Q(o32),
        .Q31(),
        .CE(1'b1),
        .CLK(clk),
        .D(1'b0),
        .A({5{1'b0}})
    );
endmodule
