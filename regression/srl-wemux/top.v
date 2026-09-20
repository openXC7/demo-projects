// Regression for openXC7/nextpnr-xilinx#ccfae5ae.
//
// The WEMUX that drives an SRL/DRAM's write-enable pin is shared across the
// bottom half of a SLICEM, so two SRLs/DRAMs from independent write-enable
// domains cannot legally share a half-tile.  Before the check the placer
// happily co-placed them and the router then died on an overused
// SITEWIRE/SLICE_*/WEMUX_OUT wire.
//
// 40 SRL16Es are enabled by we_a and 40 by we_b.  That many cells force at
// least one SLICEM half to hold two registers from different WE domains, so the
// pre-fix router overuses WEMUX_OUT on every seed; with the WE-agreement check
// the legaliser keeps the two domains apart and the design routes.  (The fork's
// own reproducer is 80 SRL16E across two button inputs.)
//
// The SRLs are instantiated as primitives, not inferred, so synthesis cannot
// constant-fold them away: each is a blackbox, its Q taps address 0 and feeds a
// single XOR-reduced output.  "It built" is exactly the criterion here --
// pre-fix the flow stops in routing, post-fix it reaches a non-empty FASM.
module top (
    input  wire clk,
    input  wire we_a,
    input  wire we_b,
    input  wire d,
    output wire q
);
    wire [79:0] qs;
    genvar g;
    generate
        for (g = 0; g < 40; g = g + 1) begin : gen_a
            SRL16E #(.INIT(16'hA5A5)) u (
                .Q(qs[g]), .CE(we_a), .CLK(clk), .D(d),
                .A0(1'b0), .A1(1'b0), .A2(1'b0), .A3(1'b0)
            );
        end
        for (g = 40; g < 80; g = g + 1) begin : gen_b
            SRL16E #(.INIT(16'h5A5A)) u (
                .Q(qs[g]), .CE(we_b), .CLK(clk), .D(d),
                .A0(1'b0), .A1(1'b0), .A2(1'b0), .A3(1'b0)
            );
        end
    endgenerate
    assign q = ^qs;
endmodule
