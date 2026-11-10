// A rising flip-flop drives a falling flip-flop. The path has half a period.
// The reported maximum frequency must not exceed the frequency of that half
// period. Before the timing override the engine gives the path a whole period
// and reports about twice the frequency the silicon can run.
module top (
    input  wire clk,
    input  wire d,
    output wire q
);
    wire n;
    FDRE #(.INIT(1'b0)) u_launch (.C(clk), .CE(1'b1), .R(1'b0), .D(d), .Q(n));
    FDRE_1 #(.INIT(1'b0)) u_capture (.C(clk), .CE(1'b1), .R(1'b0), .D(n), .Q(q));
endmodule
