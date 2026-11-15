// An xc7a35t is the xc7a50t die and has its chipdb, but it offers 90 of the
// die's 120 DSP48E1 (Vivado's part property DSP, and its report_utilization).
// Before the fix nothing counted them: these 91 DSPs placed and routed on an
// xc7a35t with a clean exit 0.  Vivado stops the same design in place_design.
// The fix stops it after packing, so the case is expected-fail and its
// check.sh asserts the message.
//
// A chain of 91 DSP48E1: the A and B inputs of each come from the P output of
// the one before, so none can be swept.
module top (
    input  wire clk,
    input  wire din,
    output wire dout
);
    localparam N = 91;
    reg [29:0] sr = 30'd0;
    always @(posedge clk) sr <= {sr[28:0], din};
    wire [47:0] p [0:N];
    assign p[0] = {18'd0, sr};
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin : g
            DSP48E1 d (
                .CLK(clk), .A(p[i][29:0]), .B(p[i][17:0]), .C(48'd0), .D(25'd0),
                .CEA1(1'b1), .CEA2(1'b1), .CEB1(1'b1), .CEB2(1'b1), .CEC(1'b1), .CED(1'b1),
                .CEM(1'b1), .CEP(1'b1), .CEAD(1'b1), .CECTRL(1'b1), .CEALUMODE(1'b1),
                .CEINMODE(1'b1), .CECARRYIN(1'b1),
                .RSTA(1'b0), .RSTB(1'b0), .RSTC(1'b0), .RSTD(1'b0), .RSTM(1'b0), .RSTP(1'b0),
                .RSTCTRL(1'b0), .RSTALLCARRYIN(1'b0), .RSTALUMODE(1'b0), .RSTINMODE(1'b0),
                .OPMODE(7'b0000101), .ALUMODE(4'b0000), .INMODE(5'b00000), .CARRYINSEL(3'b000),
                .CARRYIN(1'b0), .P(p[i + 1]));
        end
    endgenerate
    assign dout = ^p[N];
endmodule
