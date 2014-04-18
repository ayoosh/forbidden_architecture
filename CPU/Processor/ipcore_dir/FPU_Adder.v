////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.28xd
//  \   \         Application: netgen
//  /   /         Filename: FPU_Adder.v
// /___/   /\     Timestamp: Thu Apr 17 17:13:49 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog E:/CPU/ipcore_dir/tmp/_cg/FPU_Adder.ngc E:/CPU/ipcore_dir/tmp/_cg/FPU_Adder.v 
// Device	: 5vlx110tff1136-2
// Input file	: E:/CPU/ipcore_dir/tmp/_cg/FPU_Adder.ngc
// Output file	: E:/CPU/ipcore_dir/tmp/_cg/FPU_Adder.v
// # of Modules	: 1
// Design Name	: FPU_Adder
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

module FPU_Adder (
  clk, result, operation, a, b
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  output [31 : 0] result;
  input [5 : 0] operation;
  input [31 : 0] a;
  input [31 : 0] b;
  
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
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire sig00000129;
  wire sig0000012a;
  wire sig0000012b;
  wire sig0000012c;
  wire sig0000012d;
  wire sig0000012e;
  wire sig0000012f;
  wire sig00000130;
  wire sig00000131;
  wire sig00000132;
  wire sig00000133;
  wire sig00000134;
  wire sig00000135;
  wire sig00000136;
  wire sig00000137;
  wire sig00000138;
  wire sig00000139;
  wire sig0000013a;
  wire \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/sign_op ;
  wire sig0000013b;
  wire sig0000013c;
  wire sig0000013d;
  wire sig0000013e;
  wire sig0000013f;
  wire sig00000140;
  wire sig00000141;
  wire sig00000142;
  wire sig00000143;
  wire sig00000144;
  wire sig00000145;
  wire sig00000146;
  wire sig00000147;
  wire sig00000148;
  wire sig00000149;
  wire sig0000014a;
  wire sig0000014b;
  wire sig0000014c;
  wire sig0000014d;
  wire sig0000014e;
  wire sig0000014f;
  wire sig00000150;
  wire sig00000151;
  wire sig00000152;
  wire sig00000153;
  wire sig00000154;
  wire sig00000155;
  wire sig00000156;
  wire sig00000157;
  wire sig00000158;
  wire sig00000159;
  wire sig0000015a;
  wire sig0000015b;
  wire sig0000015c;
  wire sig0000015d;
  wire sig0000015e;
  wire sig0000015f;
  wire sig00000160;
  wire sig00000161;
  wire sig00000162;
  wire sig00000163;
  wire sig00000164;
  wire sig00000165;
  wire sig00000166;
  wire sig00000167;
  wire sig00000168;
  wire sig00000169;
  wire sig0000016a;
  wire sig0000016b;
  wire sig0000016c;
  wire sig0000016d;
  wire sig0000016e;
  wire sig0000016f;
  wire sig00000170;
  wire sig00000171;
  wire sig00000172;
  wire sig00000173;
  wire sig00000174;
  wire sig00000175;
  wire sig00000176;
  wire sig00000177;
  wire sig00000178;
  wire sig00000179;
  wire sig0000017a;
  wire sig0000017b;
  wire sig0000017c;
  wire sig0000017d;
  wire sig0000017e;
  wire sig0000017f;
  wire sig00000180;
  wire sig00000181;
  wire sig00000182;
  wire sig00000183;
  wire sig00000184;
  wire sig00000185;
  wire sig00000186;
  wire sig00000187;
  wire sig00000188;
  wire sig00000189;
  wire sig0000018a;
  wire sig0000018b;
  wire sig0000018c;
  wire sig0000018d;
  wire sig0000018e;
  wire sig0000018f;
  wire sig00000190;
  wire sig00000191;
  wire sig00000192;
  wire sig00000193;
  wire sig00000194;
  wire sig00000195;
  wire NLW_blk00000003_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk00000003_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk00000003_OVERFLOW_UNCONNECTED;
  wire NLW_blk00000003_UNDERFLOW_UNCONNECTED;
  wire NLW_blk00000003_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk00000003_MULTSIGNOUT_UNCONNECTED;
  wire \NLW_blk00000003_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003_PCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000003_P<47>_UNCONNECTED ;
  wire \NLW_blk00000003_P<46>_UNCONNECTED ;
  wire \NLW_blk00000003_P<45>_UNCONNECTED ;
  wire \NLW_blk00000003_P<44>_UNCONNECTED ;
  wire \NLW_blk00000003_P<43>_UNCONNECTED ;
  wire \NLW_blk00000003_P<42>_UNCONNECTED ;
  wire \NLW_blk00000003_P<41>_UNCONNECTED ;
  wire \NLW_blk00000003_P<40>_UNCONNECTED ;
  wire \NLW_blk00000003_P<39>_UNCONNECTED ;
  wire \NLW_blk00000003_P<38>_UNCONNECTED ;
  wire \NLW_blk00000003_P<37>_UNCONNECTED ;
  wire \NLW_blk00000003_P<36>_UNCONNECTED ;
  wire \NLW_blk00000003_P<35>_UNCONNECTED ;
  wire \NLW_blk00000003_P<26>_UNCONNECTED ;
  wire \NLW_blk00000003_P<25>_UNCONNECTED ;
  wire \NLW_blk00000003_P<1>_UNCONNECTED ;
  wire \NLW_blk00000003_P<0>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000003_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003_CARRYOUT<0>_UNCONNECTED ;
  wire NLW_blk0000003b_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk0000003b_OVERFLOW_UNCONNECTED;
  wire NLW_blk0000003b_UNDERFLOW_UNCONNECTED;
  wire NLW_blk0000003b_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk0000003b_MULTSIGNOUT_UNCONNECTED;
  wire \NLW_blk0000003b_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003b_PCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<47>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<46>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<45>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<44>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<43>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<42>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<41>_UNCONNECTED ;
  wire \NLW_blk0000003b_P<40>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003b_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003b_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk0000003b_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk0000003b_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk0000003b_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk0000003b_CARRYOUT<0>_UNCONNECTED ;
  wire NLW_blk0000003d_O_UNCONNECTED;
  wire NLW_blk00000066_O_UNCONNECTED;
  wire [7 : 0] \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op ;
  wire [22 : 0] \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op ;
  assign
    result[31] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/sign_op ,
    result[30] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [7],
    result[29] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [6],
    result[28] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [5],
    result[27] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [4],
    result[26] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [3],
    result[25] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [2],
    result[24] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [1],
    result[23] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [0],
    result[22] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [22],
    result[21] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [21],
    result[20] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [20],
    result[19] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [19],
    result[18] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [18],
    result[17] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [17],
    result[16] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [16],
    result[15] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [15],
    result[14] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [14],
    result[13] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [13],
    result[12] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [12],
    result[11] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [11],
    result[10] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [10],
    result[9] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [9],
    result[8] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [8],
    result[7] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [7],
    result[6] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [6],
    result[5] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [5],
    result[4] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [4],
    result[3] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [3],
    result[2] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [2],
    result[1] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [1],
    result[0] = \U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [0];
  GND   blk00000001 (
    .G(sig00000001)
  );
  VCC   blk00000002 (
    .P(sig00000002)
  );
  DSP48E #(
    .ACASCREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATTERN_DETECT ( "FALSE" ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .MREG ( 0 ),
    .MULTCARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .SIM_MODE ( "SAFE" ),
    .USE_MULT ( "MULT" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ),
    .MASK ( 48'h3FFFFFFFFFFF ))
  blk00000003 (
    .CARRYIN(sig00000001),
    .CEA1(sig00000001),
    .CEA2(sig00000001),
    .CEB1(sig00000001),
    .CEB2(sig00000001),
    .CEC(sig00000001),
    .CECTRL(sig00000001),
    .CEP(sig00000001),
    .CEM(sig00000001),
    .CECARRYIN(sig00000001),
    .CEMULTCARRYIN(sig00000001),
    .CLK(clk),
    .RSTA(sig00000001),
    .RSTB(sig00000001),
    .RSTC(sig00000001),
    .RSTCTRL(sig00000001),
    .RSTP(sig00000001),
    .RSTM(sig00000001),
    .RSTALLCARRYIN(sig00000001),
    .CEALUMODE(sig00000001),
    .RSTALUMODE(sig00000001),
    .PATTERNBDETECT(NLW_blk00000003_PATTERNBDETECT_UNCONNECTED),
    .PATTERNDETECT(NLW_blk00000003_PATTERNDETECT_UNCONNECTED),
    .OVERFLOW(NLW_blk00000003_OVERFLOW_UNCONNECTED),
    .UNDERFLOW(NLW_blk00000003_UNDERFLOW_UNCONNECTED),
    .CARRYCASCIN(sig00000001),
    .CARRYCASCOUT(NLW_blk00000003_CARRYCASCOUT_UNCONNECTED),
    .MULTSIGNIN(sig00000001),
    .MULTSIGNOUT(NLW_blk00000003_MULTSIGNOUT_UNCONNECTED),
    .A({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig0000009a, sig00000099, sig00000098, sig00000097, sig00000096
, sig00000094, sig00000093, sig00000092, sig00000091, sig00000090, sig0000008f, sig0000008e, sig0000008d, sig0000008c, sig0000008b, sig000000a4, 
sig000000a3, sig000000a2, sig000000a1, sig000000a0, sig0000009f, sig0000009e, sig0000009d, sig00000095}),
    .PCIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .B({sig00000001, sig00000001, sig000000ac, sig000000ab, sig000000aa, sig000000a9, sig000000a8, sig000000a7, sig000000b5, sig000000b4, sig000000b3
, sig000000b2, sig000000b1, sig000000b0, sig000000af, sig000000ae, sig000000ad, sig000000a6}),
    .C({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001
, sig00000001, sig00000001, sig00000175, sig00000174, sig00000173, sig00000172, sig00000171, sig00000170, sig0000016f, sig0000016e, sig00000002, 
sig0000009b, sig0000008a, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig000000a5, sig00000001, sig00000001}),
    .CARRYINSEL({sig00000001, sig00000001, sig00000001}),
    .OPMODE({sig00000001, sig00000002, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002}),
    .BCIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .ALUMODE({sig00000001, sig00000001, sig00000001, sig00000001}),
    .PCOUT({\NLW_blk00000003_PCOUT<47>_UNCONNECTED , \NLW_blk00000003_PCOUT<46>_UNCONNECTED , \NLW_blk00000003_PCOUT<45>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<44>_UNCONNECTED , \NLW_blk00000003_PCOUT<43>_UNCONNECTED , \NLW_blk00000003_PCOUT<42>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<41>_UNCONNECTED , \NLW_blk00000003_PCOUT<40>_UNCONNECTED , \NLW_blk00000003_PCOUT<39>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<38>_UNCONNECTED , \NLW_blk00000003_PCOUT<37>_UNCONNECTED , \NLW_blk00000003_PCOUT<36>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<35>_UNCONNECTED , \NLW_blk00000003_PCOUT<34>_UNCONNECTED , \NLW_blk00000003_PCOUT<33>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<32>_UNCONNECTED , \NLW_blk00000003_PCOUT<31>_UNCONNECTED , \NLW_blk00000003_PCOUT<30>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<29>_UNCONNECTED , \NLW_blk00000003_PCOUT<28>_UNCONNECTED , \NLW_blk00000003_PCOUT<27>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<26>_UNCONNECTED , \NLW_blk00000003_PCOUT<25>_UNCONNECTED , \NLW_blk00000003_PCOUT<24>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<23>_UNCONNECTED , \NLW_blk00000003_PCOUT<22>_UNCONNECTED , \NLW_blk00000003_PCOUT<21>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<20>_UNCONNECTED , \NLW_blk00000003_PCOUT<19>_UNCONNECTED , \NLW_blk00000003_PCOUT<18>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<17>_UNCONNECTED , \NLW_blk00000003_PCOUT<16>_UNCONNECTED , \NLW_blk00000003_PCOUT<15>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<14>_UNCONNECTED , \NLW_blk00000003_PCOUT<13>_UNCONNECTED , \NLW_blk00000003_PCOUT<12>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<11>_UNCONNECTED , \NLW_blk00000003_PCOUT<10>_UNCONNECTED , \NLW_blk00000003_PCOUT<9>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<8>_UNCONNECTED , \NLW_blk00000003_PCOUT<7>_UNCONNECTED , \NLW_blk00000003_PCOUT<6>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<5>_UNCONNECTED , \NLW_blk00000003_PCOUT<4>_UNCONNECTED , \NLW_blk00000003_PCOUT<3>_UNCONNECTED , 
\NLW_blk00000003_PCOUT<2>_UNCONNECTED , \NLW_blk00000003_PCOUT<1>_UNCONNECTED , \NLW_blk00000003_PCOUT<0>_UNCONNECTED }),
    .P({\NLW_blk00000003_P<47>_UNCONNECTED , \NLW_blk00000003_P<46>_UNCONNECTED , \NLW_blk00000003_P<45>_UNCONNECTED , 
\NLW_blk00000003_P<44>_UNCONNECTED , \NLW_blk00000003_P<43>_UNCONNECTED , \NLW_blk00000003_P<42>_UNCONNECTED , \NLW_blk00000003_P<41>_UNCONNECTED , 
\NLW_blk00000003_P<40>_UNCONNECTED , \NLW_blk00000003_P<39>_UNCONNECTED , \NLW_blk00000003_P<38>_UNCONNECTED , \NLW_blk00000003_P<37>_UNCONNECTED , 
\NLW_blk00000003_P<36>_UNCONNECTED , \NLW_blk00000003_P<35>_UNCONNECTED , sig00000168, sig00000167, sig00000166, sig00000165, sig00000164, sig00000163
, sig00000162, sig00000161, \NLW_blk00000003_P<26>_UNCONNECTED , \NLW_blk00000003_P<25>_UNCONNECTED , sig0000018a, sig00000189, sig00000188, 
sig00000186, sig00000185, sig00000184, sig00000183, sig00000182, sig00000181, sig00000180, sig0000017f, sig0000017e, sig0000017d, sig00000192, 
sig00000191, sig00000190, sig0000018f, sig0000018e, sig0000018d, sig0000018c, sig0000018b, sig00000187, sig0000017c, 
\NLW_blk00000003_P<1>_UNCONNECTED , \NLW_blk00000003_P<0>_UNCONNECTED }),
    .BCOUT({\NLW_blk00000003_BCOUT<17>_UNCONNECTED , \NLW_blk00000003_BCOUT<16>_UNCONNECTED , \NLW_blk00000003_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<14>_UNCONNECTED , \NLW_blk00000003_BCOUT<13>_UNCONNECTED , \NLW_blk00000003_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<11>_UNCONNECTED , \NLW_blk00000003_BCOUT<10>_UNCONNECTED , \NLW_blk00000003_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<8>_UNCONNECTED , \NLW_blk00000003_BCOUT<7>_UNCONNECTED , \NLW_blk00000003_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<5>_UNCONNECTED , \NLW_blk00000003_BCOUT<4>_UNCONNECTED , \NLW_blk00000003_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000003_BCOUT<2>_UNCONNECTED , \NLW_blk00000003_BCOUT<1>_UNCONNECTED , \NLW_blk00000003_BCOUT<0>_UNCONNECTED }),
    .ACIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .ACOUT({\NLW_blk00000003_ACOUT<29>_UNCONNECTED , \NLW_blk00000003_ACOUT<28>_UNCONNECTED , \NLW_blk00000003_ACOUT<27>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<26>_UNCONNECTED , \NLW_blk00000003_ACOUT<25>_UNCONNECTED , \NLW_blk00000003_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<23>_UNCONNECTED , \NLW_blk00000003_ACOUT<22>_UNCONNECTED , \NLW_blk00000003_ACOUT<21>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<20>_UNCONNECTED , \NLW_blk00000003_ACOUT<19>_UNCONNECTED , \NLW_blk00000003_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<17>_UNCONNECTED , \NLW_blk00000003_ACOUT<16>_UNCONNECTED , \NLW_blk00000003_ACOUT<15>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<14>_UNCONNECTED , \NLW_blk00000003_ACOUT<13>_UNCONNECTED , \NLW_blk00000003_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<11>_UNCONNECTED , \NLW_blk00000003_ACOUT<10>_UNCONNECTED , \NLW_blk00000003_ACOUT<9>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<8>_UNCONNECTED , \NLW_blk00000003_ACOUT<7>_UNCONNECTED , \NLW_blk00000003_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<5>_UNCONNECTED , \NLW_blk00000003_ACOUT<4>_UNCONNECTED , \NLW_blk00000003_ACOUT<3>_UNCONNECTED , 
\NLW_blk00000003_ACOUT<2>_UNCONNECTED , \NLW_blk00000003_ACOUT<1>_UNCONNECTED , \NLW_blk00000003_ACOUT<0>_UNCONNECTED }),
    .CARRYOUT({\NLW_blk00000003_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000003_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000003_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000003_CARRYOUT<0>_UNCONNECTED })
  );
  LUT5 #(
    .INIT ( 32'h000000FC ))
  blk00000004 (
    .I0(sig00000001),
    .I1(sig0000008c),
    .I2(sig0000008d),
    .I3(sig0000008e),
    .I4(sig0000008f),
    .O(sig00000082)
  );
  LUT5 #(
    .INIT ( 32'h0000FF0C ))
  blk00000005 (
    .I0(sig00000001),
    .I1(sig0000008c),
    .I2(sig0000008d),
    .I3(sig0000008e),
    .I4(sig0000008f),
    .O(sig00000081)
  );
  LUT5 #(
    .INIT ( 32'h000000FC ))
  blk00000006 (
    .I0(sig00000001),
    .I1(sig00000090),
    .I2(sig00000091),
    .I3(sig00000092),
    .I4(sig00000093),
    .O(sig00000080)
  );
  LUT5 #(
    .INIT ( 32'h0000FF0C ))
  blk00000007 (
    .I0(sig00000001),
    .I1(sig00000090),
    .I2(sig00000091),
    .I3(sig00000092),
    .I4(sig00000093),
    .O(sig0000007f)
  );
  LUT5 #(
    .INIT ( 32'h000000FC ))
  blk00000008 (
    .I0(sig00000001),
    .I1(sig00000094),
    .I2(sig00000096),
    .I3(sig00000097),
    .I4(sig00000098),
    .O(sig0000007e)
  );
  LUT5 #(
    .INIT ( 32'h0000FF0C ))
  blk00000009 (
    .I0(sig00000001),
    .I1(sig00000094),
    .I2(sig00000096),
    .I3(sig00000097),
    .I4(sig00000098),
    .O(sig0000007d)
  );
  LUT5 #(
    .INIT ( 32'h000000FC ))
  blk0000000a (
    .I0(sig00000001),
    .I1(sig00000099),
    .I2(sig0000009a),
    .I3(sig0000009b),
    .I4(sig0000009c),
    .O(sig0000007c)
  );
  LUT5 #(
    .INIT ( 32'h0000FF0C ))
  blk0000000b (
    .I0(sig00000001),
    .I1(sig00000099),
    .I2(sig0000009a),
    .I3(sig0000009b),
    .I4(sig0000009c),
    .O(sig0000007b)
  );
  MUXCY   blk0000000c (
    .CI(sig00000088),
    .DI(sig00000001),
    .S(sig0000007a),
    .O(sig00000089)
  );
  MUXCY   blk0000000d (
    .CI(sig00000087),
    .DI(sig00000001),
    .S(sig00000079),
    .O(sig00000088)
  );
  MUXCY   blk0000000e (
    .CI(sig00000086),
    .DI(sig00000001),
    .S(sig00000078),
    .O(sig00000087)
  );
  MUXCY   blk0000000f (
    .CI(sig0000016d),
    .DI(sig00000001),
    .S(sig00000077),
    .O(sig00000086)
  );
  MUXCY   blk00000010 (
    .CI(sig00000085),
    .DI(sig00000001),
    .S(sig00000076),
    .O(sig0000016d)
  );
  MUXCY   blk00000011 (
    .CI(sig00000084),
    .DI(sig00000001),
    .S(sig00000075),
    .O(sig00000085)
  );
  MUXCY   blk00000012 (
    .CI(sig00000083),
    .DI(sig00000001),
    .S(sig00000074),
    .O(sig00000084)
  );
  MUXCY   blk00000013 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000073),
    .O(sig00000083)
  );
  FDRS   blk00000014 (
    .C(clk),
    .D(sig00000192),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [9])
  );
  FDRS   blk00000015 (
    .C(clk),
    .D(sig00000191),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [8])
  );
  FDRS   blk00000016 (
    .C(clk),
    .D(sig00000176),
    .R(sig00000001),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/sign_op )
  );
  FDRS   blk00000017 (
    .C(clk),
    .D(sig00000190),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [7])
  );
  FDRS   blk00000018 (
    .C(clk),
    .D(sig0000018f),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [6])
  );
  FDRS   blk00000019 (
    .C(clk),
    .D(sig0000018e),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [5])
  );
  FDRS   blk0000001a (
    .C(clk),
    .D(sig0000018d),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [4])
  );
  FDRS   blk0000001b (
    .C(clk),
    .D(sig0000018b),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [2])
  );
  FDRS   blk0000001c (
    .C(clk),
    .D(sig00000187),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [1])
  );
  FDRS   blk0000001d (
    .C(clk),
    .D(sig0000018c),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [3])
  );
  FDRS   blk0000001e (
    .C(clk),
    .D(sig0000017c),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [0])
  );
  FDRS   blk0000001f (
    .C(clk),
    .D(sig00000186),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [19])
  );
  FDRS   blk00000020 (
    .C(clk),
    .D(sig00000185),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [18])
  );
  FDRS   blk00000021 (
    .C(clk),
    .D(sig00000184),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [17])
  );
  FDRS   blk00000022 (
    .C(clk),
    .D(sig00000183),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [16])
  );
  FDRS   blk00000023 (
    .C(clk),
    .D(sig0000018a),
    .R(sig0000017a),
    .S(sig00000179),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [22])
  );
  FDRS   blk00000024 (
    .C(clk),
    .D(sig00000189),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [21])
  );
  FDRS   blk00000025 (
    .C(clk),
    .D(sig00000182),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [15])
  );
  FDRS   blk00000026 (
    .C(clk),
    .D(sig00000188),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [20])
  );
  FDRS   blk00000027 (
    .C(clk),
    .D(sig00000181),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [14])
  );
  FDRS   blk00000028 (
    .C(clk),
    .D(sig0000017f),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [12])
  );
  FDRS   blk00000029 (
    .C(clk),
    .D(sig00000180),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [13])
  );
  FDRS   blk0000002a (
    .C(clk),
    .D(sig0000017e),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [11])
  );
  FDRS   blk0000002b (
    .C(clk),
    .D(sig0000017d),
    .R(sig0000017b),
    .S(sig00000001),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/mant_op [10])
  );
  FDRS   blk0000002c (
    .C(clk),
    .D(sig00000168),
    .R(sig00000178),
    .S(sig00000177),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [7])
  );
  FDRS   blk0000002d (
    .C(clk),
    .D(sig00000167),
    .R(sig00000178),
    .S(sig00000177),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [6])
  );
  FDRS   blk0000002e (
    .C(clk),
    .D(sig00000166),
    .R(sig00000178),
    .S(sig00000177),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [5])
  );
  FDRS   blk0000002f (
    .C(clk),
    .D(sig00000165),
    .R(sig00000178),
    .S(sig00000177),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [4])
  );
  FDRS   blk00000030 (
    .C(clk),
    .D(sig00000164),
    .R(sig00000178),
    .S(sig00000177),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [3])
  );
  FDRS   blk00000031 (
    .C(clk),
    .D(sig00000163),
    .R(sig00000178),
    .S(sig00000177),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [2])
  );
  FDRS   blk00000032 (
    .C(clk),
    .D(sig00000162),
    .R(sig00000178),
    .S(sig00000177),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [1])
  );
  FDRS   blk00000033 (
    .C(clk),
    .D(sig00000161),
    .R(sig00000178),
    .S(sig00000177),
    .Q(\U0/op_inst/FLT_PT_OP/ADDSUB_OP.SPEED_OP.DSP.OP/OP/exp_op [0])
  );
  MUXCY   blk00000034 (
    .CI(sig00000014),
    .DI(sig00000001),
    .S(sig0000001b),
    .O(sig00000047)
  );
  MUXCY   blk00000035 (
    .CI(sig00000013),
    .DI(sig00000001),
    .S(sig0000001a),
    .O(sig00000014)
  );
  MUXCY   blk00000036 (
    .CI(sig00000012),
    .DI(sig00000001),
    .S(sig00000019),
    .O(sig00000013)
  );
  MUXCY   blk00000037 (
    .CI(sig00000011),
    .DI(sig00000001),
    .S(sig00000018),
    .O(sig00000012)
  );
  MUXCY   blk00000038 (
    .CI(sig00000010),
    .DI(sig00000001),
    .S(sig00000017),
    .O(sig00000011)
  );
  MUXCY   blk00000039 (
    .CI(sig0000000f),
    .DI(sig00000001),
    .S(sig00000016),
    .O(sig00000010)
  );
  MUXCY   blk0000003a (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig00000015),
    .O(sig0000000f)
  );
  DSP48E #(
    .ACASCREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATTERN_DETECT ( "FALSE" ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .MREG ( 0 ),
    .MULTCARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PREG ( 0 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .SIM_MODE ( "SAFE" ),
    .USE_MULT ( "MULT" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ),
    .MASK ( 48'hFF0000FFFFFF ))
  blk0000003b (
    .CARRYIN(sig0000001c),
    .CEA1(sig00000001),
    .CEA2(sig00000001),
    .CEB1(sig00000001),
    .CEB2(sig00000001),
    .CEC(sig00000001),
    .CECTRL(sig00000001),
    .CEP(sig00000001),
    .CEM(sig00000001),
    .CECARRYIN(sig00000001),
    .CEMULTCARRYIN(sig00000001),
    .CLK(clk),
    .RSTA(sig00000001),
    .RSTB(sig00000001),
    .RSTC(sig00000001),
    .RSTCTRL(sig00000001),
    .RSTP(sig00000001),
    .RSTM(sig00000001),
    .RSTALLCARRYIN(sig00000001),
    .CEALUMODE(sig00000001),
    .RSTALUMODE(sig00000001),
    .PATTERNBDETECT(NLW_blk0000003b_PATTERNBDETECT_UNCONNECTED),
    .PATTERNDETECT(sig00000169),
    .OVERFLOW(NLW_blk0000003b_OVERFLOW_UNCONNECTED),
    .UNDERFLOW(NLW_blk0000003b_UNDERFLOW_UNCONNECTED),
    .CARRYCASCIN(sig00000001),
    .CARRYCASCOUT(NLW_blk0000003b_CARRYCASCOUT_UNCONNECTED),
    .MULTSIGNIN(sig00000001),
    .MULTSIGNOUT(NLW_blk0000003b_MULTSIGNOUT_UNCONNECTED),
    .A({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000057, sig00000056, sig00000055, sig00000054, sig00000052
, sig00000051, sig00000050, sig0000004f, sig0000004e, sig0000004d, sig0000004c, sig0000004b, sig0000004a, sig00000049, sig0000005f, sig0000005e, 
sig0000005d, sig0000005c, sig0000005b, sig0000005a, sig00000059, sig00000058, sig00000053, sig00000048}),
    .PCIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .B({sig00000001, sig00000001, sig0000003b, sig0000003a, sig00000039, sig00000038, sig00000037, sig00000036, sig00000046, sig00000045, sig00000044
, sig00000043, sig00000042, sig00000041, sig00000040, sig0000003f, sig0000003e, sig00000035}),
    .C({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000002, sig0000002b
, sig0000002a, sig00000029, sig00000027, sig00000026, sig00000025, sig00000024, sig00000023, sig00000022, sig00000021, sig00000020, sig0000001f, 
sig0000001e, sig00000033, sig00000032, sig00000031, sig00000030, sig0000002f, sig0000002e, sig0000002d, sig0000002c, sig00000028, sig0000001d, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001}),
    .CARRYINSEL({sig00000001, sig00000001, sig00000001}),
    .OPMODE({sig00000001, sig00000034, sig00000034, sig00000001, sig0000006d, sig00000001, sig0000006d}),
    .BCIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .ALUMODE({sig00000001, sig00000001, sig00000193, sig00000193}),
    .PCOUT({\NLW_blk0000003b_PCOUT<47>_UNCONNECTED , \NLW_blk0000003b_PCOUT<46>_UNCONNECTED , \NLW_blk0000003b_PCOUT<45>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<44>_UNCONNECTED , \NLW_blk0000003b_PCOUT<43>_UNCONNECTED , \NLW_blk0000003b_PCOUT<42>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<41>_UNCONNECTED , \NLW_blk0000003b_PCOUT<40>_UNCONNECTED , \NLW_blk0000003b_PCOUT<39>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<38>_UNCONNECTED , \NLW_blk0000003b_PCOUT<37>_UNCONNECTED , \NLW_blk0000003b_PCOUT<36>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<35>_UNCONNECTED , \NLW_blk0000003b_PCOUT<34>_UNCONNECTED , \NLW_blk0000003b_PCOUT<33>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<32>_UNCONNECTED , \NLW_blk0000003b_PCOUT<31>_UNCONNECTED , \NLW_blk0000003b_PCOUT<30>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<29>_UNCONNECTED , \NLW_blk0000003b_PCOUT<28>_UNCONNECTED , \NLW_blk0000003b_PCOUT<27>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<26>_UNCONNECTED , \NLW_blk0000003b_PCOUT<25>_UNCONNECTED , \NLW_blk0000003b_PCOUT<24>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<23>_UNCONNECTED , \NLW_blk0000003b_PCOUT<22>_UNCONNECTED , \NLW_blk0000003b_PCOUT<21>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<20>_UNCONNECTED , \NLW_blk0000003b_PCOUT<19>_UNCONNECTED , \NLW_blk0000003b_PCOUT<18>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<17>_UNCONNECTED , \NLW_blk0000003b_PCOUT<16>_UNCONNECTED , \NLW_blk0000003b_PCOUT<15>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<14>_UNCONNECTED , \NLW_blk0000003b_PCOUT<13>_UNCONNECTED , \NLW_blk0000003b_PCOUT<12>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<11>_UNCONNECTED , \NLW_blk0000003b_PCOUT<10>_UNCONNECTED , \NLW_blk0000003b_PCOUT<9>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<8>_UNCONNECTED , \NLW_blk0000003b_PCOUT<7>_UNCONNECTED , \NLW_blk0000003b_PCOUT<6>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<5>_UNCONNECTED , \NLW_blk0000003b_PCOUT<4>_UNCONNECTED , \NLW_blk0000003b_PCOUT<3>_UNCONNECTED , 
\NLW_blk0000003b_PCOUT<2>_UNCONNECTED , \NLW_blk0000003b_PCOUT<1>_UNCONNECTED , \NLW_blk0000003b_PCOUT<0>_UNCONNECTED }),
    .P({\NLW_blk0000003b_P<47>_UNCONNECTED , \NLW_blk0000003b_P<46>_UNCONNECTED , \NLW_blk0000003b_P<45>_UNCONNECTED , 
\NLW_blk0000003b_P<44>_UNCONNECTED , \NLW_blk0000003b_P<43>_UNCONNECTED , \NLW_blk0000003b_P<42>_UNCONNECTED , \NLW_blk0000003b_P<41>_UNCONNECTED , 
\NLW_blk0000003b_P<40>_UNCONNECTED , sig0000014d, sig0000014c, sig0000014b, sig0000014a, sig00000149, sig00000148, sig00000147, sig00000145, 
sig00000144, sig00000143, sig00000142, sig00000141, sig00000140, sig0000013f, sig0000013e, sig0000013d, sig0000013c, sig00000155, sig00000154, 
sig00000153, sig00000152, sig00000151, sig00000150, sig0000014f, sig0000014e, sig00000146, sig0000013b, sig00000063, sig00000062, sig00000061, 
sig0000006c, sig0000006b, sig0000006a, sig00000069, sig00000068, sig00000067, sig00000066, sig00000065, sig00000064, sig00000060}),
    .BCOUT({\NLW_blk0000003b_BCOUT<17>_UNCONNECTED , \NLW_blk0000003b_BCOUT<16>_UNCONNECTED , \NLW_blk0000003b_BCOUT<15>_UNCONNECTED , 
\NLW_blk0000003b_BCOUT<14>_UNCONNECTED , \NLW_blk0000003b_BCOUT<13>_UNCONNECTED , \NLW_blk0000003b_BCOUT<12>_UNCONNECTED , 
\NLW_blk0000003b_BCOUT<11>_UNCONNECTED , \NLW_blk0000003b_BCOUT<10>_UNCONNECTED , \NLW_blk0000003b_BCOUT<9>_UNCONNECTED , 
\NLW_blk0000003b_BCOUT<8>_UNCONNECTED , \NLW_blk0000003b_BCOUT<7>_UNCONNECTED , \NLW_blk0000003b_BCOUT<6>_UNCONNECTED , 
\NLW_blk0000003b_BCOUT<5>_UNCONNECTED , \NLW_blk0000003b_BCOUT<4>_UNCONNECTED , \NLW_blk0000003b_BCOUT<3>_UNCONNECTED , 
\NLW_blk0000003b_BCOUT<2>_UNCONNECTED , \NLW_blk0000003b_BCOUT<1>_UNCONNECTED , \NLW_blk0000003b_BCOUT<0>_UNCONNECTED }),
    .ACIN({sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, 
sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .ACOUT({\NLW_blk0000003b_ACOUT<29>_UNCONNECTED , \NLW_blk0000003b_ACOUT<28>_UNCONNECTED , \NLW_blk0000003b_ACOUT<27>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<26>_UNCONNECTED , \NLW_blk0000003b_ACOUT<25>_UNCONNECTED , \NLW_blk0000003b_ACOUT<24>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<23>_UNCONNECTED , \NLW_blk0000003b_ACOUT<22>_UNCONNECTED , \NLW_blk0000003b_ACOUT<21>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<20>_UNCONNECTED , \NLW_blk0000003b_ACOUT<19>_UNCONNECTED , \NLW_blk0000003b_ACOUT<18>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<17>_UNCONNECTED , \NLW_blk0000003b_ACOUT<16>_UNCONNECTED , \NLW_blk0000003b_ACOUT<15>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<14>_UNCONNECTED , \NLW_blk0000003b_ACOUT<13>_UNCONNECTED , \NLW_blk0000003b_ACOUT<12>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<11>_UNCONNECTED , \NLW_blk0000003b_ACOUT<10>_UNCONNECTED , \NLW_blk0000003b_ACOUT<9>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<8>_UNCONNECTED , \NLW_blk0000003b_ACOUT<7>_UNCONNECTED , \NLW_blk0000003b_ACOUT<6>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<5>_UNCONNECTED , \NLW_blk0000003b_ACOUT<4>_UNCONNECTED , \NLW_blk0000003b_ACOUT<3>_UNCONNECTED , 
\NLW_blk0000003b_ACOUT<2>_UNCONNECTED , \NLW_blk0000003b_ACOUT<1>_UNCONNECTED , \NLW_blk0000003b_ACOUT<0>_UNCONNECTED }),
    .CARRYOUT({\NLW_blk0000003b_CARRYOUT<3>_UNCONNECTED , \NLW_blk0000003b_CARRYOUT<2>_UNCONNECTED , \NLW_blk0000003b_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk0000003b_CARRYOUT<0>_UNCONNECTED })
  );
  MUXCY   blk0000003c (
    .CI(sig00000047),
    .DI(sig00000002),
    .S(sig0000000e),
    .O(sig00000070)
  );
  XORCY   blk0000003d (
    .CI(sig00000047),
    .LI(sig0000000e),
    .O(NLW_blk0000003d_O_UNCONNECTED)
  );
  MUXCY   blk0000003e (
    .CI(sig000000f2),
    .DI(sig00000102),
    .S(sig00000112),
    .O(sig0000015f)
  );
  MUXCY   blk0000003f (
    .CI(sig000000f1),
    .DI(sig00000101),
    .S(sig00000111),
    .O(sig000000f2)
  );
  MUXCY   blk00000040 (
    .CI(sig000000f0),
    .DI(sig00000100),
    .S(sig00000110),
    .O(sig000000f1)
  );
  MUXCY   blk00000041 (
    .CI(sig000000ef),
    .DI(sig000000ff),
    .S(sig0000010f),
    .O(sig000000f0)
  );
  MUXCY   blk00000042 (
    .CI(sig000000ee),
    .DI(sig000000fe),
    .S(sig0000010e),
    .O(sig000000ef)
  );
  MUXCY   blk00000043 (
    .CI(sig000000ed),
    .DI(sig000000fd),
    .S(sig0000010d),
    .O(sig000000ee)
  );
  MUXCY   blk00000044 (
    .CI(sig000000fb),
    .DI(sig0000010b),
    .S(sig0000011b),
    .O(sig000000ed)
  );
  MUXCY   blk00000045 (
    .CI(sig000000fa),
    .DI(sig0000010a),
    .S(sig0000011a),
    .O(sig000000fb)
  );
  MUXCY   blk00000046 (
    .CI(sig000000f9),
    .DI(sig00000109),
    .S(sig00000119),
    .O(sig000000fa)
  );
  MUXCY   blk00000047 (
    .CI(sig000000f8),
    .DI(sig00000108),
    .S(sig00000118),
    .O(sig000000f9)
  );
  MUXCY   blk00000048 (
    .CI(sig000000f7),
    .DI(sig00000107),
    .S(sig00000117),
    .O(sig000000f8)
  );
  MUXCY   blk00000049 (
    .CI(sig000000f6),
    .DI(sig00000106),
    .S(sig00000116),
    .O(sig000000f7)
  );
  MUXCY   blk0000004a (
    .CI(sig000000f5),
    .DI(sig00000105),
    .S(sig00000115),
    .O(sig000000f6)
  );
  MUXCY   blk0000004b (
    .CI(sig000000f4),
    .DI(sig00000104),
    .S(sig00000114),
    .O(sig000000f5)
  );
  MUXCY   blk0000004c (
    .CI(sig000000f3),
    .DI(sig00000103),
    .S(sig00000113),
    .O(sig000000f4)
  );
  MUXCY   blk0000004d (
    .CI(sig00000001),
    .DI(sig000000fc),
    .S(sig0000010c),
    .O(sig000000f3)
  );
  MUXCY   blk0000004e (
    .CI(sig000000bf),
    .DI(sig00000001),
    .S(sig000000c3),
    .O(sig00000122)
  );
  MUXCY   blk0000004f (
    .CI(sig000000be),
    .DI(sig00000001),
    .S(sig000000c2),
    .O(sig000000bf)
  );
  MUXCY   blk00000050 (
    .CI(sig000000bd),
    .DI(sig00000001),
    .S(sig000000c1),
    .O(sig000000be)
  );
  MUXCY   blk00000051 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig000000c0),
    .O(sig000000bd)
  );
  MUXCY   blk00000052 (
    .CI(sig000000b8),
    .DI(sig00000001),
    .S(sig000000bc),
    .O(sig0000011d)
  );
  MUXCY   blk00000053 (
    .CI(sig000000b7),
    .DI(sig00000001),
    .S(sig000000bb),
    .O(sig000000b8)
  );
  MUXCY   blk00000054 (
    .CI(sig000000b6),
    .DI(sig00000001),
    .S(sig000000ba),
    .O(sig000000b7)
  );
  MUXCY   blk00000055 (
    .CI(sig00000002),
    .DI(sig00000001),
    .S(sig000000b9),
    .O(sig000000b6)
  );
  MUXCY   blk00000056 (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig0000011f),
    .O(sig000000c4)
  );
  XORCY   blk00000057 (
    .CI(sig00000001),
    .LI(sig0000011f),
    .O(sig00000126)
  );
  MUXCY   blk00000058 (
    .CI(sig000000c4),
    .DI(sig00000001),
    .S(sig0000012e),
    .O(sig000000c5)
  );
  XORCY   blk00000059 (
    .CI(sig000000c4),
    .LI(sig0000012e),
    .O(sig00000127)
  );
  MUXCY   blk0000005a (
    .CI(sig000000c5),
    .DI(sig00000001),
    .S(sig0000012f),
    .O(sig000000c6)
  );
  XORCY   blk0000005b (
    .CI(sig000000c5),
    .LI(sig0000012f),
    .O(sig00000128)
  );
  MUXCY   blk0000005c (
    .CI(sig000000c6),
    .DI(sig00000001),
    .S(sig00000130),
    .O(sig000000c7)
  );
  XORCY   blk0000005d (
    .CI(sig000000c6),
    .LI(sig00000130),
    .O(sig00000129)
  );
  MUXCY   blk0000005e (
    .CI(sig000000c7),
    .DI(sig00000001),
    .S(sig00000131),
    .O(sig000000c8)
  );
  XORCY   blk0000005f (
    .CI(sig000000c7),
    .LI(sig00000131),
    .O(sig0000012a)
  );
  MUXCY   blk00000060 (
    .CI(sig000000c8),
    .DI(sig00000001),
    .S(sig00000132),
    .O(sig000000c9)
  );
  XORCY   blk00000061 (
    .CI(sig000000c8),
    .LI(sig00000132),
    .O(sig0000012b)
  );
  MUXCY   blk00000062 (
    .CI(sig000000c9),
    .DI(sig00000001),
    .S(sig00000133),
    .O(sig000000ca)
  );
  XORCY   blk00000063 (
    .CI(sig000000c9),
    .LI(sig00000133),
    .O(sig0000012c)
  );
  MUXCY   blk00000064 (
    .CI(sig000000ca),
    .DI(sig00000001),
    .S(sig00000134),
    .O(sig000000cb)
  );
  XORCY   blk00000065 (
    .CI(sig000000ca),
    .LI(sig00000134),
    .O(sig0000012d)
  );
  XORCY   blk00000066 (
    .CI(sig000000cb),
    .LI(sig00000001),
    .O(NLW_blk00000066_O_UNCONNECTED)
  );
  XORCY   blk00000067 (
    .CI(sig000000e4),
    .LI(sig00000002),
    .O(sig00000138)
  );
  XORCY   blk00000068 (
    .CI(sig000000e3),
    .LI(sig00000002),
    .O(sig00000137)
  );
  MUXCY   blk00000069 (
    .CI(sig000000e3),
    .DI(sig00000001),
    .S(sig00000002),
    .O(sig000000e4)
  );
  XORCY   blk0000006a (
    .CI(sig000000e2),
    .LI(sig000000ec),
    .O(sig00000175)
  );
  MUXCY   blk0000006b (
    .CI(sig000000e2),
    .DI(sig0000012d),
    .S(sig000000ec),
    .O(sig000000e3)
  );
  XORCY   blk0000006c (
    .CI(sig000000e1),
    .LI(sig000000eb),
    .O(sig00000174)
  );
  MUXCY   blk0000006d (
    .CI(sig000000e1),
    .DI(sig0000012c),
    .S(sig000000eb),
    .O(sig000000e2)
  );
  XORCY   blk0000006e (
    .CI(sig000000e0),
    .LI(sig000000ea),
    .O(sig00000173)
  );
  MUXCY   blk0000006f (
    .CI(sig000000e0),
    .DI(sig0000012b),
    .S(sig000000ea),
    .O(sig000000e1)
  );
  XORCY   blk00000070 (
    .CI(sig000000df),
    .LI(sig000000e9),
    .O(sig00000172)
  );
  MUXCY   blk00000071 (
    .CI(sig000000df),
    .DI(sig0000012a),
    .S(sig000000e9),
    .O(sig000000e0)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000072 (
    .I0(sig0000012a),
    .I1(sig00000169),
    .O(sig000000e9)
  );
  XORCY   blk00000073 (
    .CI(sig000000de),
    .LI(sig000000e8),
    .O(sig00000171)
  );
  MUXCY   blk00000074 (
    .CI(sig000000de),
    .DI(sig00000129),
    .S(sig000000e8),
    .O(sig000000df)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000075 (
    .I0(sig00000129),
    .I1(sig0000016d),
    .O(sig000000e8)
  );
  XORCY   blk00000076 (
    .CI(sig000000dd),
    .LI(sig000000e7),
    .O(sig00000170)
  );
  MUXCY   blk00000077 (
    .CI(sig000000dd),
    .DI(sig00000128),
    .S(sig000000e7),
    .O(sig000000de)
  );
  XORCY   blk00000078 (
    .CI(sig000000dc),
    .LI(sig000000e6),
    .O(sig0000016f)
  );
  MUXCY   blk00000079 (
    .CI(sig000000dc),
    .DI(sig00000127),
    .S(sig000000e6),
    .O(sig000000dd)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000007a (
    .I0(sig00000127),
    .I1(sig0000016b),
    .O(sig000000e6)
  );
  XORCY   blk0000007b (
    .CI(sig00000002),
    .LI(sig000000e5),
    .O(sig0000016e)
  );
  MUXCY   blk0000007c (
    .CI(sig00000002),
    .DI(sig00000126),
    .S(sig000000e5),
    .O(sig000000dc)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000007d (
    .I0(sig00000126),
    .I1(sig0000016a),
    .O(sig000000e5)
  );
  XORCY   blk0000007e (
    .CI(sig000000d3),
    .LI(sig00000002),
    .O(sig0000015e)
  );
  XORCY   blk0000007f (
    .CI(sig000000d2),
    .LI(sig000000db),
    .O(sig0000015d)
  );
  MUXCY   blk00000080 (
    .CI(sig000000d2),
    .DI(b[30]),
    .S(sig000000db),
    .O(sig000000d3)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000081 (
    .I0(b[30]),
    .I1(a[30]),
    .O(sig000000db)
  );
  XORCY   blk00000082 (
    .CI(sig000000d1),
    .LI(sig000000da),
    .O(sig0000015c)
  );
  MUXCY   blk00000083 (
    .CI(sig000000d1),
    .DI(b[29]),
    .S(sig000000da),
    .O(sig000000d2)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000084 (
    .I0(b[29]),
    .I1(a[29]),
    .O(sig000000da)
  );
  XORCY   blk00000085 (
    .CI(sig000000d0),
    .LI(sig000000d9),
    .O(sig0000015b)
  );
  MUXCY   blk00000086 (
    .CI(sig000000d0),
    .DI(b[28]),
    .S(sig000000d9),
    .O(sig000000d1)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000087 (
    .I0(b[28]),
    .I1(a[28]),
    .O(sig000000d9)
  );
  XORCY   blk00000088 (
    .CI(sig000000cf),
    .LI(sig000000d8),
    .O(sig0000015a)
  );
  MUXCY   blk00000089 (
    .CI(sig000000cf),
    .DI(b[27]),
    .S(sig000000d8),
    .O(sig000000d0)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000008a (
    .I0(b[27]),
    .I1(a[27]),
    .O(sig000000d8)
  );
  XORCY   blk0000008b (
    .CI(sig000000ce),
    .LI(sig000000d7),
    .O(sig00000159)
  );
  MUXCY   blk0000008c (
    .CI(sig000000ce),
    .DI(b[26]),
    .S(sig000000d7),
    .O(sig000000cf)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk0000008d (
    .I0(b[26]),
    .I1(a[26]),
    .O(sig000000d7)
  );
  XORCY   blk0000008e (
    .CI(sig000000cd),
    .LI(sig000000d6),
    .O(sig00000158)
  );
  MUXCY   blk0000008f (
    .CI(sig000000cd),
    .DI(b[25]),
    .S(sig000000d6),
    .O(sig000000ce)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000090 (
    .I0(b[25]),
    .I1(a[25]),
    .O(sig000000d6)
  );
  XORCY   blk00000091 (
    .CI(sig000000cc),
    .LI(sig000000d5),
    .O(sig00000157)
  );
  MUXCY   blk00000092 (
    .CI(sig000000cc),
    .DI(b[24]),
    .S(sig000000d5),
    .O(sig000000cd)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000093 (
    .I0(b[24]),
    .I1(a[24]),
    .O(sig000000d5)
  );
  XORCY   blk00000094 (
    .CI(sig00000002),
    .LI(sig000000d4),
    .O(sig00000156)
  );
  MUXCY   blk00000095 (
    .CI(sig00000002),
    .DI(b[23]),
    .S(sig000000d4),
    .O(sig000000cc)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk00000096 (
    .I0(b[23]),
    .I1(a[23]),
    .O(sig000000d4)
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  blk00000097 (
    .I0(b[18]),
    .I1(b[19]),
    .I2(b[20]),
    .I3(b[21]),
    .I4(b[22]),
    .O(sig000000c3)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000098 (
    .I0(b[12]),
    .I1(b[13]),
    .I2(b[14]),
    .I3(b[15]),
    .I4(b[16]),
    .I5(b[17]),
    .O(sig000000c2)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000099 (
    .I0(b[6]),
    .I1(b[7]),
    .I2(b[8]),
    .I3(b[9]),
    .I4(b[10]),
    .I5(b[11]),
    .O(sig000000c1)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000009a (
    .I0(b[0]),
    .I1(b[1]),
    .I2(b[2]),
    .I3(b[3]),
    .I4(b[4]),
    .I5(b[5]),
    .O(sig000000c0)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  blk0000009b (
    .I0(b[25]),
    .I1(b[24]),
    .I2(b[23]),
    .O(sig0000000b)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk0000009c (
    .I0(b[30]),
    .I1(b[29]),
    .I2(b[28]),
    .I3(b[27]),
    .I4(b[26]),
    .I5(sig0000000b),
    .O(sig00000120)
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  blk0000009d (
    .I0(a[18]),
    .I1(a[19]),
    .I2(a[20]),
    .I3(a[21]),
    .I4(a[22]),
    .O(sig000000bc)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000009e (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[14]),
    .I3(a[15]),
    .I4(a[16]),
    .I5(a[17]),
    .O(sig000000bb)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000009f (
    .I0(a[6]),
    .I1(a[7]),
    .I2(a[8]),
    .I3(a[9]),
    .I4(a[10]),
    .I5(a[11]),
    .O(sig000000ba)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000a0 (
    .I0(a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[3]),
    .I4(a[4]),
    .I5(a[5]),
    .O(sig000000b9)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk000000a1 (
    .I0(a[26]),
    .I1(a[25]),
    .I2(a[24]),
    .I3(a[23]),
    .O(sig0000000c)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk000000a2 (
    .I0(sig0000011d),
    .I1(a[30]),
    .I2(a[29]),
    .I3(a[28]),
    .I4(a[27]),
    .I5(sig0000000c),
    .O(sig0000011c)
  );
  LUT5 #(
    .INIT ( 32'h55555444 ))
  blk000000a3 (
    .I0(sig00000194),
    .I1(sig0000011c),
    .I2(sig00000120),
    .I3(sig00000122),
    .I4(sig0000011e),
    .O(sig00000124)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF14445444 ))
  blk000000a4 (
    .I0(sig0000011e),
    .I1(sig0000011c),
    .I2(sig00000120),
    .I3(sig00000122),
    .I4(sig00000193),
    .I5(sig00000194),
    .O(sig00000125)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk000000a5 (
    .I0(a[28]),
    .I1(a[27]),
    .I2(a[26]),
    .I3(a[25]),
    .I4(a[24]),
    .I5(a[23]),
    .O(sig0000000d)
  );
  LUT6 #(
    .INIT ( 64'h4000FFFF40004000 ))
  blk000000a6 (
    .I0(sig0000011d),
    .I1(sig0000000d),
    .I2(a[30]),
    .I3(a[29]),
    .I4(sig00000122),
    .I5(sig00000120),
    .O(sig0000011e)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000a7 (
    .I0(sig0000015e),
    .I1(a[30]),
    .I2(b[30]),
    .O(sig00000134)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000a8 (
    .I0(sig0000015e),
    .I1(a[29]),
    .I2(b[29]),
    .O(sig00000133)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000a9 (
    .I0(sig0000015e),
    .I1(a[28]),
    .I2(b[28]),
    .O(sig00000132)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000aa (
    .I0(sig0000015e),
    .I1(a[27]),
    .I2(b[27]),
    .O(sig00000131)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000ab (
    .I0(sig0000015e),
    .I1(a[26]),
    .I2(b[26]),
    .O(sig00000130)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000ac (
    .I0(sig0000015e),
    .I1(a[25]),
    .I2(b[25]),
    .O(sig0000012f)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000ad (
    .I0(sig0000015e),
    .I1(a[24]),
    .I2(b[24]),
    .O(sig0000012e)
  );
  LUT3 #(
    .INIT ( 8'h1B ))
  blk000000ae (
    .I0(sig0000015e),
    .I1(b[23]),
    .I2(a[23]),
    .O(sig0000011f)
  );
  LUT6 #(
    .INIT ( 64'hFFAA0C08FFFF0C0C ))
  blk000000af (
    .I0(sig00000125),
    .I1(sig0000013a),
    .I2(sig0000011e),
    .I3(sig00000124),
    .I4(sig00000139),
    .I5(sig00000160),
    .O(sig00000176)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk000000b0 (
    .I0(sig00000169),
    .I1(sig00000089),
    .O(sig00000160)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk000000b1 (
    .I0(operation[0]),
    .I1(b[31]),
    .O(sig00000123)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  blk000000b2 (
    .I0(sig00000070),
    .I1(sig00000061),
    .I2(sig0000006c),
    .I3(sig0000006b),
    .I4(sig0000006a),
    .I5(sig00000069),
    .O(sig00000071)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000b3 (
    .I0(sig00000067),
    .I1(sig00000068),
    .I2(sig00000066),
    .I3(sig00000065),
    .I4(sig00000064),
    .I5(sig00000060),
    .O(sig00000072)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000b4 (
    .I0(sig00000169),
    .I1(sig00000155),
    .O(sig000000a4)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000b5 (
    .I0(sig00000169),
    .I1(sig00000154),
    .O(sig000000a3)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000b6 (
    .I0(sig00000169),
    .I1(sig00000153),
    .O(sig000000a2)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000b7 (
    .I0(sig00000169),
    .I1(sig00000152),
    .O(sig000000a1)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000b8 (
    .I0(sig00000169),
    .I1(sig00000151),
    .O(sig000000a0)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000b9 (
    .I0(sig00000169),
    .I1(sig00000150),
    .O(sig0000009f)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000ba (
    .I0(sig00000169),
    .I1(sig0000014f),
    .O(sig0000009e)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000bb (
    .I0(sig00000169),
    .I1(sig0000014e),
    .O(sig0000009d)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000bc (
    .I0(sig00000169),
    .I1(sig00000146),
    .O(sig00000095)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000bd (
    .I0(sig00000169),
    .I1(sig0000013c),
    .O(sig0000008b)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000be (
    .I0(sig0000015f),
    .I1(b[9]),
    .I2(a[9]),
    .O(sig00000033)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000bf (
    .I0(sig0000015f),
    .I1(b[8]),
    .I2(a[8]),
    .O(sig00000032)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c0 (
    .I0(sig0000015f),
    .I1(b[7]),
    .I2(a[7]),
    .O(sig00000031)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c1 (
    .I0(sig0000015f),
    .I1(b[6]),
    .I2(a[6]),
    .O(sig00000030)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c2 (
    .I0(sig0000015f),
    .I1(b[5]),
    .I2(a[5]),
    .O(sig0000002f)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c3 (
    .I0(sig0000015f),
    .I1(b[4]),
    .I2(a[4]),
    .O(sig0000002e)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c4 (
    .I0(sig0000015f),
    .I1(b[3]),
    .I2(a[3]),
    .O(sig0000002d)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c5 (
    .I0(sig0000015f),
    .I1(b[2]),
    .I2(a[2]),
    .O(sig0000002c)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c6 (
    .I0(sig0000015f),
    .I1(b[22]),
    .I2(a[22]),
    .O(sig0000002b)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c7 (
    .I0(sig0000015f),
    .I1(b[21]),
    .I2(a[21]),
    .O(sig0000002a)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c8 (
    .I0(sig0000015f),
    .I1(b[20]),
    .I2(a[20]),
    .O(sig00000029)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000c9 (
    .I0(sig0000015f),
    .I1(b[1]),
    .I2(a[1]),
    .O(sig00000028)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000ca (
    .I0(sig0000015f),
    .I1(b[19]),
    .I2(a[19]),
    .O(sig00000027)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000cb (
    .I0(sig0000015f),
    .I1(b[18]),
    .I2(a[18]),
    .O(sig00000026)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000cc (
    .I0(sig0000015f),
    .I1(b[17]),
    .I2(a[17]),
    .O(sig00000025)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000cd (
    .I0(sig0000015f),
    .I1(b[16]),
    .I2(a[16]),
    .O(sig00000024)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000ce (
    .I0(sig0000015f),
    .I1(b[15]),
    .I2(a[15]),
    .O(sig00000023)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000cf (
    .I0(sig0000015f),
    .I1(b[14]),
    .I2(a[14]),
    .O(sig00000022)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000d0 (
    .I0(sig0000015f),
    .I1(b[13]),
    .I2(a[13]),
    .O(sig00000021)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000d1 (
    .I0(sig0000015f),
    .I1(b[12]),
    .I2(a[12]),
    .O(sig00000020)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000d2 (
    .I0(sig0000015f),
    .I1(b[11]),
    .I2(a[11]),
    .O(sig0000001f)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000d3 (
    .I0(sig0000015f),
    .I1(b[10]),
    .I2(a[10]),
    .O(sig0000001e)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk000000d4 (
    .I0(sig0000015f),
    .I1(b[0]),
    .I2(a[0]),
    .O(sig0000001d)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  blk000000d5 (
    .I0(b[25]),
    .I1(b[24]),
    .I2(b[23]),
    .O(sig00000003)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000d6 (
    .I0(b[30]),
    .I1(b[29]),
    .I2(b[28]),
    .I3(b[27]),
    .I4(b[26]),
    .I5(sig00000003),
    .O(sig00000121)
  );
  LUT4 #(
    .INIT ( 16'hFFEF ))
  blk000000d7 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(sig00000121),
    .I3(a[25]),
    .O(sig00000004)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk000000d8 (
    .I0(a[30]),
    .I1(a[29]),
    .I2(a[28]),
    .I3(a[27]),
    .I4(a[26]),
    .I5(sig00000004),
    .O(sig00000194)
  );
  LUT4 #(
    .INIT ( 16'h8001 ))
  blk000000d9 (
    .I0(sig0000015c),
    .I1(sig0000015b),
    .I2(sig0000015e),
    .I3(sig0000015d),
    .O(sig0000006f)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  blk000000da (
    .I0(sig0000006e),
    .I1(sig00000121),
    .I2(sig0000003d),
    .I3(sig0000006f),
    .O(sig0000006d)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000db (
    .I0(sig00000169),
    .I1(sig0000013e),
    .O(sig0000008d)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000dc (
    .I0(sig00000169),
    .I1(sig0000013d),
    .O(sig0000008c)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000dd (
    .I0(sig00000169),
    .I1(sig00000140),
    .O(sig0000008f)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000de (
    .I0(sig00000169),
    .I1(sig0000013f),
    .O(sig0000008e)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk000000df (
    .I0(a[30]),
    .I1(b[30]),
    .O(sig00000102)
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  blk000000e0 (
    .I0(b[30]),
    .I1(a[30]),
    .O(sig00000112)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000e1 (
    .I0(b[29]),
    .I1(b[28]),
    .I2(a[28]),
    .I3(a[29]),
    .O(sig00000101)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000e2 (
    .I0(b[28]),
    .I1(a[28]),
    .I2(b[29]),
    .I3(a[29]),
    .O(sig00000111)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000e3 (
    .I0(b[27]),
    .I1(b[26]),
    .I2(a[26]),
    .I3(a[27]),
    .O(sig00000100)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000e4 (
    .I0(b[26]),
    .I1(a[26]),
    .I2(b[27]),
    .I3(a[27]),
    .O(sig00000110)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000e5 (
    .I0(b[25]),
    .I1(b[24]),
    .I2(a[24]),
    .I3(a[25]),
    .O(sig000000ff)
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  blk000000e6 (
    .I0(sig00000172),
    .I1(sig00000171),
    .I2(sig00000170),
    .I3(sig0000016f),
    .I4(sig0000016e),
    .O(sig00000005)
  );
  LUT6 #(
    .INIT ( 64'h0000080000000000 ))
  blk000000e7 (
    .I0(sig00000175),
    .I1(sig00000173),
    .I2(sig00000138),
    .I3(sig00000174),
    .I4(sig00000137),
    .I5(sig00000005),
    .O(sig00000135)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000e8 (
    .I0(b[24]),
    .I1(a[24]),
    .I2(b[25]),
    .I3(a[25]),
    .O(sig0000010f)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000e9 (
    .I0(b[23]),
    .I1(b[22]),
    .I2(a[22]),
    .I3(a[23]),
    .O(sig000000fe)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000ea (
    .I0(b[22]),
    .I1(a[22]),
    .I2(b[23]),
    .I3(a[23]),
    .O(sig0000010e)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000eb (
    .I0(b[21]),
    .I1(b[20]),
    .I2(a[20]),
    .I3(a[21]),
    .O(sig000000fd)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk000000ec (
    .I0(sig0000016c),
    .I1(sig0000016d),
    .I2(sig00000082),
    .I3(sig0000007c),
    .I4(sig00000080),
    .I5(sig0000007e),
    .O(sig0000016b)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000ed (
    .I0(b[20]),
    .I1(a[20]),
    .I2(b[21]),
    .I3(a[21]),
    .O(sig0000010d)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000ee (
    .I0(b[19]),
    .I1(b[18]),
    .I2(a[18]),
    .I3(a[19]),
    .O(sig0000010b)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000ef (
    .I0(b[18]),
    .I1(a[18]),
    .I2(b[19]),
    .I3(a[19]),
    .O(sig0000011b)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000f0 (
    .I0(b[17]),
    .I1(b[16]),
    .I2(a[16]),
    .I3(a[17]),
    .O(sig0000010a)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000f1 (
    .I0(b[16]),
    .I1(a[16]),
    .I2(b[17]),
    .I3(a[17]),
    .O(sig0000011a)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000f2 (
    .I0(b[15]),
    .I1(b[14]),
    .I2(a[14]),
    .I3(a[15]),
    .O(sig00000109)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000f3 (
    .I0(b[14]),
    .I1(a[14]),
    .I2(b[15]),
    .I3(a[15]),
    .O(sig00000119)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000f4 (
    .I0(b[13]),
    .I1(b[12]),
    .I2(a[12]),
    .I3(a[13]),
    .O(sig00000108)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk000000f5 (
    .I0(b[12]),
    .I1(a[12]),
    .I2(b[13]),
    .I3(a[13]),
    .O(sig00000118)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000f6 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[22]),
    .I3(a[22]),
    .O(sig00000056)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000f7 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[21]),
    .I3(a[21]),
    .O(sig00000055)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000f8 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[20]),
    .I3(a[20]),
    .O(sig00000054)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000f9 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[19]),
    .I3(a[19]),
    .O(sig00000052)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000fa (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[18]),
    .I3(a[18]),
    .O(sig00000051)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000fb (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[17]),
    .I3(a[17]),
    .O(sig00000050)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000fc (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[16]),
    .I3(a[16]),
    .O(sig0000004f)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000fd (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[15]),
    .I3(a[15]),
    .O(sig0000004e)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk000000fe (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[14]),
    .I3(a[14]),
    .O(sig0000004d)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk000000ff (
    .I0(b[11]),
    .I1(b[10]),
    .I2(a[10]),
    .I3(a[11]),
    .O(sig00000107)
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  blk00000100 (
    .I0(sig00000169),
    .I1(sig00000141),
    .O(sig00000090)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000101 (
    .I0(sig00000169),
    .I1(sig0000013b),
    .I2(sig00000142),
    .O(sig00000091)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000102 (
    .I0(b[10]),
    .I1(a[10]),
    .I2(b[11]),
    .I3(a[11]),
    .O(sig00000117)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk00000103 (
    .I0(b[9]),
    .I1(b[8]),
    .I2(a[8]),
    .I3(a[9]),
    .O(sig00000106)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000104 (
    .I0(sig00000169),
    .I1(sig0000014e),
    .I2(sig00000144),
    .O(sig00000093)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000105 (
    .I0(sig00000169),
    .I1(sig00000146),
    .I2(sig00000143),
    .O(sig00000092)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000106 (
    .I0(b[8]),
    .I1(a[8]),
    .I2(b[9]),
    .I3(a[9]),
    .O(sig00000116)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk00000107 (
    .I0(b[7]),
    .I1(b[6]),
    .I2(a[6]),
    .I3(a[7]),
    .O(sig00000105)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000108 (
    .I0(sig00000169),
    .I1(sig00000150),
    .I2(sig00000147),
    .O(sig00000096)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000109 (
    .I0(sig00000169),
    .I1(sig0000014f),
    .I2(sig00000145),
    .O(sig00000094)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000010a (
    .I0(b[6]),
    .I1(a[6]),
    .I2(b[7]),
    .I3(a[7]),
    .O(sig00000115)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk0000010b (
    .I0(b[5]),
    .I1(b[4]),
    .I2(a[4]),
    .I3(a[5]),
    .O(sig00000104)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk0000010c (
    .I0(sig00000169),
    .I1(sig00000152),
    .I2(sig00000149),
    .O(sig00000098)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk0000010d (
    .I0(sig00000169),
    .I1(sig00000151),
    .I2(sig00000148),
    .O(sig00000097)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk0000010e (
    .I0(b[4]),
    .I1(a[4]),
    .I2(b[5]),
    .I3(a[5]),
    .O(sig00000114)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk0000010f (
    .I0(b[3]),
    .I1(b[2]),
    .I2(a[2]),
    .I3(a[3]),
    .O(sig00000103)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000110 (
    .I0(sig00000169),
    .I1(sig00000154),
    .I2(sig0000014b),
    .O(sig0000009a)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000111 (
    .I0(sig00000169),
    .I1(sig00000153),
    .I2(sig0000014a),
    .O(sig00000099)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000112 (
    .I0(b[2]),
    .I1(a[2]),
    .I2(b[3]),
    .I3(a[3]),
    .O(sig00000113)
  );
  LUT4 #(
    .INIT ( 16'h08AE ))
  blk00000113 (
    .I0(b[1]),
    .I1(b[0]),
    .I2(a[0]),
    .I3(a[1]),
    .O(sig000000fc)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000114 (
    .I0(sig00000169),
    .I1(sig0000013c),
    .I2(sig0000014d),
    .O(sig0000009c)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000115 (
    .I0(sig00000169),
    .I1(sig00000155),
    .I2(sig0000014c),
    .O(sig0000009b)
  );
  LUT3 #(
    .INIT ( 8'hD8 ))
  blk00000116 (
    .I0(sig0000016d),
    .I1(sig00000087),
    .I2(sig00000084),
    .O(sig0000016c)
  );
  LUT4 #(
    .INIT ( 16'h9009 ))
  blk00000117 (
    .I0(b[0]),
    .I1(a[0]),
    .I2(b[1]),
    .I3(a[1]),
    .O(sig0000010c)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk00000118 (
    .I0(sig0000016c),
    .I1(sig0000016d),
    .I2(sig00000081),
    .I3(sig0000007b),
    .I4(sig0000007f),
    .I5(sig0000007d),
    .O(sig0000016a)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF55555554 ))
  blk00000119 (
    .I0(sig00000124),
    .I1(sig00000160),
    .I2(sig00000135),
    .I3(sig00000138),
    .I4(sig00000136),
    .I5(sig00000125),
    .O(sig0000017a)
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAAAAAAABAA ))
  blk0000011a (
    .I0(sig00000124),
    .I1(sig00000125),
    .I2(sig00000160),
    .I3(sig00000135),
    .I4(sig00000138),
    .I5(sig00000136),
    .O(sig00000177)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  blk0000011b (
    .I0(sig00000160),
    .I1(sig00000135),
    .I2(sig00000138),
    .I3(sig00000136),
    .I4(sig00000124),
    .I5(sig00000125),
    .O(sig0000017b)
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  blk0000011c (
    .I0(sig00000172),
    .I1(sig00000171),
    .I2(sig00000170),
    .I3(sig0000016f),
    .I4(sig0000016e),
    .O(sig00000006)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000011d (
    .I0(sig00000138),
    .I1(sig00000137),
    .I2(sig00000175),
    .I3(sig00000174),
    .I4(sig00000173),
    .I5(sig00000006),
    .O(sig00000136)
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  blk0000011e (
    .I0(sig0000003c),
    .O(sig0000000e)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  blk0000011f (
    .I0(sig00000071),
    .I1(sig00000062),
    .I2(sig00000063),
    .I3(sig00000072),
    .O(sig00000195)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  blk00000120 (
    .I0(sig00000120),
    .I1(sig00000122),
    .O(sig00000007)
  );
  LUT6 #(
    .INIT ( 64'h1131113000200030 ))
  blk00000121 (
    .I0(sig0000011c),
    .I1(sig00000194),
    .I2(a[31]),
    .I3(sig00000007),
    .I4(sig0000015f),
    .I5(sig00000123),
    .O(sig0000013a)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  blk00000122 (
    .I0(a[28]),
    .I1(a[29]),
    .I2(a[30]),
    .O(sig00000008)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  blk00000123 (
    .I0(a[23]),
    .I1(a[24]),
    .I2(a[25]),
    .I3(a[26]),
    .I4(a[27]),
    .I5(sig00000008),
    .O(sig0000006e)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk00000124 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[22]),
    .I3(b[8]),
    .I4(a[8]),
    .I5(b[22]),
    .O(sig0000005e)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk00000125 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[21]),
    .I3(b[7]),
    .I4(a[7]),
    .I5(b[21]),
    .O(sig0000005d)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk00000126 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[20]),
    .I3(b[6]),
    .I4(a[6]),
    .I5(b[20]),
    .O(sig0000005c)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk00000127 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[19]),
    .I3(b[5]),
    .I4(a[5]),
    .I5(b[19]),
    .O(sig0000005b)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk00000128 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[18]),
    .I3(b[4]),
    .I4(a[4]),
    .I5(b[18]),
    .O(sig0000005a)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk00000129 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[17]),
    .I3(b[3]),
    .I4(a[3]),
    .I5(b[17]),
    .O(sig00000059)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk0000012a (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[16]),
    .I3(b[2]),
    .I4(a[2]),
    .I5(b[16]),
    .O(sig00000058)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk0000012b (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[15]),
    .I3(b[1]),
    .I4(a[1]),
    .I5(b[15]),
    .O(sig00000053)
  );
  LUT6 #(
    .INIT ( 64'hF7E6B3A2D5C49180 ))
  blk0000012c (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(a[14]),
    .I3(b[0]),
    .I4(a[0]),
    .I5(b[14]),
    .O(sig00000048)
  );
  LUT4 #(
    .INIT ( 16'hA965 ))
  blk0000012d (
    .I0(sig00000128),
    .I1(sig0000016d),
    .I2(sig00000084),
    .I3(sig00000087),
    .O(sig000000e7)
  );
  LUT5 #(
    .INIT ( 32'h0CC00440 ))
  blk0000012e (
    .I0(sig0000011e),
    .I1(a[31]),
    .I2(operation[0]),
    .I3(b[31]),
    .I4(sig00000194),
    .O(sig00000139)
  );
  LUT3 #(
    .INIT ( 8'h96 ))
  blk0000012f (
    .I0(operation[0]),
    .I1(b[31]),
    .I2(a[31]),
    .O(sig00000193)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  blk00000130 (
    .I0(a[30]),
    .I1(a[29]),
    .I2(a[28]),
    .I3(a[27]),
    .I4(a[26]),
    .I5(sig00000004),
    .O(sig00000034)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk00000131 (
    .I0(sig00000083),
    .I1(sig00000169),
    .I2(sig0000014d),
    .I3(sig0000013c),
    .O(sig000000a6)
  );
  LUT5 #(
    .INIT ( 32'h00E00040 ))
  blk00000132 (
    .I0(sig00000169),
    .I1(sig0000014b),
    .I2(sig00000083),
    .I3(sig00000084),
    .I4(sig00000154),
    .O(sig000000ae)
  );
  LUT6 #(
    .INIT ( 64'h0020000002220000 ))
  blk00000133 (
    .I0(sig00000099),
    .I1(sig00000084),
    .I2(sig00000169),
    .I3(sig00000154),
    .I4(sig00000083),
    .I5(sig0000014b),
    .O(sig000000af)
  );
  LUT5 #(
    .INIT ( 32'h00E00040 ))
  blk00000134 (
    .I0(sig00000169),
    .I1(sig00000149),
    .I2(sig00000084),
    .I3(sig00000085),
    .I4(sig00000152),
    .O(sig000000b0)
  );
  LUT6 #(
    .INIT ( 64'h0020000002220000 ))
  blk00000135 (
    .I0(sig00000097),
    .I1(sig00000085),
    .I2(sig00000169),
    .I3(sig00000152),
    .I4(sig00000084),
    .I5(sig00000149),
    .O(sig000000b1)
  );
  LUT5 #(
    .INIT ( 32'h00E00040 ))
  blk00000136 (
    .I0(sig00000169),
    .I1(sig00000147),
    .I2(sig00000085),
    .I3(sig0000016d),
    .I4(sig00000150),
    .O(sig000000b2)
  );
  LUT6 #(
    .INIT ( 64'h0020000002220000 ))
  blk00000137 (
    .I0(sig00000094),
    .I1(sig0000016d),
    .I2(sig00000169),
    .I3(sig00000150),
    .I4(sig00000085),
    .I5(sig00000147),
    .O(sig000000b3)
  );
  LUT5 #(
    .INIT ( 32'h00E00040 ))
  blk00000138 (
    .I0(sig00000169),
    .I1(sig00000144),
    .I2(sig0000016d),
    .I3(sig00000086),
    .I4(sig0000014e),
    .O(sig000000b4)
  );
  LUT6 #(
    .INIT ( 64'h0020000002220000 ))
  blk00000139 (
    .I0(sig00000092),
    .I1(sig00000086),
    .I2(sig00000169),
    .I3(sig0000014e),
    .I4(sig0000016d),
    .I5(sig00000144),
    .O(sig000000b5)
  );
  LUT5 #(
    .INIT ( 32'h00E00040 ))
  blk0000013a (
    .I0(sig00000169),
    .I1(sig00000142),
    .I2(sig00000086),
    .I3(sig00000087),
    .I4(sig0000013b),
    .O(sig000000a7)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  blk0000013b (
    .I0(sig00000087),
    .I1(sig00000088),
    .I2(sig00000169),
    .I3(sig00000140),
    .O(sig000000a9)
  );
  LUT4 #(
    .INIT ( 16'h0200 ))
  blk0000013c (
    .I0(sig00000088),
    .I1(sig00000089),
    .I2(sig00000169),
    .I3(sig0000013e),
    .O(sig000000ab)
  );
  LUT4 #(
    .INIT ( 16'hFFD8 ))
  blk0000013d (
    .I0(sig0000015f),
    .I1(a[9]),
    .I2(b[9]),
    .I3(sig0000003c),
    .O(sig0000005f)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk0000013e (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[13]),
    .I3(a[13]),
    .O(sig0000004c)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk0000013f (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[12]),
    .I3(a[12]),
    .O(sig0000004b)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk00000140 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[11]),
    .I3(a[11]),
    .O(sig0000004a)
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  blk00000141 (
    .I0(sig0000003c),
    .I1(sig0000015f),
    .I2(b[10]),
    .I3(a[10]),
    .O(sig00000049)
  );
  LUT6 #(
    .INIT ( 64'h5555555455545554 ))
  blk00000142 (
    .I0(sig00000124),
    .I1(sig00000136),
    .I2(sig00000138),
    .I3(sig00000125),
    .I4(sig00000169),
    .I5(sig00000089),
    .O(sig00000178)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000143 (
    .I0(sig0000015f),
    .I1(a[12]),
    .I2(a[13]),
    .I3(b[13]),
    .I4(b[12]),
    .O(sig0000001b)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000144 (
    .I0(sig0000015f),
    .I1(a[10]),
    .I2(a[11]),
    .I3(b[11]),
    .I4(b[10]),
    .O(sig0000001a)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000145 (
    .I0(sig0000015f),
    .I1(a[8]),
    .I2(a[9]),
    .I3(b[9]),
    .I4(b[8]),
    .O(sig00000019)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000146 (
    .I0(sig0000015f),
    .I1(a[6]),
    .I2(a[7]),
    .I3(b[7]),
    .I4(b[6]),
    .O(sig00000018)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000147 (
    .I0(sig0000015f),
    .I1(a[4]),
    .I2(a[5]),
    .I3(b[5]),
    .I4(b[4]),
    .O(sig00000017)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000148 (
    .I0(sig0000015f),
    .I1(a[2]),
    .I2(a[3]),
    .I3(b[3]),
    .I4(b[2]),
    .O(sig00000016)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000149 (
    .I0(sig0000015f),
    .I1(a[0]),
    .I2(a[1]),
    .I3(b[1]),
    .I4(b[0]),
    .O(sig00000015)
  );
  LUT6 #(
    .INIT ( 64'h0000FFFF00008000 ))
  blk0000014a (
    .I0(sig0000011c),
    .I1(sig00000120),
    .I2(sig00000122),
    .I3(sig00000193),
    .I4(sig00000194),
    .I5(sig0000011e),
    .O(sig00000179)
  );
  LUT5 #(
    .INIT ( 32'h00000008 ))
  blk0000014b (
    .I0(sig00000141),
    .I1(sig00000086),
    .I2(sig00000169),
    .I3(sig00000087),
    .I4(sig00000142),
    .O(sig000000a8)
  );
  LUT5 #(
    .INIT ( 32'hEA404040 ))
  blk0000014c (
    .I0(sig00000169),
    .I1(sig0000014c),
    .I2(sig0000014d),
    .I3(sig0000013c),
    .I4(sig00000155),
    .O(sig0000008a)
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  blk0000014d (
    .I0(sig0000013e),
    .I1(sig0000013d),
    .I2(sig00000169),
    .O(sig0000007a)
  );
  LUT6 #(
    .INIT ( 64'h0400151104000400 ))
  blk0000014e (
    .I0(sig00000083),
    .I1(sig00000169),
    .I2(sig0000013c),
    .I3(sig00000155),
    .I4(sig0000014d),
    .I5(sig0000014c),
    .O(sig000000ad)
  );
  LUT3 #(
    .INIT ( 8'hF1 ))
  blk0000014f (
    .I0(sig00000140),
    .I1(sig0000013f),
    .I2(sig00000169),
    .O(sig00000079)
  );
  LUT5 #(
    .INIT ( 32'h00000008 ))
  blk00000150 (
    .I0(sig00000087),
    .I1(sig0000013f),
    .I2(sig00000169),
    .I3(sig00000088),
    .I4(sig00000140),
    .O(sig000000aa)
  );
  LUT5 #(
    .INIT ( 32'h00000008 ))
  blk00000151 (
    .I0(sig00000088),
    .I1(sig0000013d),
    .I2(sig00000169),
    .I3(sig00000089),
    .I4(sig0000013e),
    .O(sig000000ac)
  );
  LUT4 #(
    .INIT ( 16'h2227 ))
  blk00000152 (
    .I0(sig00000169),
    .I1(sig0000013b),
    .I2(sig00000141),
    .I3(sig00000142),
    .O(sig00000078)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000153 (
    .I0(sig00000169),
    .I1(sig0000014e),
    .I2(sig00000146),
    .I3(sig00000143),
    .I4(sig00000144),
    .O(sig00000077)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000154 (
    .I0(sig00000169),
    .I1(sig00000150),
    .I2(sig0000014f),
    .I3(sig00000145),
    .I4(sig00000147),
    .O(sig00000076)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000155 (
    .I0(sig00000169),
    .I1(sig00000152),
    .I2(sig00000151),
    .I3(sig00000148),
    .I4(sig00000149),
    .O(sig00000075)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000156 (
    .I0(sig00000169),
    .I1(sig00000154),
    .I2(sig00000153),
    .I3(sig0000014a),
    .I4(sig0000014b),
    .O(sig00000074)
  );
  LUT5 #(
    .INIT ( 32'h02020257 ))
  blk00000157 (
    .I0(sig00000169),
    .I1(sig0000013c),
    .I2(sig00000155),
    .I3(sig0000014c),
    .I4(sig0000014d),
    .O(sig00000073)
  );
  LUT4 #(
    .INIT ( 16'h4114 ))
  blk00000158 (
    .I0(sig00000070),
    .I1(operation[0]),
    .I2(b[31]),
    .I3(a[31]),
    .O(sig0000001c)
  );
  MUXF7   blk00000159 (
    .I0(sig00000009),
    .I1(sig0000000a),
    .S(sig0000014d),
    .O(sig000000a5)
  );
  LUT6 #(
    .INIT ( 64'hC888D888C080D888 ))
  blk0000015a (
    .I0(sig0000014c),
    .I1(sig00000146),
    .I2(sig0000013b),
    .I3(sig0000014b),
    .I4(sig00000195),
    .I5(sig0000014e),
    .O(sig00000009)
  );
  LUT5 #(
    .INIT ( 32'hAAAAA8AA ))
  blk0000015b (
    .I0(sig0000014e),
    .I1(sig0000014f),
    .I2(sig00000146),
    .I3(sig00000195),
    .I4(sig0000013b),
    .O(sig0000000a)
  );
  INV   blk0000015c (
    .I(sig0000003c),
    .O(sig00000057)
  );
  INV   blk0000015d (
    .I(sig0000012b),
    .O(sig000000ea)
  );
  INV   blk0000015e (
    .I(sig0000012c),
    .O(sig000000eb)
  );
  INV   blk0000015f (
    .I(sig0000012d),
    .O(sig000000ec)
  );
  LUT6 #(
    .INIT ( 64'h666666666666666A ))
  blk00000160 (
    .I0(sig0000015a),
    .I1(sig0000015b),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig00000157),
    .I5(sig00000156),
    .O(sig0000003c)
  );
  LUT6 #(
    .INIT ( 64'h0200080000200080 ))
  blk00000161 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig0000015b),
    .I3(sig00000158),
    .I4(sig0000015a),
    .I5(sig00000159),
    .O(sig00000035)
  );
  LUT6 #(
    .INIT ( 64'h0800200000080020 ))
  blk00000162 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000036)
  );
  LUT6 #(
    .INIT ( 64'h0010004004001000 ))
  blk00000163 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig0000015b),
    .I4(sig0000015a),
    .I5(sig00000159),
    .O(sig0000003e)
  );
  LUT6 #(
    .INIT ( 64'h1000400000040010 ))
  blk00000164 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000037)
  );
  LUT6 #(
    .INIT ( 64'h2000800000020008 ))
  blk00000165 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000038)
  );
  LUT6 #(
    .INIT ( 64'h0200080000200080 ))
  blk00000166 (
    .I0(sig00000156),
    .I1(sig00000159),
    .I2(sig00000158),
    .I3(sig00000157),
    .I4(sig0000015b),
    .I5(sig0000015a),
    .O(sig0000003f)
  );
  LUT6 #(
    .INIT ( 64'h0010004004001000 ))
  blk00000167 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000040)
  );
  LUT6 #(
    .INIT ( 64'h0200080000200080 ))
  blk00000168 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000159),
    .I3(sig00000158),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000041)
  );
  LUT6 #(
    .INIT ( 64'h0040010001000400 ))
  blk00000169 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000042)
  );
  LUT6 #(
    .INIT ( 64'h0100040000400100 ))
  blk0000016a (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000044)
  );
  LUT6 #(
    .INIT ( 64'h0200080000200080 ))
  blk0000016b (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000045)
  );
  LUT6 #(
    .INIT ( 64'h0400100000100040 ))
  blk0000016c (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000046)
  );
  LUT6 #(
    .INIT ( 64'h4001000000010004 ))
  blk0000016d (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig00000039)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000002 ))
  blk0000016e (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .I5(sig0000015b),
    .O(sig0000003a)
  );
  LUT5 #(
    .INIT ( 32'h00800200 ))
  blk0000016f (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .O(sig00000043)
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  blk00000170 (
    .I0(sig00000156),
    .I1(sig00000157),
    .I2(sig00000158),
    .I3(sig00000159),
    .I4(sig0000015a),
    .O(sig0000003b)
  );
  LUT6 #(
    .INIT ( 64'h0818181818181010 ))
  blk00000171 (
    .I0(sig00000159),
    .I1(sig0000015a),
    .I2(sig0000015b),
    .I3(sig00000156),
    .I4(sig00000157),
    .I5(sig00000158),
    .O(sig0000003d)
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
