// Regression for openXC7/nextpnr-xilinx#158.
//
// Every LUT below has ONE net on TWO OR MORE of its logical inputs.  nextpnr
// is free to put them all on a single physical pin -- a legitimate
// optimisation, it frees a pin -- and records the merge in X_ORIG_PORT_A<n> as
// a space-separated list of logical input names.  If that list is built or
// parsed wrongly, the LUT is written into the bitstream with a permuted truth
// table, while the routed netlist and every simulation of it stay correct.
//
// Real designs hit this constantly, because sign extension makes the high bits
// of a signed value literally the same net.  Instantiating the primitives
// makes it deterministic rather than dependent on what synthesis happens to do.
//
// PASS = X_ORIG_PORT_* is a well-formed space-separated list.  FAIL = a list
// with a trailing/doubled separator (empty token) or a non-I<n> name.
module top(input [3:0] btn, output [3:0] led);

    // Two logical inputs on one net, twice over: I0/I2 and I3/I5.
    LUT6 #(.INIT(64'hFEDCBA9876543210)) l0 (
        .I0(btn[0]), .I1(btn[1]), .I2(btn[0]),
        .I3(btn[1]), .I4(btn[2]), .I5(btn[3]), .O(led[0]));

    // Three logical inputs on one net.
    LUT6 #(.INIT(64'h0123456789ABCDEF)) l1 (
        .I0(btn[2]), .I1(btn[2]), .I2(btn[2]),
        .I3(btn[0]), .I4(btn[1]), .I5(btn[3]), .O(led[1]));

    // A fractured LUT6_2.  The LUT-pair legaliser and fixupRouting() reach the
    // attribute by different paths, so exercise both.
    LUT6_2 #(.INIT(64'hDEADBEEFCAFEF00D)) l2 (
        .I0(btn[3]), .I1(btn[0]), .I2(btn[3]),
        .I3(btn[1]), .I4(btn[2]), .I5(1'b1),
        .O6(led[2]), .O5(led[3]));

endmodule
