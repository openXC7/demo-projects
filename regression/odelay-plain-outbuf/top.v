// Regression for openXC7/nextpnr e229044c (ODELAYE2 driving a high-range
// output).
//
// pack_iologic() bound an ODELAYE2 through its DATAOUT net only when the user
// was an OUTBUF_DCIEN, the high-performance-bank buffer.  On a high-range bank
// every output buffer is an IOB33_OUTBUF (an OBUF and an OBUFT alike), so the
// design stopped with "has DATAOUT connected to unsupported cell type
// IOB33_OUTBUF", which reads like a netlist problem.  The real limitation is
// the silicon: high-range banks have no ODELAY.  The fix lets the packer reach
// get_odelay_site(), which says so.  The design is still unbuildable, so the
// case is expected-fail and its check.sh asserts the message.
//
// A counter bit (clk R4) -> ODELAYE2 (FIXED) -> OBUF on B13, bank 16 (HR).
module top (
    input  wire clk,
    output wire led
);
    reg [23:0] cnt = 24'd0;
    always @(posedge clk) cnt <= cnt + 1'b1;
    wire d_dly;
    ODELAYE2 #(
        .ODELAY_TYPE("FIXED"),
        .ODELAY_VALUE(12),
        .DELAY_SRC("ODATAIN"),
        .HIGH_PERFORMANCE_MODE("TRUE"),
        .REFCLK_FREQUENCY(200.0),
        .SIGNAL_PATTERN("DATA")
    ) od (
        .ODATAIN(cnt[23]),
        .DATAOUT(d_dly),
        .C(1'b0),
        .CE(1'b0),
        .INC(1'b0),
        .LD(1'b0),
        .LDPIPEEN(1'b0),
        .REGRST(1'b0),
        .CINVCTRL(1'b0),
        .CNTVALUEIN(5'd0),
        .CLKIN(1'b0)
    );
    OBUF led_obuf (.I(d_dly), .O(led));
endmodule
