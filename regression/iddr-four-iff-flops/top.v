// Regression for openXC7/nextpnr-xilinx#115.
//
// The IFF is physically a four-flop block shared with ISERDESE2. An IDDR exposes only
// Q1/Q2, so before #115 only those two were initialised -- and on silicon the outputs
// then read Q1=0, Q2=1 despite both being programmed INIT=0. Writing all four makes them
// read their programmed value.
//
// PASS = a .fasm is produced AND it contains IFF.ZINIT_Q1..Q4 for the ILOGIC site.
// The second half is what distinguishes this from a plain "it built" check: #115 changed
// which bits are emitted, not whether the flow completes.
module top (input wire clk_p, input wire clk_n, input wire d_in, output wire [3:0] led);
    wire clk;
    IBUFDS #(.DIFF_TERM("FALSE"), .IOSTANDARD("LVDS_25")) ib (.I(clk_p), .IB(clk_n), .O(clk));
    wire q1, q2;
    IDDR #(.DDR_CLK_EDGE("SAME_EDGE")) u (
        .Q1(q1), .Q2(q2), .C(clk), .CE(1'b1), .D(d_in), .R(1'b0), .S(1'b0));
    reg s1 = 1'b0, s2 = 1'b0;
    always @(posedge clk) begin s1 <= s1 | q1; s2 <= s2 | q2; end
    assign led = {2'b00, s2, s1};
endmodule
