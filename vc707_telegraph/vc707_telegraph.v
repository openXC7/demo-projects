// VC707 wrapper for sonata telegraph.v — bit-banged UART smoke test
// using 125 MHz from SGMIICLK_Q0 (crystal × fixed mul, no PHY config).
// Same clock path as the picosoc_sgmii variant; no CPU/BRAM/MMCM —
// just an IBUFDS_GTE2 + BUFG + a state machine in CLBLM/CLBLL +
// IOBs. Lets us isolate the 358/228-bit missing pattern.
module top (
    input  wire sgmii_refclk_p, sgmii_refclk_n,
    input  wire rst,                       // active-high pushbutton
    input  wire uart_rx,
    output wire uart_tx,
    output wire [3:0] led
);
    wire refclk_to_bufg, clk;
    IBUFDS_GTE2 #(.CLKCM_CFG("TRUE"), .CLKRCV_TRST("TRUE"), .CLKSWING_CFG(2'b11))
        refclk_ibuf (.I(sgmii_refclk_p), .IB(sgmii_refclk_n),
                     .CEB(1'b0), .O(refclk_to_bufg), .ODIV2());
    BUFG cpu_bufg (.I(refclk_to_bufg), .O(clk));

    wire nrst = ~rst;
    sonata_top u_telegraph (
        .clk(clk), .nrst(nrst),
        .ser_rx(uart_rx), .ser_tx(uart_tx),
        .led__0(led[0]), .led__1(led[1]),
        .led__2(led[2]), .led__3(led[3])
    );
endmodule
