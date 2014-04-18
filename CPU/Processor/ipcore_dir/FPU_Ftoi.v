////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.28xd
//  \   \         Application: netgen
//  /   /         Filename: FPU_Ftoi.v
// /___/   /\     Timestamp: Thu Apr 17 17:39:43 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog E:/CPU/ipcore_dir/tmp/_cg/FPU_Ftoi.ngc E:/CPU/ipcore_dir/tmp/_cg/FPU_Ftoi.v 
// Device	: 5vlx110tff1136-2
// Input file	: E:/CPU/ipcore_dir/tmp/_cg/FPU_Ftoi.ngc
// Output file	: E:/CPU/ipcore_dir/tmp/_cg/FPU_Ftoi.v
// # of Modules	: 1
// Design Name	: FPU_Ftoi
// Xilinx        : C:\Xilinx\14.2\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module FPU_Ftoi (
  clk, result, a
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output [31 : 0] result;
  input [31 : 0] a;
  
  // synthesis translate_off
  
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire sig000000f7;
  wire sig000000f8;
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire NLW_blk0000000c_O_UNCONNECTED;
  wire NLW_blk00000013_O_UNCONNECTED;
  wire NLW_blk00000054_O_UNCONNECTED;
  wire [31 : 0] \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT ;
  assign
    result[31] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [31],
    result[30] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [30],
    result[29] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [29],
    result[28] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [28],
    result[27] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [27],
    result[26] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [26],
    result[25] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [25],
    result[24] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [24],
    result[23] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [23],
    result[22] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [22],
    result[21] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [21],
    result[20] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [20],
    result[19] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [19],
    result[18] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [18],
    result[17] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [17],
    result[16] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [16],
    result[15] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [15],
    result[14] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [14],
    result[13] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [13],
    result[12] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [12],
    result[11] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [11],
    result[10] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [10],
    result[9] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [9],
    result[8] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [8],
    result[7] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [7],
    result[6] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [6],
    result[5] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [5],
    result[4] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [4],
    result[3] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [3],
    result[2] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [2],
    result[1] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [1],
    result[0] = \U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [0];
  GND   blk00000001 (
    .G(sig00000001)
  );
  VCC   blk00000002 (
    .P(sig00000002)
  );
  MUXF7   blk00000003 (
    .I0(sig00000059),
    .I1(sig0000005a),
    .S(sig000000ff),
    .O(sig00000051)
  );
  MUXF7   blk00000004 (
    .I0(sig00000002),
    .I1(sig00000002),
    .S(sig000000ff),
    .O(sig00000052)
  );
  MUXF8   blk00000005 (
    .I0(sig00000051),
    .I1(sig00000052),
    .S(sig00000001),
    .O(sig00000100)
  );
  MUXCY   blk00000006 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000046),
    .O(sig00000053)
  );
  MUXCY   blk00000007 (
    .CI(sig00000053),
    .DI(sig00000001),
    .S(sig00000047),
    .O(sig00000054)
  );
  MUXCY   blk00000008 (
    .CI(sig00000054),
    .DI(sig00000001),
    .S(sig00000048),
    .O(sig00000055)
  );
  MUXCY   blk00000009 (
    .CI(sig00000055),
    .DI(sig00000001),
    .S(sig00000049),
    .O(sig00000056)
  );
  MUXCY   blk0000000a (
    .CI(sig00000056),
    .DI(sig00000001),
    .S(sig0000004a),
    .O(sig00000057)
  );
  MUXCY   blk0000000b (
    .CI(sig00000057),
    .DI(sig00000001),
    .S(sig00000001),
    .O(sig00000058)
  );
  MUXCY   blk0000000c (
    .CI(sig00000065),
    .DI(sig00000001),
    .S(sig0000006b),
    .O(NLW_blk0000000c_O_UNCONNECTED)
  );
  MUXCY   blk0000000d (
    .CI(sig00000064),
    .DI(sig00000001),
    .S(sig0000006a),
    .O(sig00000065)
  );
  MUXCY   blk0000000e (
    .CI(sig00000063),
    .DI(sig00000001),
    .S(sig00000069),
    .O(sig00000064)
  );
  MUXCY   blk0000000f (
    .CI(sig00000062),
    .DI(sig00000001),
    .S(sig00000068),
    .O(sig00000063)
  );
  MUXCY   blk00000010 (
    .CI(sig00000061),
    .DI(sig00000001),
    .S(sig00000067),
    .O(sig00000062)
  );
  MUXCY   blk00000011 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000066),
    .O(sig00000061)
  );
  MUXCY   blk00000012 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig000000de),
    .O(sig00000078)
  );
  XORCY   blk00000013 (
    .CI(sig00000002),
    .LI(sig000000de),
    .O(NLW_blk00000013_O_UNCONNECTED)
  );
  MUXCY   blk00000014 (
    .CI(sig00000078),
    .DI(sig00000001),
    .S(sig000000bb),
    .O(sig00000083)
  );
  XORCY   blk00000015 (
    .CI(sig00000078),
    .LI(sig000000bb),
    .O(sig000000e9)
  );
  MUXCY   blk00000016 (
    .CI(sig00000083),
    .DI(sig00000001),
    .S(sig000000c6),
    .O(sig00000088)
  );
  XORCY   blk00000017 (
    .CI(sig00000083),
    .LI(sig000000c6),
    .O(sig000000f4)
  );
  MUXCY   blk00000018 (
    .CI(sig00000088),
    .DI(sig00000001),
    .S(sig000000d1),
    .O(sig00000089)
  );
  XORCY   blk00000019 (
    .CI(sig00000088),
    .LI(sig000000d1),
    .O(sig000000f8)
  );
  MUXCY   blk0000001a (
    .CI(sig00000089),
    .DI(sig00000001),
    .S(sig000000d3),
    .O(sig0000008a)
  );
  XORCY   blk0000001b (
    .CI(sig00000089),
    .LI(sig000000d3),
    .O(sig000000f9)
  );
  MUXCY   blk0000001c (
    .CI(sig0000008a),
    .DI(sig00000001),
    .S(sig000000d4),
    .O(sig0000008b)
  );
  XORCY   blk0000001d (
    .CI(sig0000008a),
    .LI(sig000000d4),
    .O(sig000000fa)
  );
  MUXCY   blk0000001e (
    .CI(sig0000008b),
    .DI(sig00000001),
    .S(sig000000d5),
    .O(sig0000008c)
  );
  XORCY   blk0000001f (
    .CI(sig0000008b),
    .LI(sig000000d5),
    .O(sig000000fb)
  );
  MUXCY   blk00000020 (
    .CI(sig0000008c),
    .DI(sig00000001),
    .S(sig000000d6),
    .O(sig0000008d)
  );
  XORCY   blk00000021 (
    .CI(sig0000008c),
    .LI(sig000000d6),
    .O(sig000000fc)
  );
  MUXCY   blk00000022 (
    .CI(sig0000008d),
    .DI(sig00000001),
    .S(sig000000d7),
    .O(sig0000008e)
  );
  XORCY   blk00000023 (
    .CI(sig0000008d),
    .LI(sig000000d7),
    .O(sig000000fd)
  );
  MUXCY   blk00000024 (
    .CI(sig0000008e),
    .DI(sig00000001),
    .S(sig000000d8),
    .O(sig0000006e)
  );
  XORCY   blk00000025 (
    .CI(sig0000008e),
    .LI(sig000000d8),
    .O(sig000000fe)
  );
  MUXCY   blk00000026 (
    .CI(sig0000006e),
    .DI(sig00000001),
    .S(sig000000d9),
    .O(sig0000006f)
  );
  XORCY   blk00000027 (
    .CI(sig0000006e),
    .LI(sig000000d9),
    .O(sig000000df)
  );
  MUXCY   blk00000028 (
    .CI(sig0000006f),
    .DI(sig00000001),
    .S(sig000000bc),
    .O(sig00000070)
  );
  XORCY   blk00000029 (
    .CI(sig0000006f),
    .LI(sig000000bc),
    .O(sig000000e0)
  );
  MUXCY   blk0000002a (
    .CI(sig00000070),
    .DI(sig00000001),
    .S(sig000000bd),
    .O(sig00000071)
  );
  XORCY   blk0000002b (
    .CI(sig00000070),
    .LI(sig000000bd),
    .O(sig000000e1)
  );
  MUXCY   blk0000002c (
    .CI(sig00000071),
    .DI(sig00000001),
    .S(sig000000be),
    .O(sig00000072)
  );
  XORCY   blk0000002d (
    .CI(sig00000071),
    .LI(sig000000be),
    .O(sig000000e2)
  );
  MUXCY   blk0000002e (
    .CI(sig00000072),
    .DI(sig00000001),
    .S(sig000000bf),
    .O(sig00000073)
  );
  XORCY   blk0000002f (
    .CI(sig00000072),
    .LI(sig000000bf),
    .O(sig000000e3)
  );
  MUXCY   blk00000030 (
    .CI(sig00000073),
    .DI(sig00000001),
    .S(sig000000c0),
    .O(sig00000074)
  );
  XORCY   blk00000031 (
    .CI(sig00000073),
    .LI(sig000000c0),
    .O(sig000000e4)
  );
  MUXCY   blk00000032 (
    .CI(sig00000074),
    .DI(sig00000001),
    .S(sig000000c1),
    .O(sig00000075)
  );
  XORCY   blk00000033 (
    .CI(sig00000074),
    .LI(sig000000c1),
    .O(sig000000e5)
  );
  MUXCY   blk00000034 (
    .CI(sig00000075),
    .DI(sig00000001),
    .S(sig000000c2),
    .O(sig00000076)
  );
  XORCY   blk00000035 (
    .CI(sig00000075),
    .LI(sig000000c2),
    .O(sig000000e6)
  );
  MUXCY   blk00000036 (
    .CI(sig00000076),
    .DI(sig00000001),
    .S(sig000000c3),
    .O(sig00000077)
  );
  XORCY   blk00000037 (
    .CI(sig00000076),
    .LI(sig000000c3),
    .O(sig000000e7)
  );
  MUXCY   blk00000038 (
    .CI(sig00000077),
    .DI(sig00000001),
    .S(sig000000c4),
    .O(sig00000079)
  );
  XORCY   blk00000039 (
    .CI(sig00000077),
    .LI(sig000000c4),
    .O(sig000000e8)
  );
  MUXCY   blk0000003a (
    .CI(sig00000079),
    .DI(sig00000001),
    .S(sig000000c5),
    .O(sig0000007a)
  );
  XORCY   blk0000003b (
    .CI(sig00000079),
    .LI(sig000000c5),
    .O(sig000000ea)
  );
  MUXCY   blk0000003c (
    .CI(sig0000007a),
    .DI(sig00000001),
    .S(sig000000c7),
    .O(sig0000007b)
  );
  XORCY   blk0000003d (
    .CI(sig0000007a),
    .LI(sig000000c7),
    .O(sig000000eb)
  );
  MUXCY   blk0000003e (
    .CI(sig0000007b),
    .DI(sig00000001),
    .S(sig000000c8),
    .O(sig0000007c)
  );
  XORCY   blk0000003f (
    .CI(sig0000007b),
    .LI(sig000000c8),
    .O(sig000000ec)
  );
  MUXCY   blk00000040 (
    .CI(sig0000007c),
    .DI(sig00000001),
    .S(sig000000c9),
    .O(sig0000007d)
  );
  XORCY   blk00000041 (
    .CI(sig0000007c),
    .LI(sig000000c9),
    .O(sig000000ed)
  );
  MUXCY   blk00000042 (
    .CI(sig0000007d),
    .DI(sig00000001),
    .S(sig000000ca),
    .O(sig0000007e)
  );
  XORCY   blk00000043 (
    .CI(sig0000007d),
    .LI(sig000000ca),
    .O(sig000000ee)
  );
  MUXCY   blk00000044 (
    .CI(sig0000007e),
    .DI(sig00000001),
    .S(sig000000cb),
    .O(sig0000007f)
  );
  XORCY   blk00000045 (
    .CI(sig0000007e),
    .LI(sig000000cb),
    .O(sig000000ef)
  );
  MUXCY   blk00000046 (
    .CI(sig0000007f),
    .DI(sig00000001),
    .S(sig000000cc),
    .O(sig00000080)
  );
  XORCY   blk00000047 (
    .CI(sig0000007f),
    .LI(sig000000cc),
    .O(sig000000f0)
  );
  MUXCY   blk00000048 (
    .CI(sig00000080),
    .DI(sig00000001),
    .S(sig000000cd),
    .O(sig00000081)
  );
  XORCY   blk00000049 (
    .CI(sig00000080),
    .LI(sig000000cd),
    .O(sig000000f1)
  );
  MUXCY   blk0000004a (
    .CI(sig00000081),
    .DI(sig00000001),
    .S(sig000000ce),
    .O(sig00000082)
  );
  XORCY   blk0000004b (
    .CI(sig00000081),
    .LI(sig000000ce),
    .O(sig000000f2)
  );
  MUXCY   blk0000004c (
    .CI(sig00000082),
    .DI(sig00000001),
    .S(sig000000cf),
    .O(sig00000084)
  );
  XORCY   blk0000004d (
    .CI(sig00000082),
    .LI(sig000000cf),
    .O(sig000000f3)
  );
  MUXCY   blk0000004e (
    .CI(sig00000084),
    .DI(sig00000001),
    .S(sig000000d0),
    .O(sig00000085)
  );
  XORCY   blk0000004f (
    .CI(sig00000084),
    .LI(sig000000d0),
    .O(sig000000f5)
  );
  MUXCY   blk00000050 (
    .CI(sig00000085),
    .DI(sig00000001),
    .S(sig000000d2),
    .O(sig00000086)
  );
  XORCY   blk00000051 (
    .CI(sig00000085),
    .LI(sig000000d2),
    .O(sig000000f6)
  );
  MUXCY   blk00000052 (
    .CI(sig00000086),
    .DI(sig00000001),
    .S(sig0000006d),
    .O(sig00000087)
  );
  XORCY   blk00000053 (
    .CI(sig00000086),
    .LI(sig0000006d),
    .O(sig000000f7)
  );
  XORCY   blk00000054 (
    .CI(sig00000087),
    .LI(sig00000001),
    .O(NLW_blk00000054_O_UNCONNECTED)
  );
  MUXCY   blk00000055 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig0000005f),
    .O(sig0000005e)
  );
  MUXCY   blk00000056 (
    .CI(sig0000005e),
    .DI(sig00000001),
    .S(sig00000060),
    .O(sig00000090)
  );
  MUXCY   blk00000057 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig0000005c),
    .O(sig0000005b)
  );
  MUXCY   blk00000058 (
    .CI(sig0000005b),
    .DI(sig00000001),
    .S(sig0000005d),
    .O(sig0000008f)
  );
  FDRS   blk00000059 (
    .C(clk),
    .D(sig000000df),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [9])
  );
  FDRS   blk0000005a (
    .C(clk),
    .D(sig000000fe),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [8])
  );
  FDRS   blk0000005b (
    .C(clk),
    .D(sig000000fd),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [7])
  );
  FDRS   blk0000005c (
    .C(clk),
    .D(sig000000f3),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [28])
  );
  FDRS   blk0000005d (
    .C(clk),
    .D(sig000000f5),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [29])
  );
  FDRS   blk0000005e (
    .C(clk),
    .D(sig000000fc),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [6])
  );
  FDRS   blk0000005f (
    .C(clk),
    .D(sig000000f2),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [27])
  );
  FDRS   blk00000060 (
    .C(clk),
    .D(sig000000fb),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [5])
  );
  FDRS   blk00000061 (
    .C(clk),
    .D(sig000000f1),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [26])
  );
  FDRS   blk00000062 (
    .C(clk),
    .D(sig000000fa),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [4])
  );
  FDRS   blk00000063 (
    .C(clk),
    .D(sig000000f0),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [25])
  );
  FDRS   blk00000064 (
    .C(clk),
    .D(sig000000f7),
    .R(sig000000b3),
    .S(sig000000b2),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [31])
  );
  FDRS   blk00000065 (
    .C(clk),
    .D(sig000000f6),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [30])
  );
  FDRS   blk00000066 (
    .C(clk),
    .D(sig000000f9),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [3])
  );
  FDRS   blk00000067 (
    .C(clk),
    .D(sig000000ef),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [24])
  );
  FDRS   blk00000068 (
    .C(clk),
    .D(sig000000f8),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [2])
  );
  FDRS   blk00000069 (
    .C(clk),
    .D(sig000000e8),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [18])
  );
  FDRS   blk0000006a (
    .C(clk),
    .D(sig000000ea),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [19])
  );
  FDRS   blk0000006b (
    .C(clk),
    .D(sig000000ee),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [23])
  );
  FDRS   blk0000006c (
    .C(clk),
    .D(sig000000f4),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [1])
  );
  FDRS   blk0000006d (
    .C(clk),
    .D(sig000000e7),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [17])
  );
  FDRS   blk0000006e (
    .C(clk),
    .D(sig000000ed),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [22])
  );
  FDRS   blk0000006f (
    .C(clk),
    .D(sig000000ec),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [21])
  );
  FDRS   blk00000070 (
    .C(clk),
    .D(sig000000e6),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [16])
  );
  FDRS   blk00000071 (
    .C(clk),
    .D(sig000000e9),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [0])
  );
  FDRS   blk00000072 (
    .C(clk),
    .D(sig000000e5),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [15])
  );
  FDRS   blk00000073 (
    .C(clk),
    .D(sig000000eb),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [20])
  );
  FDRS   blk00000074 (
    .C(clk),
    .D(sig000000e4),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [14])
  );
  FDRS   blk00000075 (
    .C(clk),
    .D(sig000000e3),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [13])
  );
  FDRS   blk00000076 (
    .C(clk),
    .D(sig000000e1),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [11])
  );
  FDRS   blk00000077 (
    .C(clk),
    .D(sig000000e0),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [10])
  );
  FDRS   blk00000078 (
    .C(clk),
    .D(sig000000e2),
    .R(sig000000da),
    .S(sig000000b1),
    .Q(\U0/op_inst/FLT_PT_OP/FLT_TO_FIX_OP.SPD.OP/RESULT [12])
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  blk00000079 (
    .I0(a[20]),
    .I1(a[21]),
    .I2(a[22]),
    .O(sig0000006b)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000007a (
    .I0(a[16]),
    .I1(a[17]),
    .I2(a[18]),
    .I3(a[19]),
    .O(sig0000006a)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000007b (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[14]),
    .I3(a[15]),
    .O(sig00000069)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000007c (
    .I0(a[8]),
    .I1(a[9]),
    .I2(a[10]),
    .I3(a[11]),
    .O(sig00000068)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000007d (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig00000067)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000007e (
    .I0(a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000066)
  );
  LUT4 #(
    .INIT ( 16'hC999 ))
  blk0000007f (
    .I0(a[26]),
    .I1(a[27]),
    .I2(a[24]),
    .I3(a[25]),
    .O(sig000000ff)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk00000080 (
    .I0(a[27]),
    .I1(a[28]),
    .I2(a[29]),
    .I3(a[30]),
    .O(sig0000005d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000081 (
    .I0(a[31]),
    .I1(sig000000a8),
    .O(sig000000ce)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk00000082 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000003f),
    .I3(sig0000003e),
    .I4(sig0000003c),
    .I5(sig0000003d),
    .O(sig000000a8)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000083 (
    .I0(a[31]),
    .I1(sig000000a7),
    .O(sig000000cd)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk00000084 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000003e),
    .I3(sig0000003d),
    .I4(sig0000003b),
    .I5(sig0000003c),
    .O(sig000000a7)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000085 (
    .I0(a[31]),
    .I1(sig000000a6),
    .O(sig000000cc)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk00000086 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000003d),
    .I3(sig0000003c),
    .I4(sig0000003a),
    .I5(sig0000003b),
    .O(sig000000a6)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000087 (
    .I0(a[31]),
    .I1(sig000000a5),
    .O(sig000000cb)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk00000088 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000003c),
    .I3(sig0000003b),
    .I4(sig00000039),
    .I5(sig0000003a),
    .O(sig000000a5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000089 (
    .I0(a[31]),
    .I1(sig000000a4),
    .O(sig000000ca)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk0000008a (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000003b),
    .I3(sig0000003a),
    .I4(sig00000038),
    .I5(sig00000039),
    .O(sig000000a4)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000008b (
    .I0(a[27]),
    .I1(a[28]),
    .I2(a[29]),
    .I3(a[30]),
    .O(sig00000060)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000008c (
    .I0(a[31]),
    .I1(sig000000a3),
    .O(sig000000c9)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk0000008d (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000003a),
    .I3(sig00000039),
    .I4(sig00000037),
    .I5(sig00000038),
    .O(sig000000a3)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk0000008e (
    .I0(a[23]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[26]),
    .O(sig0000005f)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000008f (
    .I0(a[31]),
    .I1(sig000000a2),
    .O(sig000000c8)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk00000090 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000039),
    .I3(sig00000038),
    .I4(sig00000034),
    .I5(sig00000037),
    .O(sig000000a2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000091 (
    .I0(a[31]),
    .I1(sig000000a1),
    .O(sig000000c7)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk00000092 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000038),
    .I3(sig00000037),
    .I4(sig00000033),
    .I5(sig00000034),
    .O(sig000000a1)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000093 (
    .I0(a[31]),
    .I1(sig000000a0),
    .O(sig000000c5)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk00000094 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000037),
    .I3(sig00000034),
    .I4(sig00000032),
    .I5(sig00000033),
    .O(sig000000a0)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000095 (
    .I0(a[31]),
    .I1(sig0000009e),
    .O(sig000000c4)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk00000096 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000034),
    .I3(sig00000033),
    .I4(sig00000031),
    .I5(sig00000032),
    .O(sig0000009e)
  );
  LUT6 #(
    .INIT ( 64'hEEAEFFAEEEBFFFBF ))
  blk00000097 (
    .I0(sig00000093),
    .I1(sig00000091),
    .I2(a[18]),
    .I3(sig00000092),
    .I4(a[22]),
    .I5(a[14]),
    .O(sig00000034)
  );
  LUT6 #(
    .INIT ( 64'hEEAEFFAEEEBFFFBF ))
  blk00000098 (
    .I0(sig00000093),
    .I1(sig00000091),
    .I2(a[17]),
    .I3(sig00000092),
    .I4(a[21]),
    .I5(a[13]),
    .O(sig00000033)
  );
  LUT6 #(
    .INIT ( 64'hEEAEFFAEEEBFFFBF ))
  blk00000099 (
    .I0(sig00000093),
    .I1(sig00000091),
    .I2(a[16]),
    .I3(sig00000092),
    .I4(a[20]),
    .I5(a[12]),
    .O(sig00000032)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF02461357 ))
  blk0000009a (
    .I0(sig00000091),
    .I1(sig00000092),
    .I2(a[15]),
    .I3(a[19]),
    .I4(a[11]),
    .I5(sig00000093),
    .O(sig00000031)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000009b (
    .I0(a[31]),
    .I1(sig0000009d),
    .O(sig000000c3)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk0000009c (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000033),
    .I3(sig00000032),
    .I4(sig00000030),
    .I5(sig00000031),
    .O(sig0000009d)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000009d (
    .I0(a[31]),
    .I1(sig0000009c),
    .O(sig000000c2)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk0000009e (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000032),
    .I3(sig00000031),
    .I4(sig0000002d),
    .I5(sig00000030),
    .O(sig0000009c)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk0000009f (
    .I0(a[21]),
    .I1(a[22]),
    .I2(a[9]),
    .I3(a[10]),
    .O(sig000000b8)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  blk000000a0 (
    .I0(a[7]),
    .I1(a[8]),
    .I2(a[5]),
    .I3(a[6]),
    .I4(a[3]),
    .I5(a[4]),
    .O(sig000000b6)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  blk000000a1 (
    .I0(a[1]),
    .I1(a[2]),
    .I2(a[20]),
    .I3(a[0]),
    .I4(a[18]),
    .I5(a[19]),
    .O(sig000000b7)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk000000a2 (
    .I0(sig000000b8),
    .I1(sig000000b6),
    .I2(sig000000b7),
    .I3(sig000000b9),
    .O(sig000000b5)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000a3 (
    .I0(a[31]),
    .I1(sig0000009b),
    .O(sig000000c1)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000a4 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000031),
    .I3(sig00000030),
    .I4(sig0000002a),
    .I5(sig0000002d),
    .O(sig0000009b)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000a5 (
    .I0(a[31]),
    .I1(sig0000009a),
    .O(sig000000c0)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000a6 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000030),
    .I3(sig0000002d),
    .I4(sig00000027),
    .I5(sig0000002a),
    .O(sig0000009a)
  );
  LUT5 #(
    .INIT ( 32'hFFFF1101 ))
  blk000000a7 (
    .I0(a[29]),
    .I1(a[28]),
    .I2(a[27]),
    .I3(sig0000006c),
    .I4(sig000000b4),
    .O(sig00000003)
  );
  LUT6 #(
    .INIT ( 64'h00000004080C080C ))
  blk000000a8 (
    .I0(sig000000b5),
    .I1(a[30]),
    .I2(sig00000003),
    .I3(sig00000090),
    .I4(a[31]),
    .I5(sig0000008f),
    .O(sig000000dd)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk000000a9 (
    .I0(a[25]),
    .I1(a[24]),
    .O(sig00000091)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000aa (
    .I0(a[31]),
    .I1(sig00000099),
    .O(sig000000bf)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000ab (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000002d),
    .I3(sig0000002a),
    .I4(sig00000024),
    .I5(sig00000027),
    .O(sig00000099)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ac (
    .I0(a[31]),
    .I1(sig00000098),
    .O(sig000000be)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000ad (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000002a),
    .I3(sig00000027),
    .I4(sig0000001f),
    .I5(sig00000024),
    .O(sig00000098)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ae (
    .I0(a[16]),
    .I1(a[17]),
    .I2(a[18]),
    .I3(a[19]),
    .O(sig0000004a)
  );
  LUT6 #(
    .INIT ( 64'hFFFFAAAA5D7F082A ))
  blk000000af (
    .I0(sig00000091),
    .I1(sig00000092),
    .I2(a[17]),
    .I3(a[9]),
    .I4(sig00000021),
    .I5(sig00000093),
    .O(sig0000001f)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000b0 (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[14]),
    .I3(a[15]),
    .O(sig00000049)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b1 (
    .I0(a[31]),
    .I1(sig000000af),
    .O(sig000000d7)
  );
  LUT6 #(
    .INIT ( 64'hDD5DDD7F8808882A ))
  blk000000b2 (
    .I0(sig00000091),
    .I1(sig00000092),
    .I2(a[15]),
    .I3(sig00000093),
    .I4(a[7]),
    .I5(sig0000001c),
    .O(sig00000020)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000b3 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000020),
    .I3(sig0000001e),
    .I4(sig00000044),
    .I5(sig00000045),
    .O(sig000000af)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b4 (
    .I0(a[31]),
    .I1(sig000000ae),
    .O(sig000000d6)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000b5 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000001e),
    .I3(sig00000045),
    .I4(sig00000043),
    .I5(sig00000044),
    .O(sig000000ae)
  );
  LUT6 #(
    .INIT ( 64'hDDFF88AA5D7F082A ))
  blk000000b6 (
    .I0(sig00000091),
    .I1(sig00000092),
    .I2(a[12]),
    .I3(sig00000017),
    .I4(sig00000036),
    .I5(sig00000093),
    .O(sig00000044)
  );
  LUT6 #(
    .INIT ( 64'hABBBAFBF01110515 ))
  blk000000b7 (
    .I0(sig00000091),
    .I1(sig00000093),
    .I2(sig00000092),
    .I3(a[7]),
    .I4(a[15]),
    .I5(sig0000001c),
    .O(sig00000043)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b8 (
    .I0(a[31]),
    .I1(sig000000a9),
    .O(sig000000c6)
  );
  LUT6 #(
    .INIT ( 64'h37BF159D26AE048C ))
  blk000000b9 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000040),
    .I3(sig00000035),
    .I4(sig00000016),
    .I5(sig00000018),
    .O(sig000000a9)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000ba (
    .I0(a[31]),
    .I1(sig00000097),
    .O(sig000000bd)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000bb (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000027),
    .I3(sig00000024),
    .I4(sig0000001d),
    .I5(sig0000001f),
    .O(sig00000097)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000bc (
    .I0(a[31]),
    .I1(sig00000096),
    .O(sig000000bc)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000bd (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000024),
    .I3(sig0000001f),
    .I4(sig00000020),
    .I5(sig0000001d),
    .O(sig00000096)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000be (
    .I0(a[8]),
    .I1(a[9]),
    .I2(a[10]),
    .I3(a[11]),
    .O(sig00000048)
  );
  LUT6 #(
    .INIT ( 64'hABBBEFFF01114555 ))
  blk000000bf (
    .I0(sig00000091),
    .I1(sig00000092),
    .I2(sig00000093),
    .I3(a[12]),
    .I4(sig00000017),
    .I5(sig00000036),
    .O(sig00000035)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c0 (
    .I0(a[31]),
    .I1(sig00000095),
    .O(sig000000d9)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000c1 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000001f),
    .I3(sig0000001d),
    .I4(sig0000001e),
    .I5(sig00000020),
    .O(sig00000095)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c2 (
    .I0(a[31]),
    .I1(sig000000b0),
    .O(sig000000d8)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000c3 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig0000001d),
    .I3(sig00000020),
    .I4(sig00000045),
    .I5(sig0000001e),
    .O(sig000000b0)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c4 (
    .I0(a[31]),
    .I1(sig000000ad),
    .O(sig000000d5)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000c5 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000045),
    .I3(sig00000044),
    .I4(sig00000042),
    .I5(sig00000043),
    .O(sig000000ad)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c6 (
    .I0(a[31]),
    .I1(sig000000ac),
    .O(sig000000d4)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000c7 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000044),
    .I3(sig00000043),
    .I4(sig00000040),
    .I5(sig00000042),
    .O(sig000000ac)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000c8 (
    .I0(a[31]),
    .I1(sig000000ab),
    .O(sig000000d3)
  );
  LUT6 #(
    .INIT ( 64'h048C26AE159D37BF ))
  blk000000c9 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000043),
    .I3(sig00000042),
    .I4(sig00000035),
    .I5(sig00000040),
    .O(sig000000ab)
  );
  LUT5 #(
    .INIT ( 32'h030F010F ))
  blk000000ca (
    .I0(a[18]),
    .I1(a[17]),
    .I2(a[16]),
    .I3(a[24]),
    .I4(a[23]),
    .O(sig0000004f)
  );
  LUT5 #(
    .INIT ( 32'h0203AFAF ))
  blk000000cb (
    .I0(a[23]),
    .I1(a[21]),
    .I2(a[20]),
    .I3(a[22]),
    .I4(a[24]),
    .O(sig0000004e)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000cc (
    .I0(a[31]),
    .I1(sig000000aa),
    .O(sig000000d1)
  );
  LUT6 #(
    .INIT ( 64'h2A6E3B7F084C195D ))
  blk000000cd (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000040),
    .I3(sig00000042),
    .I4(sig00000035),
    .I5(sig00000018),
    .O(sig000000aa)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000ce (
    .I0(a[4]),
    .I1(a[5]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig00000047)
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  blk000000cf (
    .I0(a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000046)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk000000d0 (
    .I0(sig000000da),
    .I1(sig000000db),
    .O(sig000000b2)
  );
  LUT5 #(
    .INIT ( 32'h55155555 ))
  blk000000d1 (
    .I0(a[30]),
    .I1(a[29]),
    .I2(a[28]),
    .I3(sig0000006c),
    .I4(a[27]),
    .O(sig00000006)
  );
  LUT6 #(
    .INIT ( 64'hFFFBFFFA55515540 ))
  blk000000d2 (
    .I0(sig000000dd),
    .I1(sig000000b5),
    .I2(sig0000008f),
    .I3(sig00000006),
    .I4(sig00000090),
    .I5(a[31]),
    .O(sig000000da)
  );
  LUT5 #(
    .INIT ( 32'hBAFE1054 ))
  blk000000d3 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000016),
    .I3(sig00000035),
    .I4(sig00000015),
    .O(sig0000009f)
  );
  LUT3 #(
    .INIT ( 8'h7F ))
  blk000000d4 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[26]),
    .O(sig0000006c)
  );
  LUT4 #(
    .INIT ( 16'h5510 ))
  blk000000d5 (
    .I0(sig000000da),
    .I1(a[31]),
    .I2(sig000000f7),
    .I3(sig000000db),
    .O(sig000000b1)
  );
  LUT4 #(
    .INIT ( 16'h66A6 ))
  blk000000d6 (
    .I0(a[31]),
    .I1(sig00000094),
    .I2(sig00000100),
    .I3(sig0000009f),
    .O(sig000000de)
  );
  LUT6 #(
    .INIT ( 64'h00EC00A800640020 ))
  blk000000d7 (
    .I0(sig00000092),
    .I1(sig00000093),
    .I2(a[0]),
    .I3(sig00000091),
    .I4(a[8]),
    .I5(a[16]),
    .O(sig00000014)
  );
  LUT6 #(
    .INIT ( 64'hFFFDAAA877752220 ))
  blk000000d8 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000013),
    .I3(sig00000014),
    .I4(sig00000015),
    .I5(sig00000016),
    .O(sig00000094)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk000000d9 (
    .I0(a[31]),
    .O(sig0000006d)
  );
  LUT6 #(
    .INIT ( 64'hBE3CAA2896148200 ))
  blk000000da (
    .I0(sig00000092),
    .I1(sig0000006c),
    .I2(a[27]),
    .I3(a[1]),
    .I4(a[9]),
    .I5(a[17]),
    .O(sig00000008)
  );
  LUT5 #(
    .INIT ( 32'hAAA9A6A5 ))
  blk000000db (
    .I0(a[31]),
    .I1(a[23]),
    .I2(a[24]),
    .I3(sig0000003f),
    .I4(sig0000003e),
    .O(sig000000d0)
  );
  LUT6 #(
    .INIT ( 64'hAAA9A6A56A696665 ))
  blk000000dc (
    .I0(a[31]),
    .I1(a[23]),
    .I2(a[24]),
    .I3(sig0000003e),
    .I4(sig0000003d),
    .I5(sig0000003f),
    .O(sig000000cf)
  );
  LUT5 #(
    .INIT ( 32'hF9606060 ))
  blk000000dd (
    .I0(sig0000006c),
    .I1(a[27]),
    .I2(sig00000007),
    .I3(sig00000092),
    .I4(sig00000009),
    .O(sig00000018)
  );
  LUT6 #(
    .INIT ( 64'h666F0009F6FF9099 ))
  blk000000de (
    .I0(a[27]),
    .I1(sig0000006c),
    .I2(sig00000092),
    .I3(sig00000005),
    .I4(sig0000000a),
    .I5(sig00000004),
    .O(sig00000042)
  );
  LUT3 #(
    .INIT ( 8'h95 ))
  blk000000df (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .O(sig00000092)
  );
  LUT4 #(
    .INIT ( 16'h6766 ))
  blk000000e0 (
    .I0(sig000000da),
    .I1(sig000000db),
    .I2(a[31]),
    .I3(sig000000f7),
    .O(sig000000b3)
  );
  LUT6 #(
    .INIT ( 64'hA8A0282088800800 ))
  blk000000e1 (
    .I0(sig00000091),
    .I1(sig00000093),
    .I2(sig00000092),
    .I3(a[12]),
    .I4(a[20]),
    .I5(a[4]),
    .O(sig00000013)
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAAAAAAA8AA ))
  blk000000e2 (
    .I0(sig0000008f),
    .I1(sig000000b7),
    .I2(sig000000b6),
    .I3(sig00000090),
    .I4(sig000000b9),
    .I5(sig000000b8),
    .O(sig000000b4)
  );
  LUT6 #(
    .INIT ( 64'hF6F666F6F6F66FFF ))
  blk000000e3 (
    .I0(sig0000006c),
    .I1(a[27]),
    .I2(sig00000091),
    .I3(a[19]),
    .I4(sig00000092),
    .I5(a[15]),
    .O(sig00000037)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000e4 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[26]),
    .I3(a[23]),
    .O(sig0000005c)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000e5 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[6]),
    .I3(a[10]),
    .O(sig00000004)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000e6 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(sig00000041),
    .I3(sig00000021),
    .O(sig00000045)
  );
  LUT6 #(
    .INIT ( 64'h6606669FFF06FF9F ))
  blk000000e7 (
    .I0(a[27]),
    .I1(sig0000006c),
    .I2(a[21]),
    .I3(sig00000092),
    .I4(a[5]),
    .I5(a[13]),
    .O(sig00000021)
  );
  LUT6 #(
    .INIT ( 64'h6606669FFF06FF9F ))
  blk000000e8 (
    .I0(a[27]),
    .I1(sig0000006c),
    .I2(a[19]),
    .I3(sig00000092),
    .I4(a[3]),
    .I5(a[11]),
    .O(sig0000001c)
  );
  LUT4 #(
    .INIT ( 16'h9F06 ))
  blk000000e9 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(sig00000019),
    .I3(sig00000041),
    .O(sig00000040)
  );
  LUT6 #(
    .INIT ( 64'h6606669FFF06FF9F ))
  blk000000ea (
    .I0(a[27]),
    .I1(sig0000006c),
    .I2(a[17]),
    .I3(sig00000092),
    .I4(a[1]),
    .I5(a[9]),
    .O(sig00000041)
  );
  LUT6 #(
    .INIT ( 64'h6606669FFF06FF9F ))
  blk000000eb (
    .I0(a[27]),
    .I1(sig0000006c),
    .I2(a[16]),
    .I3(sig00000092),
    .I4(a[0]),
    .I5(a[8]),
    .O(sig00000036)
  );
  LUT3 #(
    .INIT ( 8'h82 ))
  blk000000ec (
    .I0(a[2]),
    .I1(a[25]),
    .I2(a[24]),
    .O(sig00000005)
  );
  LUT6 #(
    .INIT ( 64'hBE3CAA2896148200 ))
  blk000000ed (
    .I0(sig00000092),
    .I1(sig0000006c),
    .I2(a[27]),
    .I3(a[5]),
    .I4(a[13]),
    .I5(a[21]),
    .O(sig00000019)
  );
  LUT5 #(
    .INIT ( 32'hFFFFEB28 ))
  blk000000ee (
    .I0(sig0000004b),
    .I1(a[25]),
    .I2(a[24]),
    .I3(sig0000004d),
    .I4(sig0000004c),
    .O(sig00000059)
  );
  LUT6 #(
    .INIT ( 64'h6555A9996656AA9A ))
  blk000000ef (
    .I0(a[31]),
    .I1(a[23]),
    .I2(a[24]),
    .I3(sig00000035),
    .I4(sig00000015),
    .I5(sig00000016),
    .O(sig000000bb)
  );
  LUT6 #(
    .INIT ( 64'hFFBABBBABBBABBBA ))
  blk000000f0 (
    .I0(sig00000050),
    .I1(sig00000092),
    .I2(sig00000058),
    .I3(sig00000091),
    .I4(sig0000004e),
    .I5(sig00000057),
    .O(sig0000005a)
  );
  LUT6 #(
    .INIT ( 64'hFEBFC2BFFE83C283 ))
  blk000000f1 (
    .I0(a[15]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[26]),
    .I4(a[11]),
    .I5(a[19]),
    .O(sig00000007)
  );
  LUT5 #(
    .INIT ( 32'hFDEC3120 ))
  blk000000f2 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(sig00000008),
    .I3(sig00000019),
    .I4(sig00000018),
    .O(sig00000015)
  );
  LUT4 #(
    .INIT ( 16'h9333 ))
  blk000000f3 (
    .I0(a[24]),
    .I1(a[27]),
    .I2(a[26]),
    .I3(a[25]),
    .O(sig00000093)
  );
  LUT4 #(
    .INIT ( 16'hF960 ))
  blk000000f4 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[3]),
    .I3(a[7]),
    .O(sig00000009)
  );
  LUT4 #(
    .INIT ( 16'h9FFF ))
  blk000000f5 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[27]),
    .I3(a[26]),
    .O(sig0000003f)
  );
  LUT6 #(
    .INIT ( 64'h8E77FFFF9FFFFFFF ))
  blk000000f6 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[18]),
    .I3(a[26]),
    .I4(a[27]),
    .I5(a[22]),
    .O(sig0000003a)
  );
  LUT6 #(
    .INIT ( 64'h8E77FFFF9FFFFFFF ))
  blk000000f7 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[17]),
    .I3(a[26]),
    .I4(a[27]),
    .I5(a[21]),
    .O(sig00000039)
  );
  LUT6 #(
    .INIT ( 64'h8E77FFFF9FFFFFFF ))
  blk000000f8 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[16]),
    .I3(a[26]),
    .I4(a[27]),
    .I5(a[20]),
    .O(sig00000038)
  );
  LUT6 #(
    .INIT ( 64'h8919897FEF19EF7F ))
  blk000000f9 (
    .I0(a[24]),
    .I1(a[25]),
    .I2(a[18]),
    .I3(a[26]),
    .I4(a[22]),
    .I5(a[14]),
    .O(sig0000000a)
  );
  LUT6 #(
    .INIT ( 64'h1400140004000000 ))
  blk000000fa (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(sig00000056),
    .I4(a[23]),
    .I5(sig0000004f),
    .O(sig00000050)
  );
  LUT6 #(
    .INIT ( 64'h00F0002000300020 ))
  blk000000fb (
    .I0(sig00000053),
    .I1(a[26]),
    .I2(a[23]),
    .I3(a[24]),
    .I4(a[25]),
    .I5(sig00000054),
    .O(sig0000004c)
  );
  LUT6 #(
    .INIT ( 64'hF9F5F5F560A0A0A0 ))
  blk000000fc (
    .I0(a[27]),
    .I1(a[24]),
    .I2(a[4]),
    .I3(a[26]),
    .I4(a[25]),
    .I5(a[20]),
    .O(sig00000017)
  );
  LUT5 #(
    .INIT ( 32'h8E77FFFF ))
  blk000000fd (
    .I0(a[24]),
    .I1(a[25]),
    .I2(a[19]),
    .I3(a[26]),
    .I4(a[27]),
    .O(sig0000003b)
  );
  LUT5 #(
    .INIT ( 32'hD7FFFFFF ))
  blk000000fe (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[27]),
    .I4(a[22]),
    .O(sig0000003e)
  );
  LUT5 #(
    .INIT ( 32'hD7FFFFFF ))
  blk000000ff (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[27]),
    .I4(a[21]),
    .O(sig0000003d)
  );
  LUT5 #(
    .INIT ( 32'hD7FFFFFF ))
  blk00000100 (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[27]),
    .I4(a[20]),
    .O(sig0000003c)
  );
  LUT6 #(
    .INIT ( 64'h9AAAAAAAAAAAAAAA ))
  blk00000101 (
    .I0(a[31]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[27]),
    .I4(a[26]),
    .I5(a[23]),
    .O(sig000000d2)
  );
  MUXF7   blk00000102 (
    .I0(sig0000000b),
    .I1(sig0000000c),
    .S(sig00000092),
    .O(sig0000004b)
  );
  LUT6 #(
    .INIT ( 64'h000A00AA000200AA ))
  blk00000103 (
    .I0(sig00000054),
    .I1(a[10]),
    .I2(a[9]),
    .I3(a[8]),
    .I4(a[24]),
    .I5(a[23]),
    .O(sig0000000b)
  );
  LUT5 #(
    .INIT ( 32'h030F010F ))
  blk00000104 (
    .I0(a[2]),
    .I1(a[1]),
    .I2(a[0]),
    .I3(a[24]),
    .I4(a[23]),
    .O(sig0000000c)
  );
  MUXF7   blk00000105 (
    .I0(sig0000000d),
    .I1(sig0000000e),
    .S(sig00000092),
    .O(sig0000004d)
  );
  LUT6 #(
    .INIT ( 64'h0008000A88AA88AA ))
  blk00000106 (
    .I0(sig00000055),
    .I1(a[23]),
    .I2(a[13]),
    .I3(a[12]),
    .I4(a[14]),
    .I5(a[24]),
    .O(sig0000000d)
  );
  LUT6 #(
    .INIT ( 64'h000A00AA000200AA ))
  blk00000107 (
    .I0(sig00000053),
    .I1(a[6]),
    .I2(a[5]),
    .I3(a[4]),
    .I4(a[24]),
    .I5(a[23]),
    .O(sig0000000e)
  );
  MUXF7   blk00000108 (
    .I0(sig0000000f),
    .I1(sig00000010),
    .S(sig00000091),
    .O(sig0000001e)
  );
  LUT6 #(
    .INIT ( 64'h6606669FFF06FF9F ))
  blk00000109 (
    .I0(sig0000006c),
    .I1(a[27]),
    .I2(a[18]),
    .I3(sig00000092),
    .I4(a[2]),
    .I5(a[10]),
    .O(sig0000000f)
  );
  LUT6 #(
    .INIT ( 64'h6606669FFF06FF9F ))
  blk0000010a (
    .I0(sig0000006c),
    .I1(a[27]),
    .I2(a[22]),
    .I3(sig00000092),
    .I4(a[6]),
    .I5(a[14]),
    .O(sig00000010)
  );
  MUXF7   blk0000010b (
    .I0(sig00000011),
    .I1(sig00000012),
    .S(sig00000091),
    .O(sig00000016)
  );
  LUT6 #(
    .INIT ( 64'hBE3CAA2896148200 ))
  blk0000010c (
    .I0(sig00000092),
    .I1(sig0000006c),
    .I2(a[27]),
    .I3(a[2]),
    .I4(a[10]),
    .I5(a[18]),
    .O(sig00000011)
  );
  LUT6 #(
    .INIT ( 64'hBE3CAA2896148200 ))
  blk0000010d (
    .I0(sig00000092),
    .I1(sig0000006c),
    .I2(a[27]),
    .I3(a[6]),
    .I4(a[14]),
    .I5(a[22]),
    .O(sig00000012)
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA20000000 ))
  blk0000010e (
    .I0(sig000000b4),
    .I1(sig0000006c),
    .I2(a[29]),
    .I3(a[28]),
    .I4(a[27]),
    .I5(a[30]),
    .O(sig000000dc)
  );
  MUXF7   blk0000010f (
    .I0(sig000000dc),
    .I1(sig00000002),
    .S(sig000000dd),
    .O(sig000000db)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  blk00000110 (
    .I0(a[16]),
    .I1(a[14]),
    .I2(a[15]),
    .I3(a[11]),
    .I4(a[12]),
    .I5(a[13]),
    .O(sig000000ba)
  );
  MUXF7   blk00000111 (
    .I0(sig000000ba),
    .I1(sig00000002),
    .S(a[17]),
    .O(sig000000b9)
  );
  LUT4 #(
    .INIT ( 16'hF1FB ))
  blk00000112 (
    .I0(sig00000091),
    .I1(a[18]),
    .I2(sig00000093),
    .I3(a[22]),
    .O(sig0000002e)
  );
  LUT5 #(
    .INIT ( 32'hFFFF14D7 ))
  blk00000113 (
    .I0(a[10]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[14]),
    .I4(sig00000093),
    .O(sig0000002f)
  );
  MUXF7   blk00000114 (
    .I0(sig0000002f),
    .I1(sig0000002e),
    .S(sig00000092),
    .O(sig00000030)
  );
  LUT5 #(
    .INIT ( 32'hFFFF14D7 ))
  blk00000115 (
    .I0(a[17]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[21]),
    .I4(sig00000093),
    .O(sig0000002b)
  );
  LUT4 #(
    .INIT ( 16'hF1FB ))
  blk00000116 (
    .I0(sig00000091),
    .I1(a[9]),
    .I2(sig00000093),
    .I3(a[13]),
    .O(sig0000002c)
  );
  MUXF7   blk00000117 (
    .I0(sig0000002c),
    .I1(sig0000002b),
    .S(sig00000092),
    .O(sig0000002d)
  );
  LUT5 #(
    .INIT ( 32'hFFFF14D7 ))
  blk00000118 (
    .I0(a[16]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[20]),
    .I4(sig00000093),
    .O(sig00000028)
  );
  LUT4 #(
    .INIT ( 16'hF1FB ))
  blk00000119 (
    .I0(sig00000091),
    .I1(a[8]),
    .I2(sig00000093),
    .I3(a[12]),
    .O(sig00000029)
  );
  MUXF7   blk0000011a (
    .I0(sig00000029),
    .I1(sig00000028),
    .S(sig00000092),
    .O(sig0000002a)
  );
  LUT5 #(
    .INIT ( 32'hFFFF14D7 ))
  blk0000011b (
    .I0(a[15]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[19]),
    .I4(sig00000093),
    .O(sig00000025)
  );
  LUT4 #(
    .INIT ( 16'h89CD ))
  blk0000011c (
    .I0(sig00000093),
    .I1(sig00000091),
    .I2(a[7]),
    .I3(a[11]),
    .O(sig00000026)
  );
  MUXF7   blk0000011d (
    .I0(sig00000026),
    .I1(sig00000025),
    .S(sig00000092),
    .O(sig00000027)
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  blk0000011e (
    .I0(sig00000091),
    .I1(a[22]),
    .I2(sig00000092),
    .O(sig00000022)
  );
  LUT6 #(
    .INIT ( 64'h008228AA55D77DFF ))
  blk0000011f (
    .I0(sig00000092),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[18]),
    .I4(a[14]),
    .I5(sig00000004),
    .O(sig00000023)
  );
  MUXF7   blk00000120 (
    .I0(sig00000023),
    .I1(sig00000022),
    .S(sig00000093),
    .O(sig00000024)
  );
  LUT5 #(
    .INIT ( 32'hFFFF14D7 ))
  blk00000121 (
    .I0(a[12]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[16]),
    .I4(sig00000093),
    .O(sig0000001a)
  );
  LUT4 #(
    .INIT ( 16'hAF27 ))
  blk00000122 (
    .I0(sig00000091),
    .I1(a[8]),
    .I2(sig00000017),
    .I3(sig00000093),
    .O(sig0000001b)
  );
  MUXF7   blk00000123 (
    .I0(sig0000001b),
    .I1(sig0000001a),
    .S(sig00000092),
    .O(sig0000001d)
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

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

endmodule

`endif

// synthesis translate_on
