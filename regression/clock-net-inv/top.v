// An inverter written on the clock of a slice flip-flop and of an SRL.
// Before the fold the clock stays in a LUT, and the design has no fmax.
module top (
    input  wire clk,
    input  wire d,
    output wire q,
    output wire qs
);
    wire n;
    wire m;
    FDRE #(.INIT(1'b0)) u_launch (.C(clk), .CE(1'b1), .R(1'b0), .D(d), .Q(n));
    FDRE #(.INIT(1'b0)) u_ff (.C(~clk), .CE(1'b1), .R(1'b0), .D(n), .Q(q));
    SRL16E #(.INIT(16'h0000)) u_srl (
        .CLK(~clk), .CE(1'b1), .D(n),
        .A0(1'b0), .A1(1'b0), .A2(1'b0), .A3(1'b0), .Q(m));
    FDRE #(.INIT(1'b0)) u_cap (.C(clk), .CE(1'b1), .R(1'b0), .D(m), .Q(qs));
endmodule
