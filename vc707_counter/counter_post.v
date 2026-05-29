// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
// Date        : Wed May 27 17:13:20 2026
// Host        : jonathan-nuc10i7fnk running 64-bit KDE neon Unstable Edition
// Command     : write_verilog -force -mode timesim counter_post.v
// Design      : top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "d3097c8e" *) 
(* NotValidForBitStream *)
module top
   (clk_p,
    clk_n,
    rst,
    led);
  input clk_p;
  input clk_n;
  input rst;
  output [7:0]led;

  wire clk;
  wire clk_ibuf;
  (* DIFF_TERM *) (* IBUF_LOW_PWR = 0 *) wire clk_n;
  (* DIFF_TERM *) (* IBUF_LOW_PWR = 0 *) wire clk_p;
  wire \count[7]_i_3_n_0 ;
  wire \count[7]_i_4_n_0 ;
  wire \count[7]_i_5_n_0 ;
  wire \count[7]_i_6_n_0 ;
  wire \count[7]_i_7_n_0 ;
  wire [7:0]led;
  wire [7:0]led_OBUF;
  wire [7:0]p_0_in;
  wire \prescaler[0]_i_2_n_0 ;
  wire [23:0]prescaler_reg;
  wire \prescaler_reg[0]_i_1_n_0 ;
  wire \prescaler_reg[0]_i_1_n_4 ;
  wire \prescaler_reg[0]_i_1_n_5 ;
  wire \prescaler_reg[0]_i_1_n_6 ;
  wire \prescaler_reg[0]_i_1_n_7 ;
  wire \prescaler_reg[12]_i_1_n_0 ;
  wire \prescaler_reg[12]_i_1_n_4 ;
  wire \prescaler_reg[12]_i_1_n_5 ;
  wire \prescaler_reg[12]_i_1_n_6 ;
  wire \prescaler_reg[12]_i_1_n_7 ;
  wire \prescaler_reg[16]_i_1_n_0 ;
  wire \prescaler_reg[16]_i_1_n_4 ;
  wire \prescaler_reg[16]_i_1_n_5 ;
  wire \prescaler_reg[16]_i_1_n_6 ;
  wire \prescaler_reg[16]_i_1_n_7 ;
  wire \prescaler_reg[20]_i_1_n_4 ;
  wire \prescaler_reg[20]_i_1_n_5 ;
  wire \prescaler_reg[20]_i_1_n_6 ;
  wire \prescaler_reg[20]_i_1_n_7 ;
  wire \prescaler_reg[4]_i_1_n_0 ;
  wire \prescaler_reg[4]_i_1_n_4 ;
  wire \prescaler_reg[4]_i_1_n_5 ;
  wire \prescaler_reg[4]_i_1_n_6 ;
  wire \prescaler_reg[4]_i_1_n_7 ;
  wire \prescaler_reg[8]_i_1_n_0 ;
  wire \prescaler_reg[8]_i_1_n_4 ;
  wire \prescaler_reg[8]_i_1_n_5 ;
  wire \prescaler_reg[8]_i_1_n_6 ;
  wire \prescaler_reg[8]_i_1_n_7 ;
  wire rst;
  wire rst_IBUF;
  wire sel;
  wire [2:0]\NLW_prescaler_reg[0]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_prescaler_reg[12]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_prescaler_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_prescaler_reg[20]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_prescaler_reg[4]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_prescaler_reg[8]_i_1_CO_UNCONNECTED ;

  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(led_OBUF[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(led_OBUF[0]),
        .I1(led_OBUF[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count[2]_i_1 
       (.I0(led_OBUF[0]),
        .I1(led_OBUF[1]),
        .I2(led_OBUF[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \count[3]_i_1 
       (.I0(led_OBUF[1]),
        .I1(led_OBUF[0]),
        .I2(led_OBUF[2]),
        .I3(led_OBUF[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \count[4]_i_1 
       (.I0(led_OBUF[2]),
        .I1(led_OBUF[0]),
        .I2(led_OBUF[1]),
        .I3(led_OBUF[3]),
        .I4(led_OBUF[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \count[5]_i_1 
       (.I0(led_OBUF[3]),
        .I1(led_OBUF[1]),
        .I2(led_OBUF[0]),
        .I3(led_OBUF[2]),
        .I4(led_OBUF[4]),
        .I5(led_OBUF[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[6]_i_1 
       (.I0(\count[7]_i_7_n_0 ),
        .I1(led_OBUF[6]),
        .O(p_0_in[6]));
  LUT4 #(
    .INIT(16'h4000)) 
    \count[7]_i_1 
       (.I0(\count[7]_i_3_n_0 ),
        .I1(\count[7]_i_4_n_0 ),
        .I2(\count[7]_i_5_n_0 ),
        .I3(\count[7]_i_6_n_0 ),
        .O(sel));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \count[7]_i_2 
       (.I0(\count[7]_i_7_n_0 ),
        .I1(led_OBUF[6]),
        .I2(led_OBUF[7]),
        .O(p_0_in[7]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \count[7]_i_3 
       (.I0(prescaler_reg[14]),
        .I1(prescaler_reg[12]),
        .I2(prescaler_reg[13]),
        .I3(prescaler_reg[17]),
        .I4(prescaler_reg[15]),
        .I5(prescaler_reg[16]),
        .O(\count[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \count[7]_i_4 
       (.I0(prescaler_reg[22]),
        .I1(prescaler_reg[21]),
        .I2(prescaler_reg[23]),
        .I3(prescaler_reg[18]),
        .I4(prescaler_reg[19]),
        .I5(prescaler_reg[20]),
        .O(\count[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \count[7]_i_5 
       (.I0(prescaler_reg[11]),
        .I1(prescaler_reg[9]),
        .I2(prescaler_reg[10]),
        .I3(prescaler_reg[6]),
        .I4(prescaler_reg[7]),
        .I5(prescaler_reg[8]),
        .O(\count[7]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    \count[7]_i_6 
       (.I0(prescaler_reg[5]),
        .I1(prescaler_reg[3]),
        .I2(prescaler_reg[4]),
        .I3(prescaler_reg[0]),
        .I4(prescaler_reg[1]),
        .I5(prescaler_reg[2]),
        .O(\count[7]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count[7]_i_7 
       (.I0(led_OBUF[5]),
        .I1(led_OBUF[3]),
        .I2(led_OBUF[1]),
        .I3(led_OBUF[0]),
        .I4(led_OBUF[2]),
        .I5(led_OBUF[4]),
        .O(\count[7]_i_7_n_0 ));
  FDRE \count_reg[0] 
       (.C(clk),
        .CE(sel),
        .D(p_0_in[0]),
        .Q(led_OBUF[0]),
        .R(rst_IBUF));
  FDRE \count_reg[1] 
       (.C(clk),
        .CE(sel),
        .D(p_0_in[1]),
        .Q(led_OBUF[1]),
        .R(rst_IBUF));
  FDRE \count_reg[2] 
       (.C(clk),
        .CE(sel),
        .D(p_0_in[2]),
        .Q(led_OBUF[2]),
        .R(rst_IBUF));
  FDRE \count_reg[3] 
       (.C(clk),
        .CE(sel),
        .D(p_0_in[3]),
        .Q(led_OBUF[3]),
        .R(rst_IBUF));
  FDRE \count_reg[4] 
       (.C(clk),
        .CE(sel),
        .D(p_0_in[4]),
        .Q(led_OBUF[4]),
        .R(rst_IBUF));
  FDRE \count_reg[5] 
       (.C(clk),
        .CE(sel),
        .D(p_0_in[5]),
        .Q(led_OBUF[5]),
        .R(rst_IBUF));
  FDRE \count_reg[6] 
       (.C(clk),
        .CE(sel),
        .D(p_0_in[6]),
        .Q(led_OBUF[6]),
        .R(rst_IBUF));
  FDRE \count_reg[7] 
       (.C(clk),
        .CE(sel),
        .D(p_0_in[7]),
        .Q(led_OBUF[7]),
        .R(rst_IBUF));
  OBUF \led_OBUF[0]_inst 
       (.I(led_OBUF[0]),
        .O(led[0]));
  OBUF \led_OBUF[1]_inst 
       (.I(led_OBUF[1]),
        .O(led[1]));
  OBUF \led_OBUF[2]_inst 
       (.I(led_OBUF[2]),
        .O(led[2]));
  OBUF \led_OBUF[3]_inst 
       (.I(led_OBUF[3]),
        .O(led[3]));
  OBUF \led_OBUF[4]_inst 
       (.I(led_OBUF[4]),
        .O(led[4]));
  OBUF \led_OBUF[5]_inst 
       (.I(led_OBUF[5]),
        .O(led[5]));
  OBUF \led_OBUF[6]_inst 
       (.I(led_OBUF[6]),
        .O(led[6]));
  OBUF \led_OBUF[7]_inst 
       (.I(led_OBUF[7]),
        .O(led[7]));
  LUT1 #(
    .INIT(2'h1)) 
    \prescaler[0]_i_2 
       (.I0(prescaler_reg[0]),
        .O(\prescaler[0]_i_2_n_0 ));
  FDRE \prescaler_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[0]_i_1_n_7 ),
        .Q(prescaler_reg[0]),
        .R(rst_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \prescaler_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\prescaler_reg[0]_i_1_n_0 ,\NLW_prescaler_reg[0]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\prescaler_reg[0]_i_1_n_4 ,\prescaler_reg[0]_i_1_n_5 ,\prescaler_reg[0]_i_1_n_6 ,\prescaler_reg[0]_i_1_n_7 }),
        .S({prescaler_reg[3:1],\prescaler[0]_i_2_n_0 }));
  FDRE \prescaler_reg[10] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[8]_i_1_n_5 ),
        .Q(prescaler_reg[10]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[11] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[8]_i_1_n_4 ),
        .Q(prescaler_reg[11]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[12] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[12]_i_1_n_7 ),
        .Q(prescaler_reg[12]),
        .R(rst_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \prescaler_reg[12]_i_1 
       (.CI(\prescaler_reg[8]_i_1_n_0 ),
        .CO({\prescaler_reg[12]_i_1_n_0 ,\NLW_prescaler_reg[12]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prescaler_reg[12]_i_1_n_4 ,\prescaler_reg[12]_i_1_n_5 ,\prescaler_reg[12]_i_1_n_6 ,\prescaler_reg[12]_i_1_n_7 }),
        .S(prescaler_reg[15:12]));
  FDRE \prescaler_reg[13] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[12]_i_1_n_6 ),
        .Q(prescaler_reg[13]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[14] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[12]_i_1_n_5 ),
        .Q(prescaler_reg[14]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[15] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[12]_i_1_n_4 ),
        .Q(prescaler_reg[15]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[16] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[16]_i_1_n_7 ),
        .Q(prescaler_reg[16]),
        .R(rst_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \prescaler_reg[16]_i_1 
       (.CI(\prescaler_reg[12]_i_1_n_0 ),
        .CO({\prescaler_reg[16]_i_1_n_0 ,\NLW_prescaler_reg[16]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prescaler_reg[16]_i_1_n_4 ,\prescaler_reg[16]_i_1_n_5 ,\prescaler_reg[16]_i_1_n_6 ,\prescaler_reg[16]_i_1_n_7 }),
        .S(prescaler_reg[19:16]));
  FDRE \prescaler_reg[17] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[16]_i_1_n_6 ),
        .Q(prescaler_reg[17]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[18] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[16]_i_1_n_5 ),
        .Q(prescaler_reg[18]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[19] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[16]_i_1_n_4 ),
        .Q(prescaler_reg[19]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[0]_i_1_n_6 ),
        .Q(prescaler_reg[1]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[20] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[20]_i_1_n_7 ),
        .Q(prescaler_reg[20]),
        .R(rst_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \prescaler_reg[20]_i_1 
       (.CI(\prescaler_reg[16]_i_1_n_0 ),
        .CO(\NLW_prescaler_reg[20]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prescaler_reg[20]_i_1_n_4 ,\prescaler_reg[20]_i_1_n_5 ,\prescaler_reg[20]_i_1_n_6 ,\prescaler_reg[20]_i_1_n_7 }),
        .S(prescaler_reg[23:20]));
  FDRE \prescaler_reg[21] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[20]_i_1_n_6 ),
        .Q(prescaler_reg[21]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[22] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[20]_i_1_n_5 ),
        .Q(prescaler_reg[22]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[23] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[20]_i_1_n_4 ),
        .Q(prescaler_reg[23]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[0]_i_1_n_5 ),
        .Q(prescaler_reg[2]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[0]_i_1_n_4 ),
        .Q(prescaler_reg[3]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[4]_i_1_n_7 ),
        .Q(prescaler_reg[4]),
        .R(rst_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \prescaler_reg[4]_i_1 
       (.CI(\prescaler_reg[0]_i_1_n_0 ),
        .CO({\prescaler_reg[4]_i_1_n_0 ,\NLW_prescaler_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prescaler_reg[4]_i_1_n_4 ,\prescaler_reg[4]_i_1_n_5 ,\prescaler_reg[4]_i_1_n_6 ,\prescaler_reg[4]_i_1_n_7 }),
        .S(prescaler_reg[7:4]));
  FDRE \prescaler_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[4]_i_1_n_6 ),
        .Q(prescaler_reg[5]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[4]_i_1_n_5 ),
        .Q(prescaler_reg[6]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[4]_i_1_n_4 ),
        .Q(prescaler_reg[7]),
        .R(rst_IBUF));
  FDRE \prescaler_reg[8] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[8]_i_1_n_7 ),
        .Q(prescaler_reg[8]),
        .R(rst_IBUF));
  (* ADDER_THRESHOLD = "11" *) 
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 \prescaler_reg[8]_i_1 
       (.CI(\prescaler_reg[4]_i_1_n_0 ),
        .CO({\prescaler_reg[8]_i_1_n_0 ,\NLW_prescaler_reg[8]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\prescaler_reg[8]_i_1_n_4 ,\prescaler_reg[8]_i_1_n_5 ,\prescaler_reg[8]_i_1_n_6 ,\prescaler_reg[8]_i_1_n_7 }),
        .S(prescaler_reg[11:8]));
  FDRE \prescaler_reg[9] 
       (.C(clk),
        .CE(1'b1),
        .D(\prescaler_reg[8]_i_1_n_6 ),
        .Q(prescaler_reg[9]),
        .R(rst_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG sysclk_bufg
       (.I(clk_ibuf),
        .O(clk));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUFDS sysclk_ibufds
       (.I(clk_p),
        .IB(clk_n),
        .O(clk_ibuf));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
