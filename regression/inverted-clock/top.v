// Regression for inverted clocks on xc7 (YosysHQ/nextpnr#1879 and its port).
//
// Three falling-edge structures on one clock, the way a design gets them:
//
//  - a shift chain of 64 flipflops whose two spellings of a falling-edge
//    flipflop alternate: FDRE_1 and FDRE with IS_C_INVERTED=1.  The two are
//    legal in one half-slice (same clock, edge, CE and R), and the placer
//    puts neighbours of a chain there.  The FASM writer then aborted with
//    "Assertion failure: negedge_ff == (true)", after routing, with no FASM;
//  - a block RAM written and read on the falling edge, and
//  - a LUT-RAM written on the falling edge.  For both memories yosys writes
//    an INV in front of the clock port.  The packer used to make that INV a
//    LUT1 in the fabric and clock the memory from it; Vivado absorbs it into
//    IS_<port>_INVERTED, so the clock comes straight from the BUFG.
//
// Keep I/O minimal, like the other cases here.  The memories share their
// address and data.
//
// PASS = a FASM, every half-slice holding a flipflop programs CLKINV and not
// NOCLKINV, the half-slice holding the LUT-RAM too, the block RAM clocks
// carry no ZINV bit (inverted at the RAM), and no LUT1 inverter is left in
// the routed netlist (check.sh).
module top (
    input  wire       clk,
    input  wire       d,
    input  wire       ce,
    input  wire       rst,
    output wire       q,
    input  wire       we,
    input  wire [9:0] a,
    input  wire [1:0] di,
    output reg  [1:0] bo,
    output wire       lo
);
    wire [64:0] c;
    assign c[0] = d;
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : g
            FDRE_1 #(.INIT(1'b0)) n1 (
                .C(clk), .CE(ce), .R(rst), .D(c[2*i]), .Q(c[2*i+1]));
            FDRE #(.INIT(1'b0), .IS_C_INVERTED(1'b1)) isc (
                .C(clk), .CE(ce), .R(rst), .D(c[2*i+1]), .Q(c[2*i+2]));
        end
    endgenerate
    assign q = c[64];

    (* ram_style = "block" *) reg [1:0] bm [0:1023];
    always @(negedge clk) begin
        if (we)
            bm[a] <= di;
        bo <= bm[a];
    end

    (* ram_style = "distributed" *) reg lm [0:31];
    always @(negedge clk)
        if (we)
            lm[a[4:0]] <= di[0];
    assign lo = lm[a[9:5]];
endmodule
