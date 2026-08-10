// Regression for the two IOB divergences found by diffing against the
// Vivado-built references committed in prjxray-db/artix7/harness/.
//
//   1. an LVCMOS33 output at the default drive must use the I12_I16 bit
//      pattern (Vivado's), not I12_I8
//   2. SLEW is an output-driver property: an input-only pad must not get
//      SLEW.SLOW bits
//
// clk is an input-only pad and led an output, so one design exercises both
// rules. The expectations are transcribed from a vendor bitstream (see the
// README), not from our own output.
module top (
    input  wire clk,
    output reg  led
);
    reg [23:0] ctr = 0;
    always @(posedge clk) begin
        ctr <= ctr + 1;
        led <= ctr[23];
    end
endmodule
