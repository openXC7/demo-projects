// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1.1 (lin64) Build 2960000 Wed Aug  5 22:57:21 MDT 2020
// Date        : Wed May 27 18:57:25 2026
// Host        : jonathan-nuc10i7fnk running 64-bit KDE neon Unstable Edition
// Command     : write_verilog -force -mode timesim counter_suite_post.v
// Design      : top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "aba53755" *) 
(* NotValidForBitStream *)
module top
   (rst,
    clk_n,
    clk_p,
    led);
  input rst;
  input clk_n;
  input clk_p;
  output [7:0]led;

  wire n10;
  wire n100;
  wire n101;
  wire n102;
  wire n103;
  wire n104;
  wire n105;
  wire n106;
  wire n107;
  wire n108;
  wire n109;
  wire n11;
  wire n113;
  wire n114;
  wire n116;
  wire n12;
  wire n120;
  wire n121;
  wire n123;
  wire n124;
  wire n125;
  wire n13;
  wire n130;
  wire n131;
  wire n132;
  wire n133;
  wire n137;
  wire n138;
  wire n139;
  wire n14;
  wire n140;
  wire n141;
  wire n142;
  wire n143;
  wire n144;
  wire n145;
  wire n146;
  wire n147;
  wire n148;
  wire n149;
  wire n15;
  wire n150;
  wire n151;
  wire n152;
  wire n153;
  wire n154;
  wire n159;
  wire n16;
  wire n160;
  wire n161;
  wire n162;
  wire n163;
  wire n164;
  wire n165;
  wire n166;
  wire n167;
  wire n17;
  wire n2;
  wire n22;
  wire n23;
  wire n24;
  wire n25;
  wire n29;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire n3;
  wire n30;
  wire n31;
  wire n32;
  wire n33;
  wire n37;
  wire n38;
  wire n39;
  (* DIFF_TERM = 0 *) (* IBUF_LOW_PWR *) wire n4;
  wire n40;
  wire n41;
  wire n45;
  wire n46;
  wire n47;
  wire n48;
  wire n49;
  wire n5;
  wire n53;
  wire n54;
  wire n55;
  wire n56;
  wire n57;
  wire n6;
  wire n61;
  wire n62;
  wire n63;
  wire n64;
  wire n65;
  wire n66;
  wire n67;
  wire n68;
  wire n69;
  wire n7;
  wire n70;
  wire n71;
  wire n72;
  wire n73;
  wire n74;
  wire n75;
  wire n76;
  wire n77;
  wire n78;
  wire n79;
  wire n8;
  wire n80;
  wire n81;
  wire n82;
  wire n83;
  wire n84;
  wire n85;
  wire n86;
  wire n87;
  wire n88;
  wire n89;
  wire n9;
  wire n90;
  wire n91;
  wire n92;
  wire n93;
  wire n94;
  wire n95;
  wire n96;
  wire n97;
  wire n98;
  wire n99;
  wire [2:0]NLW_c4_0_211_CO_UNCONNECTED;
  wire [3:0]NLW_c4_1_189_CO_UNCONNECTED;
  wire [2:0]NLW_c4_2_410_CO_UNCONNECTED;
  wire [2:0]NLW_c4_3_384_CO_UNCONNECTED;
  wire [2:0]NLW_c4_4_359_CO_UNCONNECTED;
  wire [2:0]NLW_c4_5_334_CO_UNCONNECTED;
  wire [2:0]NLW_c4_6_309_CO_UNCONNECTED;
  wire [3:0]NLW_c4_7_289_CO_UNCONNECTED;

  assign led[7] = n167;
  assign led[6] = n166;
  assign led[5] = n165;
  assign led[4] = n148;
  assign led[3] = n147;
  assign led[2] = n146;
  assign led[1] = n145;
  assign led[0] = n5;
  assign n2 = rst;
  assign n3 = clk_n;
  assign n4 = clk_p;
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 c4_0_211
       (.CI(1'b0),
        .CO({n137,NLW_c4_0_211_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({n138,n140,n142,n6}),
        .O({n133,n132,n131,n130}),
        .S({n138,n140,n142,n144}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 c4_1_189
       (.CI(n137),
        .CO(NLW_c4_1_189_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({n159,n161,n163,n149}),
        .O({n154,n153,n152,n151}),
        .S({n159,n161,n163,n149}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 c4_2_410
       (.CI(1'b0),
        .CO({n61,NLW_c4_2_410_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({n62,n64,n66,n68}),
        .O({n57,n56,n55,n54}),
        .S({n62,n64,n66,n70}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 c4_3_384
       (.CI(n61),
        .CO({n53,NLW_c4_3_384_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({n71,n73,n75,n77}),
        .O({n49,n48,n47,n46}),
        .S({n71,n73,n75,n77}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 c4_4_359
       (.CI(n53),
        .CO({n45,NLW_c4_4_359_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({n79,n81,n83,n85}),
        .O({n41,n40,n39,n38}),
        .S({n79,n81,n83,n85}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 c4_5_334
       (.CI(n45),
        .CO({n37,NLW_c4_5_334_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({n87,n89,n91,n93}),
        .O({n33,n32,n31,n30}),
        .S({n87,n89,n91,n93}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 c4_6_309
       (.CI(n37),
        .CO({n29,NLW_c4_6_309_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({n95,n97,n99,n101}),
        .O({n25,n24,n23,n22}),
        .S({n95,n97,n99,n101}));
  (* OPT_MODIFIED = "SWEEP" *) 
  CARRY4 c4_7_289
       (.CI(n29),
        .CO(NLW_c4_7_289_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({n103,n12,n105,n107}),
        .O({n17,n16,n15,n14}),
        .S({n103,n12,n105,n107}));
  LUT1 #(
    .INIT(2'h1)) 
    inv_0
       (.I0(n68),
        .O(n70));
  LUT1 #(
    .INIT(2'h1)) 
    inv_1
       (.I0(n6),
        .O(n144));
  BUFG the_BUFG_456
       (.I(n8),
        .O(n7));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_196
       (.C(n7),
        .CE(1'b1),
        .D(n164),
        .Q(n163),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_201
       (.C(n7),
        .CE(1'b1),
        .D(n162),
        .Q(n161),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_206
       (.C(n7),
        .CE(1'b1),
        .D(n160),
        .Q(n159),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_218
       (.C(n7),
        .CE(1'b1),
        .D(n150),
        .Q(n149),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_232
       (.C(n7),
        .CE(1'b1),
        .D(n143),
        .Q(n142),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_237
       (.C(n7),
        .CE(1'b1),
        .D(n141),
        .Q(n140),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_242
       (.C(n7),
        .CE(1'b1),
        .D(n139),
        .Q(n138),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_295
       (.C(n7),
        .CE(1'b1),
        .D(n108),
        .Q(n107),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_300
       (.C(n7),
        .CE(1'b1),
        .D(n106),
        .Q(n105),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_305
       (.C(n7),
        .CE(1'b1),
        .D(n104),
        .Q(n103),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_315
       (.C(n7),
        .CE(1'b1),
        .D(n102),
        .Q(n101),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_320
       (.C(n7),
        .CE(1'b1),
        .D(n100),
        .Q(n99),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_325
       (.C(n7),
        .CE(1'b1),
        .D(n98),
        .Q(n97),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_330
       (.C(n7),
        .CE(1'b1),
        .D(n96),
        .Q(n95),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_340
       (.C(n7),
        .CE(1'b1),
        .D(n94),
        .Q(n93),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_345
       (.C(n7),
        .CE(1'b1),
        .D(n92),
        .Q(n91),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_350
       (.C(n7),
        .CE(1'b1),
        .D(n90),
        .Q(n89),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_355
       (.C(n7),
        .CE(1'b1),
        .D(n88),
        .Q(n87),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_365
       (.C(n7),
        .CE(1'b1),
        .D(n86),
        .Q(n85),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_370
       (.C(n7),
        .CE(1'b1),
        .D(n84),
        .Q(n83),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_375
       (.C(n7),
        .CE(1'b1),
        .D(n82),
        .Q(n81),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_380
       (.C(n7),
        .CE(1'b1),
        .D(n80),
        .Q(n79),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_390
       (.C(n7),
        .CE(1'b1),
        .D(n78),
        .Q(n77),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_395
       (.C(n7),
        .CE(1'b1),
        .D(n76),
        .Q(n75),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_400
       (.C(n7),
        .CE(1'b1),
        .D(n74),
        .Q(n73),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_405
       (.C(n7),
        .CE(1'b1),
        .D(n72),
        .Q(n71),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_416
       (.C(n7),
        .CE(1'b1),
        .D(n69),
        .Q(n68),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_421
       (.C(n7),
        .CE(1'b1),
        .D(n67),
        .Q(n66),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_426
       (.C(n7),
        .CE(1'b1),
        .D(n65),
        .Q(n64),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_431
       (.C(n7),
        .CE(1'b1),
        .D(n63),
        .Q(n62),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_446
       (.C(n7),
        .CE(1'b1),
        .D(n13),
        .Q(n12),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    the_FDRE_458
       (.C(n7),
        .CE(1'b1),
        .D(n9),
        .Q(n6),
        .R(1'b0));
  IBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    the_IBUFDS_454
       (.I(n4),
        .IB(n3),
        .O(n8));
  IBUF the_IBUF_450
       (.I(n2),
        .O(n10));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_293
       (.I0(n10),
        .I1(n14),
        .O(n108));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_298
       (.I0(n10),
        .I1(n15),
        .O(n106));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_303
       (.I0(n10),
        .I1(n17),
        .O(n104));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_313
       (.I0(n10),
        .I1(n22),
        .O(n102));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_318
       (.I0(n10),
        .I1(n23),
        .O(n100));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_323
       (.I0(n10),
        .I1(n24),
        .O(n98));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_328
       (.I0(n10),
        .I1(n25),
        .O(n96));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_338
       (.I0(n10),
        .I1(n30),
        .O(n94));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_343
       (.I0(n10),
        .I1(n31),
        .O(n92));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_348
       (.I0(n10),
        .I1(n32),
        .O(n90));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_353
       (.I0(n10),
        .I1(n33),
        .O(n88));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_363
       (.I0(n10),
        .I1(n38),
        .O(n86));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_368
       (.I0(n10),
        .I1(n39),
        .O(n84));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_373
       (.I0(n10),
        .I1(n40),
        .O(n82));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_378
       (.I0(n10),
        .I1(n41),
        .O(n80));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_388
       (.I0(n10),
        .I1(n46),
        .O(n78));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_393
       (.I0(n10),
        .I1(n47),
        .O(n76));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_398
       (.I0(n10),
        .I1(n48),
        .O(n74));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_403
       (.I0(n10),
        .I1(n49),
        .O(n72));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_414
       (.I0(n10),
        .I1(n54),
        .O(n69));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_419
       (.I0(n10),
        .I1(n55),
        .O(n67));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_424
       (.I0(n10),
        .I1(n56),
        .O(n65));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_429
       (.I0(n10),
        .I1(n57),
        .O(n63));
  LUT2 #(
    .INIT(4'h4)) 
    the_LUT2_444
       (.I0(n10),
        .I1(n16),
        .O(n13));
  LUT3 #(
    .INIT(8'h10)) 
    the_LUT3_448
       (.I0(n12),
        .I1(n103),
        .I2(n109),
        .O(n11));
  LUT4 #(
    .INIT(16'h3202)) 
    the_LUT4_193
       (.I0(n163),
        .I1(n10),
        .I2(n11),
        .I3(n152),
        .O(n164));
  LUT4 #(
    .INIT(16'h3202)) 
    the_LUT4_199
       (.I0(n161),
        .I1(n10),
        .I2(n11),
        .I3(n153),
        .O(n162));
  LUT4 #(
    .INIT(16'h3202)) 
    the_LUT4_204
       (.I0(n159),
        .I1(n10),
        .I2(n11),
        .I3(n154),
        .O(n160));
  LUT4 #(
    .INIT(16'h3202)) 
    the_LUT4_216
       (.I0(n149),
        .I1(n10),
        .I2(n11),
        .I3(n151),
        .O(n150));
  LUT4 #(
    .INIT(16'h3202)) 
    the_LUT4_230
       (.I0(n142),
        .I1(n10),
        .I2(n11),
        .I3(n131),
        .O(n143));
  LUT4 #(
    .INIT(16'h3202)) 
    the_LUT4_235
       (.I0(n140),
        .I1(n10),
        .I2(n11),
        .I3(n132),
        .O(n141));
  LUT4 #(
    .INIT(16'h3202)) 
    the_LUT4_240
       (.I0(n138),
        .I1(n10),
        .I2(n11),
        .I3(n133),
        .O(n139));
  LUT4 #(
    .INIT(16'h3202)) 
    the_LUT4_452
       (.I0(n6),
        .I1(n10),
        .I2(n11),
        .I3(n130),
        .O(n9));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    the_LUT6_253
       (.I0(n68),
        .I1(n66),
        .I2(n64),
        .I3(n62),
        .I4(n77),
        .I5(n75),
        .O(n125));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    the_LUT6_261
       (.I0(n85),
        .I1(n83),
        .I2(n81),
        .I3(n79),
        .I4(n93),
        .I5(n91),
        .O(n121));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    the_LUT6_275
       (.I0(n87),
        .I1(n101),
        .I2(n99),
        .I3(n97),
        .I4(n95),
        .I5(n107),
        .O(n114));
  (* OPT_MODIFIED = "PROPCONST" *) 
  MUXF7 the_MUXF7_255
       (.I0(n125),
        .I1(1'b0),
        .O(n124),
        .S(n73));
  (* OPT_MODIFIED = "PROPCONST" *) 
  MUXF7 the_MUXF7_263
       (.I0(n121),
        .I1(1'b0),
        .O(n120),
        .S(n89));
  (* OPT_MODIFIED = "PROPCONST" *) 
  MUXF7 the_MUXF7_277
       (.I0(n114),
        .I1(1'b0),
        .O(n113),
        .S(n105));
  (* OPT_MODIFIED = "PROPCONST" *) 
  MUXF8 the_MUXF8_257
       (.I0(n124),
        .I1(1'b0),
        .O(n123),
        .S(n71));
  (* OPT_MODIFIED = "PROPCONST" *) 
  MUXF8 the_MUXF8_271
       (.I0(1'b0),
        .I1(n120),
        .O(n116),
        .S(n123));
  (* OPT_MODIFIED = "PROPCONST" *) 
  MUXF8 the_MUXF8_285
       (.I0(1'b0),
        .I1(n113),
        .O(n109),
        .S(n116));
  OBUF the_OBUF_180
       (.I(n159),
        .O(n167));
  OBUF the_OBUF_182
       (.I(n161),
        .O(n166));
  OBUF the_OBUF_184
       (.I(n163),
        .O(n165));
  OBUF the_OBUF_220
       (.I(n149),
        .O(n148));
  OBUF the_OBUF_222
       (.I(n138),
        .O(n147));
  OBUF the_OBUF_224
       (.I(n140),
        .O(n146));
  OBUF the_OBUF_226
       (.I(n142),
        .O(n145));
  OBUF the_OBUF_460
       (.I(n6),
        .O(n5));
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
