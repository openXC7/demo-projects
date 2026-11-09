// Instantiated SRLC32E. Q reads an address. Q31 leaves the slice.
module top (
    input  wire clk,
    input  wire ce,
    input  wire d,
    input  wire a0,
    input  wire a1,
    input  wire a2,
    input  wire a3,
    input  wire a4,
    output wire q,
    output wire q31
);
    (* DONT_TOUCH = "yes" *)
    SRLC32E #(.INIT(32'hA5A5C3C3)) u (
        .CLK(clk), .CE(ce), .D(d),
        .A({a4, a3, a2, a1, a0}),
        .Q(q), .Q31(q31)
    );
endmodule
