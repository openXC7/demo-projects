// Instantiated SRLC16E. Q and Q15 both leave the slice.
module top (
    input  wire clk,
    input  wire ce,
    input  wire d,
    input  wire a0,
    input  wire a1,
    input  wire a2,
    input  wire a3,
    output wire q,
    output wire q15
);
    (* DONT_TOUCH = "yes" *)
    SRLC16E #(.INIT(16'hA5C3)) u (
        .CLK(clk), .CE(ce), .D(d),
        .A0(a0), .A1(a1), .A2(a2), .A3(a3),
        .Q(q), .Q15(q15)
    );
endmodule
