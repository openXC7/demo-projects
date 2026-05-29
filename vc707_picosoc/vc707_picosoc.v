// SPDX-License-Identifier: ISC
//
// VC707 (xc7vx485tffg1761-2) PicoSoC UART demo.
// Upstream sources: ~/picorv32/picosoc + the picosoc_noflash.v variant
// from f4pga-examples (BRAM-resident firmware).
//
// Clocking:  200 MHz LVDS sysclk → IBUFDS → MMCME2 ÷4 → BUFG → 50 MHz cpu_clk
// IOs:       AV40 rst (active high) → resetn (active low)
//            AT32 uart_tx (FPGA → host), AU33 uart_rx (host → FPGA)
//            AM39..AU39 — 8 LEDs from a memory-mapped GPIO register
module top (
    input  wire       clk_p, clk_n,   // 200 MHz LVDS sysclk (E19/E18, bank 38)
    input  wire       rst,            // CPU_RESET pushbutton (AV40, bank 16)
    output wire       uart_tx,        // FPGA → USB-UART TX (AT32)
    input  wire       uart_rx,        // USB-UART RX → FPGA (AU33)
    output wire [7:0] led             // LD0..7 (AM39..AU39)
);
    // ----------------------------------------------------------------
    // Clock generation
    // ----------------------------------------------------------------
    wire sysclk_ibuf;
    IBUFDS #(
        .DIFF_TERM   ("TRUE"),
        .IBUF_LOW_PWR("FALSE"),
        .IOSTANDARD  ("LVDS")
    ) sysclk_ibufds (.I(clk_p), .IB(clk_n), .O(sysclk_ibuf));

    wire mmcm_clkfb, mmcm_clk0_out, cpu_clk, mmcm_locked;
    MMCME2_BASE #(
        .BANDWIDTH        ("OPTIMIZED"),
        .CLKIN1_PERIOD    (5.0),         // 200 MHz in
        .CLKFBOUT_MULT_F  (5.0),         // VCO = 1000 MHz
        .CLKOUT0_DIVIDE_F (20.0),        // 1000/20 = 50 MHz out
        .DIVCLK_DIVIDE    (1)
    ) mmcm (
        .CLKIN1  (sysclk_ibuf),
        .CLKFBIN (mmcm_clkfb),
        .CLKFBOUT(mmcm_clkfb),
        .CLKOUT0 (mmcm_clk0_out),
        .LOCKED  (mmcm_locked),
        .RST     (1'b0),
        .PWRDWN  (1'b0)
    );

    BUFG cpu_bufg (.I(mmcm_clk0_out), .O(cpu_clk));

    // Synchronous reset release once the MMCM is locked AND the
    // pushbutton is released. Hold for ~64 cycles.
    reg [5:0] resetn_cnt = 0;
    wire      resetn = &resetn_cnt;
    always @(posedge cpu_clk) begin
        if (rst || !mmcm_locked) resetn_cnt <= 0;
        else                     resetn_cnt <= resetn_cnt + !resetn;
    end

    // ----------------------------------------------------------------
    // IO memory map: 0x0300_0000 = GPIO LEDs (the only IO peripheral)
    // ----------------------------------------------------------------
    wire        iomem_valid;
    reg         iomem_ready;
    wire [ 3:0] iomem_wstrb;
    wire [31:0] iomem_addr;
    wire [31:0] iomem_wdata;
    reg  [31:0] iomem_rdata;

    reg  [31:0] gpio;
    assign led = gpio[7:0];

    always @(posedge cpu_clk) begin
        if (!resetn) begin
            gpio        <= 0;
            iomem_ready <= 1'b0;
        end else begin
            iomem_ready <= 1'b0;
            if (iomem_valid && !iomem_ready && iomem_addr[31:24] == 8'h03) begin
                iomem_ready <= 1'b1;
                iomem_rdata <= gpio;
                if (iomem_wstrb[0]) gpio[ 7: 0] <= iomem_wdata[ 7: 0];
                if (iomem_wstrb[1]) gpio[15: 8] <= iomem_wdata[15: 8];
                if (iomem_wstrb[2]) gpio[23:16] <= iomem_wdata[23:16];
                if (iomem_wstrb[3]) gpio[31:24] <= iomem_wdata[31:24];
            end
        end
    end

    // ----------------------------------------------------------------
    // The PicoSoC instance (BRAM-resident firmware, no SPI flash)
    // ----------------------------------------------------------------
    picosoc_noflash soc (
        .clk         (cpu_clk),
        .resetn      (resetn),
        .iomem_valid (iomem_valid),
        .iomem_ready (iomem_ready),
        .iomem_wstrb (iomem_wstrb),
        .iomem_addr  (iomem_addr),
        .iomem_wdata (iomem_wdata),
        .iomem_rdata (iomem_rdata),
        .irq_5       (1'b0),
        .irq_6       (1'b0),
        .irq_7       (1'b0),
        .ser_tx      (uart_tx),
        .ser_rx      (uart_rx)
    );
endmodule
