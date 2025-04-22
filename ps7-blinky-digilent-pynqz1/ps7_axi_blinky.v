// SPDX-License-Identifier: MIT
`timescale 1ns / 1ps
 
module top(
	input clk,
	output [3:0]led,
	input [1:0]sw
    );

	wire [3:0]FCLK_CLK_unbuffered;
	wire [3:0]FCLK_CLK_buffered;
	BUFG FCLK_CLK_0_BUFG (.I(FCLK_CLK_unbuffered[0]), .O(FCLK_CLK_buffered[0]));
	BUFG FCLK_CLK_1_BUFG (.I(FCLK_CLK_unbuffered[1]), .O(FCLK_CLK_buffered[1]));
	BUFG FCLK_CLK_2_BUFG (.I(FCLK_CLK_unbuffered[2]), .O(FCLK_CLK_buffered[2]));
	BUFG FCLK_CLK_3_BUFG (.I(FCLK_CLK_unbuffered[3]), .O(FCLK_CLK_buffered[3]));

	//M_AXI_GP0
	localparam C_M_AXI_GP0_THREAD_ID_WIDTH = 12;
	// -- Output
	wire M_AXI_GP0_ARESETN;
	wire M_AXI_GP0_ARVALID;
	wire M_AXI_GP0_AWVALID;
	wire M_AXI_GP0_BREADY;
	wire M_AXI_GP0_RREADY;
	wire M_AXI_GP0_WLAST;
	wire M_AXI_GP0_WVALID;
	wire [(C_M_AXI_GP0_THREAD_ID_WIDTH - 1):0] M_AXI_GP0_ARID;
	wire [(C_M_AXI_GP0_THREAD_ID_WIDTH - 1):0] M_AXI_GP0_AWID;
	wire [(C_M_AXI_GP0_THREAD_ID_WIDTH - 1):0] M_AXI_GP0_WID;
	wire [1:0] M_AXI_GP0_ARBURST;
	wire [1:0] M_AXI_GP0_ARLOCK;
	wire [2:0] M_AXI_GP0_ARSIZE;
	wire [1:0] M_AXI_GP0_AWBURST;
	wire [1:0] M_AXI_GP0_AWLOCK;
	wire [2:0] M_AXI_GP0_AWSIZE;
	wire [2:0] M_AXI_GP0_ARPROT;
	wire [2:0] M_AXI_GP0_AWPROT;
	wire [31:0] M_AXI_GP0_ARADDR;
	wire [31:0] M_AXI_GP0_AWADDR;
	wire [31:0] M_AXI_GP0_WDATA;
	wire [3:0] M_AXI_GP0_ARCACHE;
	wire [3:0] M_AXI_GP0_ARLEN;
	wire [3:0] M_AXI_GP0_ARQOS;
	wire [3:0] M_AXI_GP0_AWCACHE;
	wire [3:0] M_AXI_GP0_AWLEN;
	wire [3:0] M_AXI_GP0_AWQOS;
	wire [3:0] M_AXI_GP0_WSTRB; 
	// -- Input  
	wire M_AXI_GP0_ACLK = FCLK_CLK_buffered[0];
	wire M_AXI_GP0_ARREADY;
	wire M_AXI_GP0_AWREADY;
	wire M_AXI_GP0_BVALID; 
	wire M_AXI_GP0_RLAST;
	wire M_AXI_GP0_RVALID;
	wire M_AXI_GP0_WREADY;
	wire [(C_M_AXI_GP0_THREAD_ID_WIDTH - 1):0] M_AXI_GP0_BID = M_AXI_GP0_WID;
	wire [(C_M_AXI_GP0_THREAD_ID_WIDTH - 1):0] M_AXI_GP0_RID = M_AXI_GP0_ARID;
	wire [1:0] M_AXI_GP0_BRESP;
	wire [1:0] M_AXI_GP0_RRESP;
	wire [31:0] M_AXI_GP0_RDATA;

	wire [31:0]gpio_i;
	wire [31:0]gpio_o;
	wire [31:0]gpio_t;
	axil_gpio #(
		.ALL_INPUT(0),
		.ALL_OUTPUT(0),
		.DEFAULT_OUTPUT(32'h0000000f),
		.DEFAULT_TRI(32'hFFFFFFFF),
		.ALL_INPUT_2(0),
		.ALL_OUTPUT_2(0),
		.DEFAULT_OUTPUT_2(32'h00000000),
		.DEFAULT_TRI_2(32'hFFFFFFFF)
	) axil_gpio_inst (
		.s_axi_clk(M_AXI_GP0_ACLK),
		.s_axi_aresetn(M_AXI_GP0_ARESETN),

		// AXI Lite Interface
		.s_axi_awaddr(M_AXI_GP0_AWADDR),
		.s_axi_awvalid(M_AXI_GP0_AWVALID),
		.s_axi_awready(M_AXI_GP0_AWREADY),

		.s_axi_wdata(M_AXI_GP0_WDATA),
		.s_axi_wstrb(M_AXI_GP0_WSTRB),
		.s_axi_wvalid(M_AXI_GP0_WVALID),
		.s_axi_wready(M_AXI_GP0_WREADY),

		.s_axi_bresp(M_AXI_GP0_BRESP),
		.s_axi_bvalid(M_AXI_GP0_BVALID),
		.s_axi_bready(M_AXI_GP0_BREADY),

		.s_axi_araddr(M_AXI_GP0_ARADDR),
		.s_axi_arvalid(M_AXI_GP0_ARVALID),
		.s_axi_arready(M_AXI_GP0_ARREADY),

		.s_axi_rdata(M_AXI_GP0_RDATA),
		.s_axi_rvalid(M_AXI_GP0_RVALID),
		.s_axi_rready(M_AXI_GP0_RREADY),
		.s_axi_rresp(M_AXI_GP0_RRESP),

		.gpio_i(gpio_i), 
		.gpio_o(gpio_o),
		.gpio_t(gpio_t),
		.gpio2_i(32'b0), 
		.gpio2_o(),
		.gpio2_t()
	);

	assign led[3:0] = gpio_o[3:0];
	assign gpio_i = {26'b0, sw, 4'b0};

    PS7 zynq7 (
	.DMA0DATYPE			        (),
	.DMA0DAVALID			    (),
	.DMA0DRREADY			    (),
	.DMA0RSTN			        (),
	.DMA1DATYPE	              	(),
	.DMA1DAVALID			    (),
	.DMA1DRREADY			    (),
	.DMA1RSTN			        (),
	.DMA2DATYPE			        (),
	.DMA2DAVALID			    (),
	.DMA2DRREADY			    (),
	.DMA2RSTN			(),
	.DMA3DATYPE			(),
	.DMA3DAVALID			(),
	.DMA3DRREADY			(),
	.DMA3RSTN			(),
	.EMIOCAN0PHYTX			(),
	.EMIOCAN1PHYTX			(),
	.EMIOENET0GMIITXD		(),
	.EMIOENET0GMIITXEN		(),
	.EMIOENET0GMIITXER		(),
	.EMIOENET0MDIOMDC		(),
	.EMIOENET0MDIOO			(),
	.EMIOENET0MDIOTN		(),
	.EMIOENET0PTPDELAYREQRX		(),
	.EMIOENET0PTPDELAYREQTX		(),
	.EMIOENET0PTPPDELAYREQRX	(),
	.EMIOENET0PTPPDELAYREQTX	(),
	.EMIOENET0PTPPDELAYRESPRX	(),
	.EMIOENET0PTPPDELAYRESPTX	(),
	.EMIOENET0PTPSYNCFRAMERX	(),
	.EMIOENET0PTPSYNCFRAMETX	(),
	.EMIOENET0SOFRX			(),
	.EMIOENET0SOFTX			(),
	.EMIOENET1GMIITXD		(),
	.EMIOENET1GMIITXEN		(),
	.EMIOENET1GMIITXER		(),
	.EMIOENET1MDIOMDC		(),
	.EMIOENET1MDIOO			(),
	.EMIOENET1MDIOTN		(),
	.EMIOENET1PTPDELAYREQRX		(),
	.EMIOENET1PTPDELAYREQTX		(),
	.EMIOENET1PTPPDELAYREQRX	(),
	.EMIOENET1PTPPDELAYREQTX	(),
	.EMIOENET1PTPPDELAYRESPRX	(),
	.EMIOENET1PTPPDELAYRESPTX	(),
	.EMIOENET1PTPSYNCFRAMERX	(),
	.EMIOENET1PTPSYNCFRAMETX	(),
	.EMIOENET1SOFRX			(),
	.EMIOENET1SOFTX			(),
	.EMIOGPIOO			(emio_gpio_o),
	.EMIOGPIOTN			(emio_gpio_t),
	.EMIOI2C0SCLO			(),
	.EMIOI2C0SCLTN			(),
	.EMIOI2C0SDAO			(),
	.EMIOI2C0SDATN			(),
	.EMIOI2C1SCLO			(),
	.EMIOI2C1SCLTN			(),
	.EMIOI2C1SDAO			(),
	.EMIOI2C1SDATN			(),
	.EMIOPJTAGTDO			(),
	.EMIOPJTAGTDTN			(),
	.EMIOSDIO0BUSPOW		(),
	.EMIOSDIO0BUSVOLT		(),
	.EMIOSDIO0CLK			(),
	.EMIOSDIO0CMDO			(),
	.EMIOSDIO0CMDTN			(),
	.EMIOSDIO0DATAO			(),
	.EMIOSDIO0DATATN		(),
	.EMIOSDIO0LED			(),
	.EMIOSDIO1BUSPOW		(),
	.EMIOSDIO1BUSVOLT		(),
	.EMIOSDIO1CLK			(),
	.EMIOSDIO1CMDO			(),
	.EMIOSDIO1CMDTN			(),
	.EMIOSDIO1DATAO			(),
	.EMIOSDIO1DATATN		(),
	.EMIOSDIO1LED			(),
	.EMIOSPI0MO			    (),
	.EMIOSPI0MOTN			(),
	.EMIOSPI0SCLKO			(),
	.EMIOSPI0SCLKTN			(),
	.EMIOSPI0SO			    (),
	.EMIOSPI0SSNTN			(),
	.EMIOSPI0SSON			(),
	.EMIOSPI0STN			(),
	.EMIOSPI1MO			    (),
	.EMIOSPI1MOTN			(),
	.EMIOSPI1SCLKO			(),
	.EMIOSPI1SCLKTN			(),
	.EMIOSPI1SO			    (),
	.EMIOSPI1SSNTN			(),
	.EMIOSPI1SSON			(),
	.EMIOSPI1STN			(),
	.EMIOTRACECTL			(),
	.EMIOTRACEDATA			(),
	.EMIOTTC0WAVEO			(),
	.EMIOTTC1WAVEO			(),
	.EMIOUART0DTRN			(),
	.EMIOUART0RTSN			(),
	.EMIOUART0TX			(),
	.EMIOUART1DTRN			(),
	.EMIOUART1RTSN			(),
	.EMIOUART1TX			(),
	.EMIOUSB0PORTINDCTL		(),
	.EMIOUSB0VBUSPWRSELECT	(),
	.EMIOUSB1PORTINDCTL		(),
	.EMIOUSB1VBUSPWRSELECT	(),
	.EMIOWDTRSTO			(),
	.EVENTEVENTO			(),
	.EVENTSTANDBYWFE		(),
	.EVENTSTANDBYWFI		(),
	.FCLKCLK			    (FCLK_CLK_unbuffered),
	.FCLKRESETN			    (),
	.FTMTF2PTRIGACK			(),
	.FTMTP2FDEBUG			(),
	.FTMTP2FTRIG			(),
	.IRQP2F				    (),
	.MAXIGP0ARADDR			(M_AXI_GP0_ARADDR),
	.MAXIGP0ARBURST			(M_AXI_GP0_ARBURST			),
	.MAXIGP0ARCACHE			(M_AXI_GP0_ARCACHE			),
	.MAXIGP0ARESETN			(M_AXI_GP0_ARESETN			),
	.MAXIGP0ARID			(M_AXI_GP0_ARID			),
	.MAXIGP0ARLEN			(M_AXI_GP0_ARLEN			),
	.MAXIGP0ARLOCK			(M_AXI_GP0_ARLOCK			),
	.MAXIGP0ARPROT			(M_AXI_GP0_ARPROT			),
	.MAXIGP0ARQOS			(M_AXI_GP0_ARQOS			),
	.MAXIGP0ARSIZE			(M_AXI_GP0_ARSIZE			),
	.MAXIGP0ARVALID			(M_AXI_GP0_ARVALID			),
	.MAXIGP0AWADDR			(M_AXI_GP0_AWADDR			),
	.MAXIGP0AWBURST			(M_AXI_GP0_AWBURST			),
	.MAXIGP0AWCACHE			(M_AXI_GP0_AWCACHE			),
	.MAXIGP0AWID			(M_AXI_GP0_AWID			),
	.MAXIGP0AWLEN			(M_AXI_GP0_AWLEN			),
	.MAXIGP0AWLOCK			(M_AXI_GP0_AWLOCK			),
	.MAXIGP0AWPROT			(M_AXI_GP0_AWPROT			),
	.MAXIGP0AWQOS			(M_AXI_GP0_AWQOS			),
	.MAXIGP0AWSIZE			(M_AXI_GP0_AWSIZE			),
	.MAXIGP0AWVALID			(M_AXI_GP0_AWVALID			),
	.MAXIGP0BREADY			(M_AXI_GP0_BREADY			),
	.MAXIGP0RREADY			(M_AXI_GP0_RREADY			),
	.MAXIGP0WDATA			(M_AXI_GP0_WDATA			),
	.MAXIGP0WID			(M_AXI_GP0_WID			),
	.MAXIGP0WLAST			(M_AXI_GP0_WLAST			),
	.MAXIGP0WSTRB			(M_AXI_GP0_WSTRB			),
	.MAXIGP0WVALID			(M_AXI_GP0_WVALID			),
	.MAXIGP1ARADDR			(M_AXI_GP1_ARADDR			),
	.MAXIGP1ARBURST			(M_AXI_GP1_ARBURST			),
	.MAXIGP1ARCACHE			(M_AXI_GP1_ARCACHE			),
	.MAXIGP1ARESETN			(M_AXI_GP1_ARESETN			),
	.MAXIGP1ARID			(M_AXI_GP1_ARID			),
	.MAXIGP1ARLEN			(M_AXI_GP1_ARLEN			),
	.MAXIGP1ARLOCK			(M_AXI_GP1_ARLOCK			),
	.MAXIGP1ARPROT			(M_AXI_GP1_ARPROT			),
	.MAXIGP1ARQOS			(M_AXI_GP1_ARQOS			),
	.MAXIGP1ARSIZE			(M_AXI_GP1_ARSIZE			),
	.MAXIGP1ARVALID			(M_AXI_GP1_ARVALID			),
	.MAXIGP1AWADDR			(M_AXI_GP1_AWADDR			),
	.MAXIGP1AWBURST			(M_AXI_GP1_AWBURST			),
	.MAXIGP1AWCACHE			(M_AXI_GP1_AWCACHE			),
	.MAXIGP1AWID			(M_AXI_GP1_AWID			),
	.MAXIGP1AWLEN			(M_AXI_GP1_AWLEN			),
	.MAXIGP1AWLOCK			(M_AXI_GP1_AWLOCK			),
	.MAXIGP1AWPROT			(M_AXI_GP1_AWPROT			),
	.MAXIGP1AWQOS			(M_AXI_GP1_AWQOS			),
	.MAXIGP1AWSIZE			(M_AXI_GP1_AWSIZE			),
	.MAXIGP1AWVALID			(M_AXI_GP1_AWVALID			),
	.MAXIGP1BREADY			(M_AXI_GP1_BREADY			),
	.MAXIGP1RREADY			(M_AXI_GP1_RREADY			),
	.MAXIGP1WDATA			(M_AXI_GP1_WDATA			),
	.MAXIGP1WID			(M_AXI_GP1_WID			),
	.MAXIGP1WLAST			(M_AXI_GP1_WLAST			),
	.MAXIGP1WSTRB			(M_AXI_GP1_WSTRB			),
	.MAXIGP1WVALID			(M_AXI_GP1_WVALID			),
	.SAXIACPARESETN			(),
	.SAXIACPARREADY			(),
	.SAXIACPAWREADY			(),
	.SAXIACPBID			(),
	.SAXIACPBRESP			(),
	.SAXIACPBVALID			(),
	.SAXIACPRDATA			(),
	.SAXIACPRID			(),
	.SAXIACPRLAST			(),
	.SAXIACPRRESP			(),
	.SAXIACPRVALID			(),
	.SAXIACPWREADY			(),
	.SAXIGP0ARESETN			(),
	.SAXIGP0ARREADY			(),
	.SAXIGP0AWREADY			(),
	.SAXIGP0BID			(),
	.SAXIGP0BRESP			(),
	.SAXIGP0BVALID			(),
	.SAXIGP0RDATA			(),
	.SAXIGP0RID			(),
	.SAXIGP0RLAST			(),
	.SAXIGP0RRESP			(),
	.SAXIGP0RVALID			(),
	.SAXIGP0WREADY			(),
	.SAXIGP1ARESETN			(),
	.SAXIGP1ARREADY			(),
	.SAXIGP1AWREADY			(),
	.SAXIGP1BID			(),
	.SAXIGP1BRESP			(),
	.SAXIGP1BVALID			(),
	.SAXIGP1RDATA			(),
	.SAXIGP1RID			(),
	.SAXIGP1RLAST			(),
	.SAXIGP1RRESP			(),
	.SAXIGP1RVALID			(),
	.SAXIGP1WREADY			(),
	.SAXIHP0ARESETN			(),
	.SAXIHP0ARREADY			(),
	.SAXIHP0AWREADY			(),
	.SAXIHP0BID			(),
	.SAXIHP0BRESP			(),
	.SAXIHP0BVALID			(),
	.SAXIHP0RACOUNT			(),
	.SAXIHP0RCOUNT			(),
	.SAXIHP0RDATA			(),
	.SAXIHP0RID			(),
	.SAXIHP0RLAST			(),
	.SAXIHP0RRESP			(),
	.SAXIHP0RVALID			(),
	.SAXIHP0WACOUNT			(),
	.SAXIHP0WCOUNT			(),
	.SAXIHP0WREADY			(),
	.SAXIHP1ARESETN			(),
	.SAXIHP1ARREADY			(),
	.SAXIHP1AWREADY			(),
	.SAXIHP1BID			(),
	.SAXIHP1BRESP			(),
	.SAXIHP1BVALID			(),
	.SAXIHP1RACOUNT			(),
	.SAXIHP1RCOUNT			(),
	.SAXIHP1RDATA			(),
	.SAXIHP1RID			(),
	.SAXIHP1RLAST			(),
	.SAXIHP1RRESP			(),
	.SAXIHP1RVALID			(),
	.SAXIHP1WACOUNT			(),
	.SAXIHP1WCOUNT			(),
	.SAXIHP1WREADY			(),
	.SAXIHP2ARESETN			(),
	.SAXIHP2ARREADY			(),
	.SAXIHP2AWREADY			(),
	.SAXIHP2BID			(),
	.SAXIHP2BRESP			(),
	.SAXIHP2BVALID			(),
	.SAXIHP2RACOUNT			(),
	.SAXIHP2RCOUNT			(),
	.SAXIHP2RDATA			(),
	.SAXIHP2RID			(),
	.SAXIHP2RLAST			(),
	.SAXIHP2RRESP			(),
	.SAXIHP2RVALID			(),
	.SAXIHP2WACOUNT			(),
	.SAXIHP2WCOUNT			(),
	.SAXIHP2WREADY			(),
	.SAXIHP3ARESETN			(),
	.SAXIHP3ARREADY			(),
	.SAXIHP3AWREADY			(),
	.SAXIHP3BID			(),
	.SAXIHP3BRESP			(),
	.SAXIHP3BVALID			(),
	.SAXIHP3RACOUNT			(),
	.SAXIHP3RCOUNT			(),
	.SAXIHP3RDATA			(),
	.SAXIHP3RID			(),
	.SAXIHP3RLAST			(),
	.SAXIHP3RRESP			(),
	.SAXIHP3RVALID			(),
	.SAXIHP3WACOUNT			(),
	.SAXIHP3WCOUNT			(),
	.SAXIHP3WREADY			(),
	.DDRA				(),
	.DDRBA				(),
	.DDRCASB			(),
	.DDRCKE				(),
	.DDRCKN				(),
	.DDRCKP				(),
	.DDRCSB				(),
	.DDRDM				(),
	.DDRDQ				(),
	.DDRDQSN			(),
	.DDRDQSP			(),
	.DDRDRSTB			(),
	.DDRODT				(),
	.DDRRASB			(),
	.DDRVRN				(),
	.DDRVRP				(),
	.DDRWEB				(),
	.MIO				(),
	.PSCLK				(),
	.PSPORB				(),
	.PSSRSTB			(),
	.DDRARB				(),
	.DMA0ACLK			(),
	.DMA0DAREADY			(),
	.DMA0DRLAST			(),
	.DMA0DRTYPE			(),
	.DMA0DRVALID			(),
	.DMA1ACLK			(),
	.DMA1DAREADY			(),
	.DMA1DRLAST			(),
	.DMA1DRTYPE			(),
	.DMA1DRVALID			(),
	.DMA2ACLK			(),
	.DMA2DAREADY			(),
	.DMA2DRLAST			(),
	.DMA2DRTYPE			(),
	.DMA2DRVALID			(),
	.DMA3ACLK			(),
	.DMA3DAREADY			(),
	.DMA3DRLAST			(),
	.DMA3DRTYPE			(),
	.DMA3DRVALID			(),
	.EMIOCAN0PHYRX			(),
	.EMIOCAN1PHYRX			(),
	.EMIOENET0EXTINTIN		(),
	.EMIOENET0GMIICOL		(),
	.EMIOENET0GMIICRS		(),
	.EMIOENET0GMIIRXCLK		(),
	.EMIOENET0GMIIRXD		(),
	.EMIOENET0GMIIRXDV		(),
	.EMIOENET0GMIIRXER		(),
	.EMIOENET0GMIITXCLK		(),
	.EMIOENET0MDIOI			(),
	.EMIOENET1EXTINTIN		(),
	.EMIOENET1GMIICOL		(),
	.EMIOENET1GMIICRS		(),
	.EMIOENET1GMIIRXCLK		(),
	.EMIOENET1GMIIRXD		(),
	.EMIOENET1GMIIRXDV		(),
	.EMIOENET1GMIIRXER		(),
	.EMIOENET1GMIITXCLK		(),
	.EMIOENET1MDIOI			(),
	.EMIOGPIOI			(emio_gpio_i),
	.EMIOI2C0SCLI			(),
	.EMIOI2C0SDAI			(),
	.EMIOI2C1SCLI			(),
	.EMIOI2C1SDAI			(),
	.EMIOPJTAGTCK			(),
	.EMIOPJTAGTDI			(),
	.EMIOPJTAGTMS			(),
	.EMIOSDIO0CDN			(),
	.EMIOSDIO0CLKFB			(),
	.EMIOSDIO0CMDI			(),
	.EMIOSDIO0DATAI			(),
	.EMIOSDIO0WP			(),
	.EMIOSDIO1CDN			(),
	.EMIOSDIO1CLKFB			(),
	.EMIOSDIO1CMDI			(),
	.EMIOSDIO1DATAI			(),
	.EMIOSDIO1WP			(),
	.EMIOSPI0MI			(),
	.EMIOSPI0SCLKI			(),
	.EMIOSPI0SI			(),
	.EMIOSPI0SSIN			(),
	.EMIOSPI1MI			(),
	.EMIOSPI1SCLKI			(),
	.EMIOSPI1SI			(),
	.EMIOSPI1SSIN			(),
	.EMIOSRAMINTIN			(),
	.EMIOTRACECLK			(),
	.EMIOTTC0CLKI			(),
	.EMIOTTC1CLKI			(),
	.EMIOUART0CTSN			(),
	.EMIOUART0DCDN			(),
	.EMIOUART0DSRN			(),
	.EMIOUART0RIN			(),
	.EMIOUART0RX			(),
	.EMIOUART1CTSN			(),
	.EMIOUART1DCDN			(),
	.EMIOUART1DSRN			(),
	.EMIOUART1RIN			(),
	.EMIOUART1RX			(),
	.EMIOUSB0VBUSPWRFAULT		(),
	.EMIOUSB1VBUSPWRFAULT		(),
	.EMIOWDTCLKI			(),
	.EVENTEVENTI			(),
	.FCLKCLKTRIGN			(),
	.FPGAIDLEN			(),
	.FTMDTRACEINATID		(),
	.FTMDTRACEINCLOCK		(),
	.FTMDTRACEINDATA		(),
	.FTMDTRACEINVALID		(),
	.FTMTF2PDEBUG			(),
	.FTMTF2PTRIG			(),
	.FTMTP2FTRIGACK			(),
	.IRQF2P				(),
	.MAXIGP0ACLK			(M_AXI_GP0_ACLK			),
	.MAXIGP0ARREADY			(M_AXI_GP0_ARREADY			),
	.MAXIGP0AWREADY			(M_AXI_GP0_AWREADY			),
	.MAXIGP0BID			(M_AXI_GP0_BID			),
	.MAXIGP0BRESP			(M_AXI_GP0_BRESP			),
	.MAXIGP0BVALID			(M_AXI_GP0_BVALID			),
	.MAXIGP0RDATA			(M_AXI_GP0_RDATA			),
	.MAXIGP0RID			(M_AXI_GP0_RID			),
	.MAXIGP0RLAST			(M_AXI_GP0_RLAST			),
	.MAXIGP0RRESP			(M_AXI_GP0_RRESP			),
	.MAXIGP0RVALID			(M_AXI_GP0_RVALID			),
	.MAXIGP0WREADY			(M_AXI_GP0_WREADY			),
	.MAXIGP1ACLK			(M_AXI_GP1_ACLK			),
	.MAXIGP1ARREADY			(M_AXI_GP1_ARREADY			),
	.MAXIGP1AWREADY			(M_AXI_GP1_AWREADY			),
	.MAXIGP1BID			(M_AXI_GP1_BID			),
	.MAXIGP1BRESP			(M_AXI_GP1_BRESP			),
	.MAXIGP1BVALID			(M_AXI_GP1_BVALID			),
	.MAXIGP1RDATA			(M_AXI_GP1_RDATA			),
	.MAXIGP1RID			(M_AXI_GP1_RID			),
	.MAXIGP1RLAST			(M_AXI_GP1_RLAST			),
	.MAXIGP1RRESP			(M_AXI_GP1_RRESP			),
	.MAXIGP1RVALID			(M_AXI_GP1_RVALID			),
	.MAXIGP1WREADY			(M_AXI_GP1_WREADY			),
	.SAXIACPACLK			(),
	.SAXIACPARADDR			(),
	.SAXIACPARBURST			(),
	.SAXIACPARCACHE			(),
	.SAXIACPARID			(),
	.SAXIACPARLEN			(),
	.SAXIACPARLOCK			(),
	.SAXIACPARPROT			(),
	.SAXIACPARQOS			(),
	.SAXIACPARSIZE			(),
	.SAXIACPARUSER			(),
	.SAXIACPARVALID			(),
	.SAXIACPAWADDR			(),
	.SAXIACPAWBURST			(),
	.SAXIACPAWCACHE			(),
	.SAXIACPAWID			(),
	.SAXIACPAWLEN			(),
	.SAXIACPAWLOCK			(),
	.SAXIACPAWPROT			(),
	.SAXIACPAWQOS			(),
	.SAXIACPAWSIZE			(),
	.SAXIACPAWUSER			(),
	.SAXIACPAWVALID			(),
	.SAXIACPBREADY			(),
	.SAXIACPRREADY			(),
	.SAXIACPWDATA			(),
	.SAXIACPWID			(),
	.SAXIACPWLAST			(),
	.SAXIACPWSTRB			(),
	.SAXIACPWVALID			(),
	.SAXIGP0ACLK			(),
	.SAXIGP0ARADDR			(),
	.SAXIGP0ARBURST			(),
	.SAXIGP0ARCACHE			(),
	.SAXIGP0ARID			(),
	.SAXIGP0ARLEN			(),
	.SAXIGP0ARLOCK			(),
	.SAXIGP0ARPROT			(),
	.SAXIGP0ARQOS			(),
	.SAXIGP0ARSIZE			(),
	.SAXIGP0ARVALID			(),
	.SAXIGP0AWADDR			(),
	.SAXIGP0AWBURST			(),
	.SAXIGP0AWCACHE			(),
	.SAXIGP0AWID			(),
	.SAXIGP0AWLEN			(),
	.SAXIGP0AWLOCK			(),
	.SAXIGP0AWPROT			(),
	.SAXIGP0AWQOS			(),
	.SAXIGP0AWSIZE			(),
	.SAXIGP0AWVALID			(),
	.SAXIGP0BREADY			(),
	.SAXIGP0RREADY			(),
	.SAXIGP0WDATA			(),
	.SAXIGP0WID			(),
	.SAXIGP0WLAST			(),
	.SAXIGP0WSTRB			(),
	.SAXIGP0WVALID			(),
	.SAXIGP1ACLK			(),
	.SAXIGP1ARADDR			(),
	.SAXIGP1ARBURST			(),
	.SAXIGP1ARCACHE			(),
	.SAXIGP1ARID			(),
	.SAXIGP1ARLEN			(),
	.SAXIGP1ARLOCK			(),
	.SAXIGP1ARPROT			(),
	.SAXIGP1ARQOS			(),
	.SAXIGP1ARSIZE			(),
	.SAXIGP1ARVALID			(),
	.SAXIGP1AWADDR			(),
	.SAXIGP1AWBURST			(),
	.SAXIGP1AWCACHE			(),
	.SAXIGP1AWID			(),
	.SAXIGP1AWLEN			(),
	.SAXIGP1AWLOCK			(),
	.SAXIGP1AWPROT			(),
	.SAXIGP1AWQOS			(),
	.SAXIGP1AWSIZE			(),
	.SAXIGP1AWVALID			(),
	.SAXIGP1BREADY			(),
	.SAXIGP1RREADY			(),
	.SAXIGP1WDATA			(),
	.SAXIGP1WID			(),
	.SAXIGP1WLAST			(),
	.SAXIGP1WSTRB			(),
	.SAXIGP1WVALID			(),
	.SAXIHP0ACLK			(),
	.SAXIHP0ARADDR			(),
	.SAXIHP0ARBURST			(),
	.SAXIHP0ARCACHE			(),
	.SAXIHP0ARID			(),
	.SAXIHP0ARLEN			(),
	.SAXIHP0ARLOCK			(),
	.SAXIHP0ARPROT			(),
	.SAXIHP0ARQOS			(),
	.SAXIHP0ARSIZE			(),
	.SAXIHP0ARVALID			(),
	.SAXIHP0AWADDR			(),
	.SAXIHP0AWBURST			(),
	.SAXIHP0AWCACHE			(),
	.SAXIHP0AWID			(),
	.SAXIHP0AWLEN			(),
	.SAXIHP0AWLOCK			(),
	.SAXIHP0AWPROT			(),
	.SAXIHP0AWQOS			(),
	.SAXIHP0AWSIZE			(),
	.SAXIHP0AWVALID			(),
	.SAXIHP0BREADY			(),
	.SAXIHP0RDISSUECAP1EN		(),
	.SAXIHP0RREADY			(),
	.SAXIHP0WDATA			(),
	.SAXIHP0WID			(),
	.SAXIHP0WLAST			(),
	.SAXIHP0WRISSUECAP1EN		(),
	.SAXIHP0WSTRB			(),
	.SAXIHP0WVALID			(),
	.SAXIHP1ACLK			(),
	.SAXIHP1ARADDR			(),
	.SAXIHP1ARBURST			(),
	.SAXIHP1ARCACHE			(),
	.SAXIHP1ARID			(),
	.SAXIHP1ARLEN			(),
	.SAXIHP1ARLOCK			(),
	.SAXIHP1ARPROT			(),
	.SAXIHP1ARQOS			(),
	.SAXIHP1ARSIZE			(),
	.SAXIHP1ARVALID			(),
	.SAXIHP1AWADDR			(),
	.SAXIHP1AWBURST			(),
	.SAXIHP1AWCACHE			(),
	.SAXIHP1AWID			(),
	.SAXIHP1AWLEN			(),
	.SAXIHP1AWLOCK			(),
	.SAXIHP1AWPROT			(),
	.SAXIHP1AWQOS			(),
	.SAXIHP1AWSIZE			(),
	.SAXIHP1AWVALID			(),
	.SAXIHP1BREADY			(),
	.SAXIHP1RDISSUECAP1EN		(),
	.SAXIHP1RREADY			(),
	.SAXIHP1WDATA			(),
	.SAXIHP1WID			(),
	.SAXIHP1WLAST			(),
	.SAXIHP1WRISSUECAP1EN		(),
	.SAXIHP1WSTRB			(),
	.SAXIHP1WVALID			(),
	.SAXIHP2ACLK			(),
	.SAXIHP2ARADDR			(),
	.SAXIHP2ARBURST			(),
	.SAXIHP2ARCACHE			(),
	.SAXIHP2ARID			(),
	.SAXIHP2ARLEN			(),
	.SAXIHP2ARLOCK			(),
	.SAXIHP2ARPROT			(),
	.SAXIHP2ARQOS			(),
	.SAXIHP2ARSIZE			(),
	.SAXIHP2ARVALID			(),
	.SAXIHP2AWADDR			(),
	.SAXIHP2AWBURST			(),
	.SAXIHP2AWCACHE			(),
	.SAXIHP2AWID			(),
	.SAXIHP2AWLEN			(),
	.SAXIHP2AWLOCK			(),
	.SAXIHP2AWPROT			(),
	.SAXIHP2AWQOS			(),
	.SAXIHP2AWSIZE			(),
	.SAXIHP2AWVALID			(),
	.SAXIHP2BREADY			(),
	.SAXIHP2RDISSUECAP1EN		(),
	.SAXIHP2RREADY			(),
	.SAXIHP2WDATA			(),
	.SAXIHP2WID			(),
	.SAXIHP2WLAST			(),
	.SAXIHP2WRISSUECAP1EN		(),
	.SAXIHP2WSTRB			(),
	.SAXIHP2WVALID			(),
	.SAXIHP3ACLK			(),
	.SAXIHP3ARADDR			(),
	.SAXIHP3ARBURST			(),
	.SAXIHP3ARCACHE			(),
	.SAXIHP3ARID			(),
	.SAXIHP3ARLEN			(),
	.SAXIHP3ARLOCK			(),
	.SAXIHP3ARPROT			(),
	.SAXIHP3ARQOS			(),
	.SAXIHP3ARSIZE			(),
	.SAXIHP3ARVALID			(),
	.SAXIHP3AWADDR			(),
	.SAXIHP3AWBURST			(),
	.SAXIHP3AWCACHE			(),
	.SAXIHP3AWID			(),
	.SAXIHP3AWLEN			(),
	.SAXIHP3AWLOCK			(),
	.SAXIHP3AWPROT			(),
	.SAXIHP3AWQOS			(),
	.SAXIHP3AWSIZE			(),
	.SAXIHP3AWVALID			(),
	.SAXIHP3BREADY			(),
	.SAXIHP3RDISSUECAP1EN		(),
	.SAXIHP3RREADY			(),
	.SAXIHP3WDATA			(),
	.SAXIHP3WID			(),
	.SAXIHP3WLAST			(),
	.SAXIHP3WRISSUECAP1EN		(),
	.SAXIHP3WSTRB			(),
	.SAXIHP3WVALID			()
	);

endmodule

module axil_gpio #(
	parameter ALL_INPUT = 0,
	parameter ALL_OUTPUT = 0,
	parameter DEFAULT_OUTPUT = 32'h00000000,
	parameter DEFAULT_TRI = 32'hFFFFFFFF,
	parameter ALL_INPUT_2 = 0,
	parameter ALL_OUTPUT_2 = 0,
	parameter DEFAULT_OUTPUT_2 = 32'h00000000,
	parameter DEFAULT_TRI_2 = 32'hFFFFFFFF
)(
	input s_axi_clk,
	input s_axi_aresetn,

	// Standard AXI Lite
    input           [31:0] s_axi_awaddr,
    input                  s_axi_awvalid,
    output reg             s_axi_awready,

    input           [31:0] s_axi_wdata,
    input           [3:0]  s_axi_wstrb,
    input                  s_axi_wvalid,
    output reg             s_axi_wready,

    output reg       [1:0] s_axi_bresp,
    output reg             s_axi_bvalid,
    input                  s_axi_bready,

    input            [31:0] s_axi_araddr,
    input                  s_axi_arvalid,
    output reg             s_axi_arready,

    output reg       [31:0]s_axi_rdata = 0,
    output reg             s_axi_rvalid,
    input                  s_axi_rready,
    output reg       [1:0] s_axi_rresp,

	// inout [31:0]gpio;
	// inout [31:0]gpio2;
	// genvar i;
	// generate
	// for (i = 0; i < 32; i = i + 1) begin
	//     assign gpio_i[i] = gpio[i];
	//     assign gpio[i] = gpio_t[i] ? 1'bz : gpio_o[i];
	//     assign gpio2_i[i] = gpio2[i];
	//     assign gpio2[i] = gpio2_t[i] ? 1'bz : gpio2_o[i];
	// end
	// endgenerate
	input            [31:0]gpio_i,
	output reg       [31:0]gpio_o,
	output reg       [31:0]gpio_t,
	input            [31:0]gpio2_i,
	output reg       [31:0]gpio2_o,
	output reg       [31:0]gpio2_t,
);
	assign clk = s_axi_clk;
	assign rst_n = s_axi_aresetn;
	
	// GPIO drivers
	reg [31:0]gpio_d_r = 0;
	reg [31:0]gpio_d_w = 0;
	reg [31:0]gpio2_d_r = 0;
	reg [31:0]gpio2_d_w = 0;
	always @ (posedge clk) begin
		gpio_d_r <= gpio_i;
		gpio2_d_r <= gpio2_i;
		gpio_o <= gpio_d_w;
		gpio2_o <= gpio2_d_w;
	end

    // Memory and initialization
	reg [31:0]mem[255:0];
    integer i;
    initial begin
        // Initialize memory to zero
        for (i = 0; i < 256; i = i + 1) begin
            mem[i] = 32'h0;
        end
    end

	// Internal signals
    reg [31:0] write_address;
    reg [31:0] read_address;
    //reg        aw_en;

    // AXI Lite Write Address Channel
    always @(posedge clk) begin
        if (!rst_n) begin
			s_axi_awready <= 1'b1;
        end else begin
			if (s_axi_awvalid) begin
				write_address <= s_axi_awaddr;
			end
        end
    end

    // AXI Lite Write Data Channel
    always @(posedge clk) begin
        if (!rst_n) begin
            s_axi_wready <= 1'b0;
        end else begin
            if (!s_axi_wready && s_axi_wvalid) begin
                s_axi_wready <= 1'b1;
            end else begin
                s_axi_wready <= 1'b0;
            end
        end
    end

    // Write Operation
    always @(posedge clk) begin
        if (!rst_n) begin
			gpio_t <= DEFAULT_TRI;
			gpio2_t <= DEFAULT_TRI_2;
			gpio_d_w <= DEFAULT_OUTPUT;
			gpio2_d_w <= DEFAULT_OUTPUT_2;
            s_axi_bvalid <= 1'b0;
            s_axi_bresp  <= 2'b00;
        end else begin
			if (s_axi_wready && s_axi_wvalid) begin
                // Perform write operation
				case (write_address[7:0])
					8'h00: gpio_d_w <= s_axi_wdata;
					8'h04: gpio_t <= s_axi_wdata;
					8'h08: gpio2_d_w <= s_axi_wdata;
					8'h0C: gpio2_t <= s_axi_wdata;
					default: ;
				endcase
                s_axi_bvalid <= 1'b1;
                s_axi_bresp  <= 2'b00; // OKAY response
            end else if (s_axi_bvalid && s_axi_bready) begin
                s_axi_bvalid <= 1'b0;
            end else begin
                s_axi_bvalid <= s_axi_bvalid;
            end
        end
    end

    // AXI Lite Read Address Channel
    always @(posedge clk) begin
        if (!rst_n) begin
			s_axi_arready <= 1'b0;
        end else begin
			if (!s_axi_arready && s_axi_arvalid) begin
				s_axi_arready <= 1'b1;
				read_address  <= s_axi_araddr;
			end else begin
				s_axi_arready <= 1'b0;
			end
        end
    end

    // Read Operation
    always @(posedge clk) begin
        if (!rst_n) begin
            s_axi_rvalid <= 1'b0;
            s_axi_rresp  <= 2'b00;
        end else begin
            if (s_axi_arready && s_axi_arvalid) begin
                // Perform read operation
				case (read_address[7:0])
					8'h00: s_axi_rdata <= gpio_d_r;
					8'h04: s_axi_rdata <= gpio_t;
					8'h08: s_axi_rdata <= gpio2_d_r;
					8'h0C: s_axi_rdata <= gpio2_t;
					default: ;
				endcase
                s_axi_rvalid <= 1'b1;
                s_axi_rresp  <= 2'b00; // OKAY response
            end else if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
            end else begin
                s_axi_rvalid <= s_axi_rvalid;
            end
        end
	end
endmodule
