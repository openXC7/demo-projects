// VC707 PicoSoC — 125 MHz from SGMIICLK_Q0_P/N (crystal × fixed multiplier).
// SGMIICLK_Q0_P/N at AH8/AH7 are MGTREFCLK pins of GTX quad 115; the
// IBUFDS_GTE2 is the only buffer that can sink them. ODIV2 is unused;
// O drives a regular BUFG to bring 125 MHz into general fabric. No
// MMCM, no PHY-config dependency — just a free-running crystal clock.
module top (
    input  wire       sgmii_refclk_p, sgmii_refclk_n,
    input  wire       rst,
    output wire       uart_tx,
    input  wire       uart_rx,
    output wire [7:0] led
);
    wire refclk_to_bufg, cpu_clk;
    IBUFDS_GTE2 #(.CLKCM_CFG("TRUE"), .CLKRCV_TRST("TRUE"), .CLKSWING_CFG(2'b11))
        refclk_ibuf (
            .I(sgmii_refclk_p), .IB(sgmii_refclk_n),
            .CEB(1'b0),
            .O(refclk_to_bufg),
            .ODIV2()
        );
    BUFG cpu_bufg (.I(refclk_to_bufg), .O(cpu_clk));

    reg [5:0] resetn_cnt = 0;
    wire resetn = &resetn_cnt;
    always @(posedge cpu_clk)
        if (rst) resetn_cnt <= 0;
        else     resetn_cnt <= resetn_cnt + !resetn;

    wire iomem_valid;
    reg  iomem_ready;
    wire [3:0]  iomem_wstrb;
    wire [31:0] iomem_addr, iomem_wdata;
    reg  [31:0] iomem_rdata;
    reg  [31:0] gpio;
    assign led = gpio[7:0];

    always @(posedge cpu_clk) begin
        if (!resetn) begin gpio <= 0; iomem_ready <= 0; end
        else begin
            iomem_ready <= 0;
            if (iomem_valid && !iomem_ready && iomem_addr[31:24] == 8'h03) begin
                iomem_ready <= 1;
                iomem_rdata <= gpio;
                if (iomem_wstrb[0]) gpio[ 7: 0] <= iomem_wdata[ 7: 0];
                if (iomem_wstrb[1]) gpio[15: 8] <= iomem_wdata[15: 8];
                if (iomem_wstrb[2]) gpio[23:16] <= iomem_wdata[23:16];
                if (iomem_wstrb[3]) gpio[31:24] <= iomem_wdata[31:24];
            end
        end
    end

    picosoc_noflash soc (
        .clk(cpu_clk), .resetn(resetn),
        .iomem_valid(iomem_valid), .iomem_ready(iomem_ready),
        .iomem_wstrb(iomem_wstrb), .iomem_addr(iomem_addr),
        .iomem_wdata(iomem_wdata), .iomem_rdata(iomem_rdata),
        .irq_5(1'b0), .irq_6(1'b0), .irq_7(1'b0),
        .ser_tx(uart_tx), .ser_rx(uart_rx)
    );
endmodule
