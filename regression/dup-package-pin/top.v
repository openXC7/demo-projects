// Regression for openXC7/nextpnr-xilinx#8.
//
// Two outputs constrained to the same package pin.  The placer stops this (a
// bel collision between $iopadmap$... cells), but that message never names the
// pin the user wrote.  The fix warns at pack time, in the names the user wrote,
// before the placer reports the bel collision; the placer error still fails the
// build, so nothing that used to be rejected now builds.
//
// This case is an expected-fail: nextpnr must still exit non-zero (the design
// is unplaceable), but its log must carry the pack-time warning.  check.sh
// asserts the warning names both ports and the package pin.
module top (
    output wire led1,
    output wire led2
);
    assign led1 = 1'b0;
    assign led2 = 1'b1;
endmodule
