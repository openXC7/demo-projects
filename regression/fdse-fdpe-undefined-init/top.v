// Regression for openXC7/nextpnr-xilinx#179 (fixes #178).
//
// An FDSE/FDPE whose INIT parameter is present but undefined ('x') was read
// as INIT=0: int_or_default() only falls back to the type's default when the
// key is absent, so the x flowed through Property::update_intval() as a 0
// bit and the FF got a ZINI feature -- programming it to power up 0 on real
// silicon, where the primitive's own default is INIT=1 and a Vivado build of
// the same RTL reads 1.  yosys reaches this path whenever synthesis left the
// power-up value undecided (INIT=x); a Vivado netlist instead omits the
// parameter, which the existing default handling already covered.  #179
// treats "present but not fully defined" the same as "absent".
//
// Each register below resets to 1 asynchronously, so synthesis maps it to an
// FDPE with INIT=x -- the exact broken pattern.  FDPE defaults to INIT=1, so
// a correct FASM contains no ZINI feature at all; before #179 it contained
// one per FF.
module top (input wire clk, input wire rst_n, output wire [3:0] led);
    reg [3:0] q;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) q <= 4'b1111;
        else        q <= {q[0], q[3:1]};
    end
    assign led = q;
endmodule
