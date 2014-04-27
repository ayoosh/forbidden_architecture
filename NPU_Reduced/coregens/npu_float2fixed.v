////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.40d
//  \   \         Application: netgen
//  /   /         Filename: npu_float2fixed.v
// /___/   /\     Timestamp: Tue Mar 18 19:28:30 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_float2fixed.ngc C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_float2fixed.v 
// Device	: 5vlx110tff1136-1
// Input file	: C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_float2fixed.ngc
// Output file	: C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_float2fixed.v
// # of Modules	: 1
// Design Name	: npu_float2fixed
// Xilinx        : C:\Xilinx\13.1\ISE_DS\ISE\
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

module npu_float2fixed (
a, result
)/* synthesis syn_black_box syn_noprune=1 */;
  input [31 : 0] a;
  output [15 : 0] result;
  
  // synthesis translate_off
  
  wire \blk00000003/sig000000c3 ;
  wire \blk00000003/sig000000c2 ;
  wire \blk00000003/sig000000c1 ;
  wire \blk00000003/sig000000c0 ;
  wire \blk00000003/sig000000bf ;
  wire \blk00000003/sig000000be ;
  wire \blk00000003/sig000000bd ;
  wire \blk00000003/sig000000bc ;
  wire \blk00000003/sig000000bb ;
  wire \blk00000003/sig000000ba ;
  wire \blk00000003/sig000000b9 ;
  wire \blk00000003/sig000000b8 ;
  wire \blk00000003/sig000000b7 ;
  wire \blk00000003/sig000000b6 ;
  wire \blk00000003/sig000000b5 ;
  wire \blk00000003/sig000000b4 ;
  wire \blk00000003/sig000000b3 ;
  wire \blk00000003/sig000000b2 ;
  wire \blk00000003/sig000000b1 ;
  wire \blk00000003/sig000000b0 ;
  wire \blk00000003/sig000000af ;
  wire \blk00000003/sig000000ae ;
  wire \blk00000003/sig000000ad ;
  wire \blk00000003/sig000000ac ;
  wire \blk00000003/sig000000ab ;
  wire \blk00000003/sig000000aa ;
  wire \blk00000003/sig000000a9 ;
  wire \blk00000003/sig000000a8 ;
  wire \blk00000003/sig000000a7 ;
  wire \blk00000003/sig000000a6 ;
  wire \blk00000003/sig000000a5 ;
  wire \blk00000003/sig000000a4 ;
  wire \blk00000003/sig000000a3 ;
  wire \blk00000003/sig000000a2 ;
  wire \blk00000003/sig000000a1 ;
  wire \blk00000003/sig000000a0 ;
  wire \blk00000003/sig0000009f ;
  wire \blk00000003/sig0000009e ;
  wire \blk00000003/sig0000009d ;
  wire \blk00000003/sig0000009c ;
  wire \blk00000003/sig0000009b ;
  wire \blk00000003/sig0000009a ;
  wire \blk00000003/sig00000099 ;
  wire \blk00000003/sig00000098 ;
  wire \blk00000003/sig00000097 ;
  wire \blk00000003/sig00000096 ;
  wire \blk00000003/sig00000095 ;
  wire \blk00000003/sig00000094 ;
  wire \blk00000003/sig00000093 ;
  wire \blk00000003/sig00000092 ;
  wire \blk00000003/sig00000091 ;
  wire \blk00000003/sig00000090 ;
  wire \blk00000003/sig0000008f ;
  wire \blk00000003/sig0000008e ;
  wire \blk00000003/sig0000008d ;
  wire \blk00000003/sig0000008c ;
  wire \blk00000003/sig0000008b ;
  wire \blk00000003/sig0000008a ;
  wire \blk00000003/sig00000089 ;
  wire \blk00000003/sig00000088 ;
  wire \blk00000003/sig00000087 ;
  wire \blk00000003/sig00000086 ;
  wire \blk00000003/sig00000085 ;
  wire \blk00000003/sig00000084 ;
  wire \blk00000003/sig00000083 ;
  wire \blk00000003/sig00000082 ;
  wire \blk00000003/sig00000081 ;
  wire \blk00000003/sig00000080 ;
  wire \blk00000003/sig0000007f ;
  wire \blk00000003/sig0000007e ;
  wire \blk00000003/sig0000007d ;
  wire \blk00000003/sig0000007c ;
  wire \blk00000003/sig0000007b ;
  wire \blk00000003/sig0000007a ;
  wire \blk00000003/sig00000079 ;
  wire \blk00000003/sig00000078 ;
  wire \blk00000003/sig00000077 ;
  wire \blk00000003/sig00000076 ;
  wire \blk00000003/sig00000075 ;
  wire \blk00000003/sig00000074 ;
  wire \blk00000003/sig00000073 ;
  wire \blk00000003/sig00000072 ;
  wire \blk00000003/sig00000071 ;
  wire \blk00000003/sig00000070 ;
  wire \blk00000003/sig0000006f ;
  wire \blk00000003/sig0000006e ;
  wire \blk00000003/sig0000006d ;
  wire \blk00000003/sig0000006c ;
  wire \blk00000003/sig0000006b ;
  wire \blk00000003/sig0000006a ;
  wire \blk00000003/sig00000069 ;
  wire \blk00000003/sig00000068 ;
  wire \blk00000003/sig00000067 ;
  wire \blk00000003/sig00000066 ;
  wire \blk00000003/sig00000065 ;
  wire \blk00000003/sig00000064 ;
  wire \blk00000003/sig00000063 ;
  wire \blk00000003/sig00000062 ;
  wire \blk00000003/sig00000061 ;
  wire \blk00000003/sig00000060 ;
  wire \blk00000003/sig0000005f ;
  wire \blk00000003/sig0000005e ;
  wire \blk00000003/sig0000005d ;
  wire \blk00000003/sig0000005c ;
  wire \blk00000003/sig0000005b ;
  wire \blk00000003/sig0000005a ;
  wire \blk00000003/sig00000059 ;
  wire \blk00000003/sig00000058 ;
  wire \blk00000003/sig00000057 ;
  wire \blk00000003/sig00000056 ;
  wire \blk00000003/sig00000055 ;
  wire \blk00000003/sig00000054 ;
  wire \blk00000003/sig00000053 ;
  wire \blk00000003/sig00000052 ;
  wire \blk00000003/sig00000051 ;
  wire \blk00000003/sig00000050 ;
  wire \blk00000003/sig0000004f ;
  wire \blk00000003/sig0000004e ;
  wire \blk00000003/sig0000004d ;
  wire \blk00000003/sig0000004c ;
  wire \blk00000003/sig0000004b ;
  wire \blk00000003/sig0000004a ;
  wire \blk00000003/sig00000049 ;
  wire \blk00000003/sig00000048 ;
  wire \blk00000003/sig00000047 ;
  wire \blk00000003/sig00000046 ;
  wire \blk00000003/sig00000045 ;
  wire \blk00000003/sig00000044 ;
  wire \blk00000003/sig00000043 ;
  wire \blk00000003/sig00000042 ;
  wire \blk00000003/sig00000041 ;
  wire \blk00000003/sig00000040 ;
  wire \blk00000003/sig0000003f ;
  wire \blk00000003/sig0000003e ;
  wire \blk00000003/sig0000003d ;
  wire \blk00000003/sig0000003c ;
  wire \blk00000003/sig0000003b ;
  wire \blk00000003/sig0000003a ;
  wire \blk00000003/sig00000039 ;
  wire \blk00000003/sig00000038 ;
  wire \blk00000003/sig00000037 ;
  wire \blk00000003/sig00000036 ;
  wire \blk00000003/sig00000035 ;
  wire \blk00000003/sig00000034 ;
  wire \blk00000003/sig00000033 ;
  wire \blk00000003/sig00000002 ;
  wire \blk00000003/sig00000001 ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire \NLW_blk00000003/blk00000037_O_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000016_O_UNCONNECTED ;
  wire \NLW_blk00000003/blk0000000f_O_UNCONNECTED ;
  wire [31 : 0] a_0;
  wire [15 : 0] result_1;
  assign
    a_0[31] = a[31],
    a_0[30] = a[30],
    a_0[29] = a[29],
    a_0[28] = a[28],
    a_0[27] = a[27],
    a_0[26] = a[26],
    a_0[25] = a[25],
    a_0[24] = a[24],
    a_0[23] = a[23],
    a_0[22] = a[22],
    a_0[21] = a[21],
    a_0[20] = a[20],
    a_0[19] = a[19],
    a_0[18] = a[18],
    a_0[17] = a[17],
    a_0[16] = a[16],
    a_0[15] = a[15],
    a_0[14] = a[14],
    a_0[13] = a[13],
    a_0[12] = a[12],
    a_0[11] = a[11],
    a_0[10] = a[10],
    a_0[9] = a[9],
    a_0[8] = a[8],
    a_0[7] = a[7],
    a_0[6] = a[6],
    a_0[5] = a[5],
    a_0[4] = a[4],
    a_0[3] = a[3],
    a_0[2] = a[2],
    a_0[1] = a[1],
    a_0[0] = a[0],
    result[15] = result_1[15],
    result[14] = result_1[14],
    result[13] = result_1[13],
    result[12] = result_1[12],
    result[11] = result_1[11],
    result[10] = result_1[10],
    result[9] = result_1[9],
    result[8] = result_1[8],
    result[7] = result_1[7],
    result[6] = result_1[6],
    result[5] = result_1[5],
    result[4] = result_1[4],
    result[3] = result_1[3],
    result[2] = result_1[2],
    result[1] = result_1[1],
    result[0] = result_1[0];
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
  );
  MUXF7   \blk00000003/blk000000a9  (
    .I0(\blk00000003/sig000000c3 ),
    .I1(\blk00000003/sig000000c2 ),
    .S(a_0[24]),
    .O(\blk00000003/sig000000a2 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk000000a8  (
    .I0(a_0[23]),
    .I1(\blk00000003/sig00000099 ),
    .I2(\blk00000003/sig00000098 ),
    .O(\blk00000003/sig000000c3 )
  );
  LUT5 #(
    .INIT ( 32'hD7D58280 ))
  \blk00000003/blk000000a7  (
    .I0(a_0[23]),
    .I1(a_0[26]),
    .I2(a_0[25]),
    .I3(a_0[19]),
    .I4(\blk00000003/sig00000096 ),
    .O(\blk00000003/sig000000c2 )
  );
  MUXF7   \blk00000003/blk000000a6  (
    .I0(\blk00000003/sig000000c1 ),
    .I1(\blk00000003/sig000000c0 ),
    .S(a_0[24]),
    .O(\blk00000003/sig000000a1 )
  );
  LUT6 #(
    .INIT ( 64'h5551151154501410 ))
  \blk00000003/blk000000a5  (
    .I0(\blk00000003/sig000000ab ),
    .I1(a_0[23]),
    .I2(\blk00000003/sig000000aa ),
    .I3(a_0[18]),
    .I4(a_0[22]),
    .I5(a_0[19]),
    .O(\blk00000003/sig000000c1 )
  );
  LUT4 #(
    .INIT ( 16'hD580 ))
  \blk00000003/blk000000a4  (
    .I0(a_0[23]),
    .I1(a_0[20]),
    .I2(\blk00000003/sig00000090 ),
    .I3(\blk00000003/sig00000098 ),
    .O(\blk00000003/sig000000c0 )
  );
  MUXF7   \blk00000003/blk000000a3  (
    .I0(\blk00000003/sig000000bf ),
    .I1(\blk00000003/sig000000be ),
    .S(a_0[24]),
    .O(\blk00000003/sig000000a0 )
  );
  LUT6 #(
    .INIT ( 64'h5F570A020A020A02 ))
  \blk00000003/blk000000a2  (
    .I0(a_0[23]),
    .I1(a_0[25]),
    .I2(a_0[26]),
    .I3(a_0[19]),
    .I4(\blk00000003/sig00000090 ),
    .I5(a_0[20]),
    .O(\blk00000003/sig000000bf )
  );
  LUT5 #(
    .INIT ( 32'h444E4444 ))
  \blk00000003/blk000000a1  (
    .I0(a_0[23]),
    .I1(\blk00000003/sig00000099 ),
    .I2(a_0[26]),
    .I3(a_0[25]),
    .I4(a_0[21]),
    .O(\blk00000003/sig000000be )
  );
  MUXF7   \blk00000003/blk000000a0  (
    .I0(\blk00000003/sig000000bd ),
    .I1(\blk00000003/sig00000002 ),
    .S(a_0[6]),
    .O(\blk00000003/sig0000008b )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \blk00000003/blk0000009f  (
    .I0(a_0[5]),
    .I1(a_0[4]),
    .I2(a_0[3]),
    .I3(a_0[2]),
    .I4(a_0[1]),
    .I5(a_0[0]),
    .O(\blk00000003/sig000000bd )
  );
  LUT6 #(
    .INIT ( 64'h0743030305410101 ))
  \blk00000003/blk0000009e  (
    .I0(a_0[23]),
    .I1(a_0[25]),
    .I2(a_0[26]),
    .I3(\blk00000003/sig00000089 ),
    .I4(a_0[19]),
    .I5(a_0[22]),
    .O(\blk00000003/sig000000bc )
  );
  LUT6 #(
    .INIT ( 64'h2828002828000000 ))
  \blk00000003/blk0000009d  (
    .I0(a_0[25]),
    .I1(a_0[26]),
    .I2(\blk00000003/sig00000089 ),
    .I3(a_0[23]),
    .I4(a_0[20]),
    .I5(a_0[21]),
    .O(\blk00000003/sig000000bb )
  );
  MUXF7   \blk00000003/blk0000009c  (
    .I0(\blk00000003/sig000000bb ),
    .I1(\blk00000003/sig000000bc ),
    .S(a_0[24]),
    .O(\blk00000003/sig000000a9 )
  );
  LUT6 #(
    .INIT ( 64'h000200AA000A00AA ))
  \blk00000003/blk0000009b  (
    .I0(\blk00000003/sig0000003a ),
    .I1(a_0[23]),
    .I2(a_0[5]),
    .I3(a_0[4]),
    .I4(\blk00000003/sig000000b1 ),
    .I5(a_0[6]),
    .O(\blk00000003/sig000000ba )
  );
  LUT6 #(
    .INIT ( 64'h000222AA000A22AA ))
  \blk00000003/blk0000009a  (
    .I0(\blk00000003/sig0000003e ),
    .I1(a_0[23]),
    .I2(a_0[13]),
    .I3(a_0[12]),
    .I4(\blk00000003/sig000000b1 ),
    .I5(a_0[14]),
    .O(\blk00000003/sig000000b9 )
  );
  MUXF7   \blk00000003/blk00000099  (
    .I0(\blk00000003/sig000000b9 ),
    .I1(\blk00000003/sig000000ba ),
    .S(\blk00000003/sig000000ab ),
    .O(\blk00000003/sig000000b4 )
  );
  LUT5 #(
    .INIT ( 32'h010F030F ))
  \blk00000003/blk00000098  (
    .I0(a_0[23]),
    .I1(a_0[1]),
    .I2(a_0[0]),
    .I3(\blk00000003/sig000000b1 ),
    .I4(a_0[2]),
    .O(\blk00000003/sig000000b8 )
  );
  LUT6 #(
    .INIT ( 64'h000200AA000A00AA ))
  \blk00000003/blk00000097  (
    .I0(\blk00000003/sig0000003c ),
    .I1(a_0[23]),
    .I2(a_0[9]),
    .I3(a_0[8]),
    .I4(\blk00000003/sig000000b1 ),
    .I5(a_0[10]),
    .O(\blk00000003/sig000000b7 )
  );
  MUXF7   \blk00000003/blk00000096  (
    .I0(\blk00000003/sig000000b7 ),
    .I1(\blk00000003/sig000000b8 ),
    .S(\blk00000003/sig000000ab ),
    .O(\blk00000003/sig000000b6 )
  );
  LUT6 #(
    .INIT ( 64'h2222200020202000 ))
  \blk00000003/blk00000095  (
    .I0(a_0[24]),
    .I1(a_0[23]),
    .I2(a_0[26]),
    .I3(\blk00000003/sig0000003a ),
    .I4(a_0[25]),
    .I5(\blk00000003/sig0000003c ),
    .O(\blk00000003/sig000000b5 )
  );
  LUT6 #(
    .INIT ( 64'hAA96AAAAAAA6AAAA ))
  \blk00000003/blk00000094  (
    .I0(a_0[31]),
    .I1(a_0[23]),
    .I2(a_0[24]),
    .I3(a_0[26]),
    .I4(a_0[25]),
    .I5(a_0[22]),
    .O(\blk00000003/sig00000078 )
  );
  LUT4 #(
    .INIT ( 16'h1444 ))
  \blk00000003/blk00000093  (
    .I0(a_0[26]),
    .I1(a_0[25]),
    .I2(a_0[24]),
    .I3(a_0[23]),
    .O(\blk00000003/sig00000090 )
  );
  LUT6 #(
    .INIT ( 64'h9514554481001100 ))
  \blk00000003/blk00000092  (
    .I0(a_0[26]),
    .I1(a_0[25]),
    .I2(a_0[23]),
    .I3(a_0[22]),
    .I4(a_0[24]),
    .I5(a_0[18]),
    .O(\blk00000003/sig00000099 )
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \blk00000003/blk00000091  (
    .I0(a_0[26]),
    .I1(a_0[24]),
    .I2(a_0[23]),
    .I3(a_0[25]),
    .O(\blk00000003/sig000000ab )
  );
  LUT3 #(
    .INIT ( 8'h95 ))
  \blk00000003/blk00000090  (
    .I0(a_0[25]),
    .I1(a_0[24]),
    .I2(a_0[23]),
    .O(\blk00000003/sig000000aa )
  );
  LUT5 #(
    .INIT ( 32'hA9AAAAAA ))
  \blk00000003/blk0000008f  (
    .I0(a_0[31]),
    .I1(a_0[23]),
    .I2(a_0[26]),
    .I3(a_0[25]),
    .I4(a_0[24]),
    .O(\blk00000003/sig0000007b )
  );
  LUT6 #(
    .INIT ( 64'h9514554481001100 ))
  \blk00000003/blk0000008e  (
    .I0(a_0[26]),
    .I1(a_0[25]),
    .I2(a_0[23]),
    .I3(a_0[20]),
    .I4(a_0[24]),
    .I5(a_0[16]),
    .O(\blk00000003/sig00000096 )
  );
  LUT6 #(
    .INIT ( 64'h9514554481001100 ))
  \blk00000003/blk0000008d  (
    .I0(a_0[26]),
    .I1(a_0[25]),
    .I2(a_0[23]),
    .I3(a_0[21]),
    .I4(a_0[24]),
    .I5(a_0[17]),
    .O(\blk00000003/sig00000098 )
  );
  LUT6 #(
    .INIT ( 64'hE7AF66AAE1A560A0 ))
  \blk00000003/blk0000008c  (
    .I0(a_0[25]),
    .I1(a_0[24]),
    .I2(a_0[26]),
    .I3(a_0[23]),
    .I4(a_0[19]),
    .I5(a_0[15]),
    .O(\blk00000003/sig00000097 )
  );
  LUT6 #(
    .INIT ( 64'hF7FDE675B3ECA264 ))
  \blk00000003/blk0000008b  (
    .I0(a_0[26]),
    .I1(a_0[25]),
    .I2(a_0[19]),
    .I3(\blk00000003/sig00000089 ),
    .I4(a_0[15]),
    .I5(a_0[11]),
    .O(\blk00000003/sig000000a5 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFF6FAFFFF9050 ))
  \blk00000003/blk0000008a  (
    .I0(a_0[25]),
    .I1(a_0[23]),
    .I2(\blk00000003/sig000000b4 ),
    .I3(a_0[24]),
    .I4(\blk00000003/sig000000b5 ),
    .I5(\blk00000003/sig000000b6 ),
    .O(\blk00000003/sig00000033 )
  );
  LUT6 #(
    .INIT ( 64'hBDB42D2499900900 ))
  \blk00000003/blk00000089  (
    .I0(a_0[25]),
    .I1(\blk00000003/sig00000089 ),
    .I2(a_0[26]),
    .I3(a_0[12]),
    .I4(a_0[20]),
    .I5(a_0[16]),
    .O(\blk00000003/sig0000009f )
  );
  LUT6 #(
    .INIT ( 64'hBDB42D2499900900 ))
  \blk00000003/blk00000088  (
    .I0(a_0[25]),
    .I1(\blk00000003/sig00000089 ),
    .I2(a_0[26]),
    .I3(a_0[13]),
    .I4(a_0[21]),
    .I5(a_0[17]),
    .O(\blk00000003/sig0000009d )
  );
  LUT6 #(
    .INIT ( 64'hBDB42D2499900900 ))
  \blk00000003/blk00000087  (
    .I0(a_0[25]),
    .I1(\blk00000003/sig00000089 ),
    .I2(a_0[26]),
    .I3(a_0[14]),
    .I4(a_0[22]),
    .I5(a_0[18]),
    .O(\blk00000003/sig0000009b )
  );
  LUT5 #(
    .INIT ( 32'h6AAAAAAA ))
  \blk00000003/blk00000086  (
    .I0(a_0[27]),
    .I1(a_0[24]),
    .I2(a_0[23]),
    .I3(a_0[26]),
    .I4(a_0[25]),
    .O(\blk00000003/sig00000035 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000003/blk00000085  (
    .I0(a_0[26]),
    .I1(a_0[25]),
    .I2(a_0[24]),
    .I3(a_0[23]),
    .O(\blk00000003/sig00000085 )
  );
  LUT5 #(
    .INIT ( 32'hDD98DD90 ))
  \blk00000003/blk00000084  (
    .I0(a_0[24]),
    .I1(a_0[23]),
    .I2(a_0[21]),
    .I3(a_0[20]),
    .I4(a_0[22]),
    .O(\blk00000003/sig000000ae )
  );
  LUT6 #(
    .INIT ( 64'hDD98FFFFDD90FFFF ))
  \blk00000003/blk00000083  (
    .I0(a_0[24]),
    .I1(a_0[23]),
    .I2(a_0[17]),
    .I3(a_0[16]),
    .I4(\blk00000003/sig00000040 ),
    .I5(a_0[18]),
    .O(\blk00000003/sig000000ad )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \blk00000003/blk00000082  (
    .I0(\blk00000003/sig0000008e ),
    .I1(a_0[10]),
    .I2(a_0[11]),
    .I3(a_0[12]),
    .I4(a_0[19]),
    .I5(\blk00000003/sig000000b3 ),
    .O(\blk00000003/sig0000008c )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \blk00000003/blk00000081  (
    .I0(a_0[20]),
    .I1(a_0[21]),
    .I2(a_0[22]),
    .I3(a_0[8]),
    .I4(a_0[9]),
    .O(\blk00000003/sig000000b3 )
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \blk00000003/blk00000080  (
    .I0(a_0[31]),
    .O(\blk00000003/sig0000007e )
  );
  LUT6 #(
    .INIT ( 64'h5444544455555444 ))
  \blk00000003/blk0000007f  (
    .I0(\blk00000003/sig00000092 ),
    .I1(\blk00000003/sig00000091 ),
    .I2(\blk00000003/sig000000a3 ),
    .I3(\blk00000003/sig0000008d ),
    .I4(\blk00000003/sig00000080 ),
    .I5(a_0[31]),
    .O(\blk00000003/sig000000b2 )
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk0000007e  (
    .I0(\blk00000003/sig00000053 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[0])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk0000007d  (
    .I0(\blk00000003/sig00000071 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[10])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk0000007c  (
    .I0(\blk00000003/sig00000074 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[11])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk0000007b  (
    .I0(\blk00000003/sig00000077 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[12])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk0000007a  (
    .I0(\blk00000003/sig0000007a ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[13])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000079  (
    .I0(\blk00000003/sig0000007d ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[14])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000078  (
    .I0(\blk00000003/sig00000056 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[1])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000077  (
    .I0(\blk00000003/sig00000059 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[2])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000076  (
    .I0(\blk00000003/sig0000005c ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[3])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000075  (
    .I0(\blk00000003/sig0000005f ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[4])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000074  (
    .I0(\blk00000003/sig00000062 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[5])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000073  (
    .I0(\blk00000003/sig00000065 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[6])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000072  (
    .I0(\blk00000003/sig00000068 ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[7])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000071  (
    .I0(\blk00000003/sig0000006b ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[8])
  );
  LUT3 #(
    .INIT ( 8'hF2 ))
  \blk00000003/blk00000070  (
    .I0(\blk00000003/sig0000006e ),
    .I1(\blk00000003/sig00000092 ),
    .I2(\blk00000003/sig000000b2 ),
    .O(result_1[9])
  );
  LUT4 #(
    .INIT ( 16'h66A6 ))
  \blk00000003/blk0000006f  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig000000b0 ),
    .I2(\blk00000003/sig00000038 ),
    .I3(\blk00000003/sig000000a8 ),
    .O(\blk00000003/sig0000004f )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000006e  (
    .I0(a_0[0]),
    .I1(a_0[1]),
    .I2(a_0[2]),
    .I3(a_0[3]),
    .O(\blk00000003/sig00000039 )
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \blk00000003/blk0000006d  (
    .I0(a_0[24]),
    .I1(a_0[23]),
    .O(\blk00000003/sig00000089 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000006c  (
    .I0(a_0[4]),
    .I1(a_0[5]),
    .I2(a_0[6]),
    .I3(a_0[7]),
    .O(\blk00000003/sig0000003b )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \blk00000003/blk0000006b  (
    .I0(a_0[24]),
    .I1(a_0[23]),
    .O(\blk00000003/sig000000b1 )
  );
  LUT6 #(
    .INIT ( 64'hD9C8FBEA51407362 ))
  \blk00000003/blk0000006a  (
    .I0(a_0[24]),
    .I1(a_0[23]),
    .I2(\blk00000003/sig000000ac ),
    .I3(\blk00000003/sig000000a7 ),
    .I4(\blk00000003/sig000000af ),
    .I5(\blk00000003/sig000000a5 ),
    .O(\blk00000003/sig000000b0 )
  );
  LUT6 #(
    .INIT ( 64'h028A139B46CE57DF ))
  \blk00000003/blk00000069  (
    .I0(\blk00000003/sig000000ab ),
    .I1(\blk00000003/sig000000aa ),
    .I2(a_0[16]),
    .I3(a_0[20]),
    .I4(a_0[8]),
    .I5(a_0[12]),
    .O(\blk00000003/sig000000af )
  );
  LUT6 #(
    .INIT ( 64'h323E323EF2FE323E ))
  \blk00000003/blk00000068  (
    .I0(\blk00000003/sig00000043 ),
    .I1(\blk00000003/sig000000ab ),
    .I2(\blk00000003/sig000000aa ),
    .I3(\blk00000003/sig000000ad ),
    .I4(\blk00000003/sig00000042 ),
    .I5(\blk00000003/sig000000ae ),
    .O(\blk00000003/sig00000034 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000067  (
    .I0(a_0[8]),
    .I1(a_0[9]),
    .I2(a_0[10]),
    .I3(a_0[11]),
    .O(\blk00000003/sig0000003d )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000066  (
    .I0(a_0[23]),
    .I1(a_0[24]),
    .I2(\blk00000003/sig000000a7 ),
    .I3(\blk00000003/sig000000ac ),
    .I4(\blk00000003/sig000000a5 ),
    .I5(\blk00000003/sig0000009f ),
    .O(\blk00000003/sig000000a8 )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000065  (
    .I0(\blk00000003/sig000000aa ),
    .I1(\blk00000003/sig000000ab ),
    .I2(a_0[13]),
    .I3(a_0[17]),
    .I4(a_0[9]),
    .I5(a_0[21]),
    .O(\blk00000003/sig000000ac )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000064  (
    .I0(\blk00000003/sig000000aa ),
    .I1(\blk00000003/sig000000ab ),
    .I2(a_0[14]),
    .I3(a_0[18]),
    .I4(a_0[10]),
    .I5(a_0[22]),
    .O(\blk00000003/sig000000a7 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000063  (
    .I0(a_0[12]),
    .I1(a_0[13]),
    .I2(a_0[14]),
    .I3(a_0[15]),
    .O(\blk00000003/sig0000003f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000062  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig000000a9 ),
    .O(\blk00000003/sig0000006f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000061  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig000000a8 ),
    .O(\blk00000003/sig00000051 )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000060  (
    .I0(a_0[23]),
    .I1(a_0[24]),
    .I2(\blk00000003/sig000000a5 ),
    .I3(\blk00000003/sig000000a7 ),
    .I4(\blk00000003/sig0000009f ),
    .I5(\blk00000003/sig0000009d ),
    .O(\blk00000003/sig000000a6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000005f  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig000000a6 ),
    .O(\blk00000003/sig00000054 )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk0000005e  (
    .I0(a_0[23]),
    .I1(a_0[24]),
    .I2(\blk00000003/sig0000009f ),
    .I3(\blk00000003/sig000000a5 ),
    .I4(\blk00000003/sig0000009d ),
    .I5(\blk00000003/sig0000009b ),
    .O(\blk00000003/sig000000a4 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000005d  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig000000a4 ),
    .O(\blk00000003/sig00000057 )
  );
  LUT6 #(
    .INIT ( 64'hAAAA9580AAAA8080 ))
  \blk00000003/blk0000005c  (
    .I0(\blk00000003/sig00000092 ),
    .I1(\blk00000003/sig000000a3 ),
    .I2(\blk00000003/sig0000008d ),
    .I3(a_0[31]),
    .I4(\blk00000003/sig00000091 ),
    .I5(\blk00000003/sig00000080 ),
    .O(result_1[15])
  );
  LUT2 #(
    .INIT ( 4'hD ))
  \blk00000003/blk0000005b  (
    .I0(\blk00000003/sig0000008a ),
    .I1(a_0[30]),
    .O(\blk00000003/sig000000a3 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000005a  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig000000a2 ),
    .O(\blk00000003/sig00000066 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000059  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig000000a1 ),
    .O(\blk00000003/sig00000069 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000058  (
    .I0(a_0[16]),
    .I1(a_0[17]),
    .I2(a_0[18]),
    .I3(a_0[19]),
    .O(\blk00000003/sig00000041 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000057  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig000000a0 ),
    .O(\blk00000003/sig0000006c )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000056  (
    .I0(a_0[23]),
    .I1(a_0[24]),
    .I2(\blk00000003/sig0000009d ),
    .I3(\blk00000003/sig0000009f ),
    .I4(\blk00000003/sig0000009b ),
    .I5(\blk00000003/sig00000097 ),
    .O(\blk00000003/sig0000009e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000055  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig0000009e ),
    .O(\blk00000003/sig0000005a )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000054  (
    .I0(a_0[23]),
    .I1(a_0[24]),
    .I2(\blk00000003/sig0000009b ),
    .I3(\blk00000003/sig0000009d ),
    .I4(\blk00000003/sig00000097 ),
    .I5(\blk00000003/sig00000096 ),
    .O(\blk00000003/sig0000009c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000053  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig0000009c ),
    .O(\blk00000003/sig0000005d )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000052  (
    .I0(a_0[23]),
    .I1(a_0[24]),
    .I2(\blk00000003/sig00000097 ),
    .I3(\blk00000003/sig0000009b ),
    .I4(\blk00000003/sig00000096 ),
    .I5(\blk00000003/sig00000098 ),
    .O(\blk00000003/sig0000009a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000051  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig0000009a ),
    .O(\blk00000003/sig00000060 )
  );
  LUT6 #(
    .INIT ( 64'hFDB9ECA875316420 ))
  \blk00000003/blk00000050  (
    .I0(a_0[23]),
    .I1(a_0[24]),
    .I2(\blk00000003/sig00000096 ),
    .I3(\blk00000003/sig00000097 ),
    .I4(\blk00000003/sig00000098 ),
    .I5(\blk00000003/sig00000099 ),
    .O(\blk00000003/sig00000095 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000004f  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig00000095 ),
    .O(\blk00000003/sig00000063 )
  );
  LUT6 #(
    .INIT ( 64'hAAA888A8AA208820 ))
  \blk00000003/blk0000004e  (
    .I0(\blk00000003/sig00000090 ),
    .I1(a_0[23]),
    .I2(a_0[22]),
    .I3(a_0[24]),
    .I4(a_0[20]),
    .I5(a_0[21]),
    .O(\blk00000003/sig00000094 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000004d  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig00000094 ),
    .O(\blk00000003/sig00000072 )
  );
  LUT6 #(
    .INIT ( 64'h00040000000C000C ))
  \blk00000003/blk0000004c  (
    .I0(\blk00000003/sig00000089 ),
    .I1(a_0[30]),
    .I2(\blk00000003/sig0000008f ),
    .I3(\blk00000003/sig0000008d ),
    .I4(a_0[25]),
    .I5(\blk00000003/sig00000093 ),
    .O(\blk00000003/sig00000091 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000004b  (
    .I0(a_0[29]),
    .I1(a_0[28]),
    .I2(a_0[27]),
    .I3(a_0[26]),
    .O(\blk00000003/sig00000093 )
  );
  LUT5 #(
    .INIT ( 32'hFFBA5510 ))
  \blk00000003/blk0000004a  (
    .I0(\blk00000003/sig00000091 ),
    .I1(a_0[30]),
    .I2(\blk00000003/sig0000008a ),
    .I3(\blk00000003/sig0000008f ),
    .I4(a_0[31]),
    .O(\blk00000003/sig00000092 )
  );
  LUT6 #(
    .INIT ( 64'hA6AA6666A6AAA6A6 ))
  \blk00000003/blk00000049  (
    .I0(a_0[31]),
    .I1(\blk00000003/sig00000090 ),
    .I2(a_0[24]),
    .I3(a_0[22]),
    .I4(a_0[23]),
    .I5(a_0[21]),
    .O(\blk00000003/sig00000075 )
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAFAAAAAAA8 ))
  \blk00000003/blk00000048  (
    .I0(\blk00000003/sig00000088 ),
    .I1(a_0[31]),
    .I2(a_0[7]),
    .I3(\blk00000003/sig0000008c ),
    .I4(\blk00000003/sig0000008b ),
    .I5(\blk00000003/sig00000084 ),
    .O(\blk00000003/sig0000008f )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \blk00000003/blk00000047  (
    .I0(a_0[17]),
    .I1(a_0[18]),
    .I2(a_0[15]),
    .I3(a_0[16]),
    .I4(a_0[13]),
    .I5(a_0[14]),
    .O(\blk00000003/sig0000008e )
  );
  LUT5 #(
    .INIT ( 32'hAAAAA8AA ))
  \blk00000003/blk00000046  (
    .I0(\blk00000003/sig00000088 ),
    .I1(\blk00000003/sig0000008b ),
    .I2(\blk00000003/sig0000008c ),
    .I3(\blk00000003/sig00000084 ),
    .I4(a_0[7]),
    .O(\blk00000003/sig0000008d )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000045  (
    .I0(a_0[25]),
    .I1(a_0[26]),
    .I2(a_0[23]),
    .I3(a_0[24]),
    .O(\blk00000003/sig00000081 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \blk00000003/blk00000044  (
    .I0(a_0[27]),
    .I1(a_0[28]),
    .I2(a_0[29]),
    .I3(a_0[30]),
    .O(\blk00000003/sig00000087 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000043  (
    .I0(a_0[30]),
    .I1(a_0[27]),
    .I2(a_0[29]),
    .I3(a_0[28]),
    .O(\blk00000003/sig00000083 )
  );
  LUT6 #(
    .INIT ( 64'h7F777F7FFFFFFFFF ))
  \blk00000003/blk00000042  (
    .I0(a_0[27]),
    .I1(a_0[28]),
    .I2(a_0[26]),
    .I3(\blk00000003/sig00000089 ),
    .I4(a_0[25]),
    .I5(a_0[29]),
    .O(\blk00000003/sig0000008a )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000041  (
    .I0(a_0[0]),
    .I1(a_0[1]),
    .I2(a_0[2]),
    .I3(a_0[3]),
    .O(\blk00000003/sig0000004e )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000040  (
    .I0(a_0[4]),
    .I1(a_0[5]),
    .I2(a_0[6]),
    .I3(a_0[7]),
    .O(\blk00000003/sig0000004d )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000003f  (
    .I0(a_0[8]),
    .I1(a_0[9]),
    .I2(a_0[10]),
    .I3(a_0[11]),
    .O(\blk00000003/sig0000004b )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000003e  (
    .I0(a_0[12]),
    .I1(a_0[13]),
    .I2(a_0[14]),
    .I3(a_0[15]),
    .O(\blk00000003/sig00000049 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk0000003d  (
    .I0(a_0[16]),
    .I1(a_0[17]),
    .I2(a_0[18]),
    .I3(a_0[19]),
    .O(\blk00000003/sig00000047 )
  );
  LUT3 #(
    .INIT ( 8'h01 ))
  \blk00000003/blk0000003c  (
    .I0(a_0[20]),
    .I1(a_0[21]),
    .I2(a_0[22]),
    .O(\blk00000003/sig00000045 )
  );
  MUXCY   \blk00000003/blk0000003b  (
    .CI(\blk00000003/sig00000086 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000087 ),
    .O(\blk00000003/sig00000088 )
  );
  MUXCY   \blk00000003/blk0000003a  (
    .CI(\blk00000003/sig00000002 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig00000086 )
  );
  MUXCY   \blk00000003/blk00000039  (
    .CI(\blk00000003/sig00000082 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000083 ),
    .O(\blk00000003/sig00000084 )
  );
  MUXCY   \blk00000003/blk00000038  (
    .CI(\blk00000003/sig00000002 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000081 ),
    .O(\blk00000003/sig00000082 )
  );
  XORCY   \blk00000003/blk00000037  (
    .CI(\blk00000003/sig0000007f ),
    .LI(\blk00000003/sig00000001 ),
    .O(\NLW_blk00000003/blk00000037_O_UNCONNECTED )
  );
  XORCY   \blk00000003/blk00000036  (
    .CI(\blk00000003/sig0000007c ),
    .LI(\blk00000003/sig0000007e ),
    .O(\blk00000003/sig00000080 )
  );
  MUXCY   \blk00000003/blk00000035  (
    .CI(\blk00000003/sig0000007c ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000007e ),
    .O(\blk00000003/sig0000007f )
  );
  XORCY   \blk00000003/blk00000034  (
    .CI(\blk00000003/sig00000079 ),
    .LI(\blk00000003/sig0000007b ),
    .O(\blk00000003/sig0000007d )
  );
  MUXCY   \blk00000003/blk00000033  (
    .CI(\blk00000003/sig00000079 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000007b ),
    .O(\blk00000003/sig0000007c )
  );
  XORCY   \blk00000003/blk00000032  (
    .CI(\blk00000003/sig00000076 ),
    .LI(\blk00000003/sig00000078 ),
    .O(\blk00000003/sig0000007a )
  );
  MUXCY   \blk00000003/blk00000031  (
    .CI(\blk00000003/sig00000076 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000078 ),
    .O(\blk00000003/sig00000079 )
  );
  XORCY   \blk00000003/blk00000030  (
    .CI(\blk00000003/sig00000073 ),
    .LI(\blk00000003/sig00000075 ),
    .O(\blk00000003/sig00000077 )
  );
  MUXCY   \blk00000003/blk0000002f  (
    .CI(\blk00000003/sig00000073 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000075 ),
    .O(\blk00000003/sig00000076 )
  );
  XORCY   \blk00000003/blk0000002e  (
    .CI(\blk00000003/sig00000070 ),
    .LI(\blk00000003/sig00000072 ),
    .O(\blk00000003/sig00000074 )
  );
  MUXCY   \blk00000003/blk0000002d  (
    .CI(\blk00000003/sig00000070 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000072 ),
    .O(\blk00000003/sig00000073 )
  );
  XORCY   \blk00000003/blk0000002c  (
    .CI(\blk00000003/sig0000006d ),
    .LI(\blk00000003/sig0000006f ),
    .O(\blk00000003/sig00000071 )
  );
  MUXCY   \blk00000003/blk0000002b  (
    .CI(\blk00000003/sig0000006d ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000006f ),
    .O(\blk00000003/sig00000070 )
  );
  XORCY   \blk00000003/blk0000002a  (
    .CI(\blk00000003/sig0000006a ),
    .LI(\blk00000003/sig0000006c ),
    .O(\blk00000003/sig0000006e )
  );
  MUXCY   \blk00000003/blk00000029  (
    .CI(\blk00000003/sig0000006a ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000006c ),
    .O(\blk00000003/sig0000006d )
  );
  XORCY   \blk00000003/blk00000028  (
    .CI(\blk00000003/sig00000067 ),
    .LI(\blk00000003/sig00000069 ),
    .O(\blk00000003/sig0000006b )
  );
  MUXCY   \blk00000003/blk00000027  (
    .CI(\blk00000003/sig00000067 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000069 ),
    .O(\blk00000003/sig0000006a )
  );
  XORCY   \blk00000003/blk00000026  (
    .CI(\blk00000003/sig00000064 ),
    .LI(\blk00000003/sig00000066 ),
    .O(\blk00000003/sig00000068 )
  );
  MUXCY   \blk00000003/blk00000025  (
    .CI(\blk00000003/sig00000064 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000066 ),
    .O(\blk00000003/sig00000067 )
  );
  XORCY   \blk00000003/blk00000024  (
    .CI(\blk00000003/sig00000061 ),
    .LI(\blk00000003/sig00000063 ),
    .O(\blk00000003/sig00000065 )
  );
  MUXCY   \blk00000003/blk00000023  (
    .CI(\blk00000003/sig00000061 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000063 ),
    .O(\blk00000003/sig00000064 )
  );
  XORCY   \blk00000003/blk00000022  (
    .CI(\blk00000003/sig0000005e ),
    .LI(\blk00000003/sig00000060 ),
    .O(\blk00000003/sig00000062 )
  );
  MUXCY   \blk00000003/blk00000021  (
    .CI(\blk00000003/sig0000005e ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000060 ),
    .O(\blk00000003/sig00000061 )
  );
  XORCY   \blk00000003/blk00000020  (
    .CI(\blk00000003/sig0000005b ),
    .LI(\blk00000003/sig0000005d ),
    .O(\blk00000003/sig0000005f )
  );
  MUXCY   \blk00000003/blk0000001f  (
    .CI(\blk00000003/sig0000005b ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000005d ),
    .O(\blk00000003/sig0000005e )
  );
  XORCY   \blk00000003/blk0000001e  (
    .CI(\blk00000003/sig00000058 ),
    .LI(\blk00000003/sig0000005a ),
    .O(\blk00000003/sig0000005c )
  );
  MUXCY   \blk00000003/blk0000001d  (
    .CI(\blk00000003/sig00000058 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000005a ),
    .O(\blk00000003/sig0000005b )
  );
  XORCY   \blk00000003/blk0000001c  (
    .CI(\blk00000003/sig00000055 ),
    .LI(\blk00000003/sig00000057 ),
    .O(\blk00000003/sig00000059 )
  );
  MUXCY   \blk00000003/blk0000001b  (
    .CI(\blk00000003/sig00000055 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000057 ),
    .O(\blk00000003/sig00000058 )
  );
  XORCY   \blk00000003/blk0000001a  (
    .CI(\blk00000003/sig00000052 ),
    .LI(\blk00000003/sig00000054 ),
    .O(\blk00000003/sig00000056 )
  );
  MUXCY   \blk00000003/blk00000019  (
    .CI(\blk00000003/sig00000052 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000054 ),
    .O(\blk00000003/sig00000055 )
  );
  XORCY   \blk00000003/blk00000018  (
    .CI(\blk00000003/sig00000050 ),
    .LI(\blk00000003/sig00000051 ),
    .O(\blk00000003/sig00000053 )
  );
  MUXCY   \blk00000003/blk00000017  (
    .CI(\blk00000003/sig00000050 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000051 ),
    .O(\blk00000003/sig00000052 )
  );
  XORCY   \blk00000003/blk00000016  (
    .CI(\blk00000003/sig00000002 ),
    .LI(\blk00000003/sig0000004f ),
    .O(\NLW_blk00000003/blk00000016_O_UNCONNECTED )
  );
  MUXCY   \blk00000003/blk00000015  (
    .CI(\blk00000003/sig00000002 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000004f ),
    .O(\blk00000003/sig00000050 )
  );
  MUXCY   \blk00000003/blk00000014  (
    .CI(\blk00000003/sig00000002 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000004e ),
    .O(\blk00000003/sig0000004c )
  );
  MUXCY   \blk00000003/blk00000013  (
    .CI(\blk00000003/sig0000004c ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000004d ),
    .O(\blk00000003/sig0000004a )
  );
  MUXCY   \blk00000003/blk00000012  (
    .CI(\blk00000003/sig0000004a ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000004b ),
    .O(\blk00000003/sig00000048 )
  );
  MUXCY   \blk00000003/blk00000011  (
    .CI(\blk00000003/sig00000048 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000049 ),
    .O(\blk00000003/sig00000046 )
  );
  MUXCY   \blk00000003/blk00000010  (
    .CI(\blk00000003/sig00000046 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig00000044 )
  );
  MUXCY   \blk00000003/blk0000000f  (
    .CI(\blk00000003/sig00000044 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000045 ),
    .O(\NLW_blk00000003/blk0000000f_O_UNCONNECTED )
  );
  MUXCY   \blk00000003/blk0000000e  (
    .CI(\blk00000003/sig00000042 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000043 )
  );
  MUXCY   \blk00000003/blk0000000d  (
    .CI(\blk00000003/sig00000040 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000041 ),
    .O(\blk00000003/sig00000042 )
  );
  MUXCY   \blk00000003/blk0000000c  (
    .CI(\blk00000003/sig0000003e ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000003f ),
    .O(\blk00000003/sig00000040 )
  );
  MUXCY   \blk00000003/blk0000000b  (
    .CI(\blk00000003/sig0000003c ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000003d ),
    .O(\blk00000003/sig0000003e )
  );
  MUXCY   \blk00000003/blk0000000a  (
    .CI(\blk00000003/sig0000003a ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000003b ),
    .O(\blk00000003/sig0000003c )
  );
  MUXCY   \blk00000003/blk00000009  (
    .CI(\blk00000003/sig00000002 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000039 ),
    .O(\blk00000003/sig0000003a )
  );
  MUXF8   \blk00000003/blk00000008  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000037 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000038 )
  );
  MUXF7   \blk00000003/blk00000007  (
    .I0(\blk00000003/sig00000002 ),
    .I1(\blk00000003/sig00000002 ),
    .S(\blk00000003/sig00000035 ),
    .O(\blk00000003/sig00000037 )
  );
  MUXF7   \blk00000003/blk00000006  (
    .I0(\blk00000003/sig00000033 ),
    .I1(\blk00000003/sig00000034 ),
    .S(\blk00000003/sig00000035 ),
    .O(\blk00000003/sig00000036 )
  );
  VCC   \blk00000003/blk00000005  (
    .P(\blk00000003/sig00000002 )
  );
  GND   \blk00000003/blk00000004  (
    .G(\blk00000003/sig00000001 )
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
