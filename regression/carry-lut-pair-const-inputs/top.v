// Guard for openXC7/nextpnr#173: a CARRY4 whose S LUT has the same net on
// several inputs (here three inputs tied low) and whose DI comes from a
// separate input.
//
// The carry packer counts distinct nets, finds four (GND, a, b and the DI
// feed-through of c) and puts the S LUT in the 6LUT and the DI feed-through
// in the 5LUT of one position.  The placer counted connected pins instead:
// 5 + 1 = 6, so it wanted one shared input, found none, and rejected every
// CARRY4 site ("Unable to find legal placement for cell ... of type
// 'CARRY4'").  A 6LUT/5LUT pair shares A1-A5, so what has to fit is the
// distinct nets, here four.
//
// S = ~a (the LUT5 below, read with I0-I2 low), DI0 = c, CYINIT = 1, CI = 0:
// sum0 = O0 = a, sum1 = O1 = CO0 = ~a | c; b does not change the result.
//
// keep: without it yosys (0.33 and 0.70) folds the tied-low inputs and the
// LUT5 becomes a LUT2, which never reached the failing check.
module top (
    input  wire a,
    input  wire b,
    input  wire c,
    output wire sum0,
    output wire sum1
);
    wire s;
    wire [3:0] o, co;

    (* keep *) LUT5 #(.INIT(32'h78f00f0f)) s_lut (
        .I0(1'b0), .I1(1'b0), .I2(1'b0), .I3(b), .I4(a), .O(s)
    );

    CARRY4 carry (
        .CI(1'b0), .CYINIT(1'b1),
        .DI({3'b000, c}), .S({3'b000, s}),
        .O(o), .CO(co)
    );

    assign sum0 = o[0];
    assign sum1 = o[1];
endmodule
