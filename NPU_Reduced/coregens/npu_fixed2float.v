////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.40d
//  \   \         Application: netgen
//  /   /         Filename: npu_fixed2float.v
// /___/   /\     Timestamp: Tue Mar 18 19:30:52 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_fixed2float.ngc C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_fixed2float.v 
// Device	: 5vlx110tff1136-1
// Input file	: C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_fixed2float.ngc
// Output file	: C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_fixed2float.v
// # of Modules	: 1
// Design Name	: npu_fixed2float
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

module npu_fixed2float (
a, result
)/* synthesis syn_black_box syn_noprune=1 */;
  input [15 : 0] a;
  output [31 : 0] result;
  
  // synthesis translate_off
  
  wire \blk00000003/sig000000cc ;
  wire \blk00000003/sig000000cb ;
  wire \blk00000003/sig000000ca ;
  wire \blk00000003/sig000000c9 ;
  wire \blk00000003/sig000000c8 ;
  wire \blk00000003/sig000000c7 ;
  wire \blk00000003/sig000000c6 ;
  wire \blk00000003/sig000000c5 ;
  wire \blk00000003/sig000000c4 ;
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
  wire \blk00000003/sig00000032 ;
  wire \blk00000003/sig00000031 ;
  wire \blk00000003/sig00000030 ;
  wire \blk00000003/sig00000002 ;
  wire \blk00000003/sig00000001 ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire \NLW_blk00000003/blk0000000c_O_UNCONNECTED ;
  wire [15 : 15] NlwRenamedSignal_a;
  wire [14 : 0] a_0;
  wire [27 : 27] NlwRenamedSignal_result;
  assign
    NlwRenamedSignal_a[15] = a[15],
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
    result[31] = NlwRenamedSignal_a[15],
    result[29] = NlwRenamedSignal_result[27],
    result[28] = NlwRenamedSignal_result[27],
    result[27] = NlwRenamedSignal_result[27];
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
  );
  LUT5 #(
    .INIT ( 32'h4540EFEA ))
  \blk00000003/blk000000c0  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig00000084 ),
    .I2(\blk00000003/sig00000030 ),
    .I3(\blk00000003/sig00000090 ),
    .I4(\blk00000003/sig000000c3 ),
    .O(\blk00000003/sig000000cc )
  );
  LUT5 #(
    .INIT ( 32'h4540EFEA ))
  \blk00000003/blk000000bf  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig0000009c ),
    .I2(\blk00000003/sig00000034 ),
    .I3(\blk00000003/sig000000a8 ),
    .I4(\blk00000003/sig000000c3 ),
    .O(\blk00000003/sig000000cb )
  );
  MUXF7   \blk00000003/blk000000be  (
    .I0(\blk00000003/sig000000cb ),
    .I1(\blk00000003/sig000000cc ),
    .S(\blk00000003/sig00000036 ),
    .O(\blk00000003/sig000000c2 )
  );
  LUT4 #(
    .INIT ( 16'h143C ))
  \blk00000003/blk000000bd  (
    .I0(\blk00000003/sig00000032 ),
    .I1(\blk00000003/sig00000062 ),
    .I2(\blk00000003/sig0000003d ),
    .I3(\blk00000003/sig00000036 ),
    .O(result[23])
  );
  LUT6 #(
    .INIT ( 64'h4444444444444440 ))
  \blk00000003/blk000000bc  (
    .I0(\blk00000003/sig00000032 ),
    .I1(\blk00000003/sig00000036 ),
    .I2(\blk00000003/sig00000030 ),
    .I3(\blk00000003/sig0000003a ),
    .I4(\blk00000003/sig0000003d ),
    .I5(\blk00000003/sig00000062 ),
    .O(NlwRenamedSignal_result[27])
  );
  LUT6 #(
    .INIT ( 64'h5555555555555557 ))
  \blk00000003/blk000000bb  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000032 ),
    .I2(\blk00000003/sig0000003a ),
    .I3(\blk00000003/sig0000003d ),
    .I4(\blk00000003/sig00000062 ),
    .I5(\blk00000003/sig00000030 ),
    .O(result[30])
  );
  LUT5 #(
    .INIT ( 32'h050F143C ))
  \blk00000003/blk000000ba  (
    .I0(\blk00000003/sig00000032 ),
    .I1(\blk00000003/sig0000003d ),
    .I2(\blk00000003/sig0000003a ),
    .I3(\blk00000003/sig00000036 ),
    .I4(\blk00000003/sig00000062 ),
    .O(result[24])
  );
  LUT6 #(
    .INIT ( 64'h2222222222222225 ))
  \blk00000003/blk000000b9  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000032 ),
    .I2(\blk00000003/sig000000be ),
    .I3(\blk00000003/sig0000003d ),
    .I4(\blk00000003/sig0000003a ),
    .I5(\blk00000003/sig00000062 ),
    .O(result[26])
  );
  LUT6 #(
    .INIT ( 64'h0405545500015051 ))
  \blk00000003/blk000000b8  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000003d ),
    .I2(\blk00000003/sig0000003a ),
    .I3(\blk00000003/sig000000ca ),
    .I4(\blk00000003/sig000000c9 ),
    .I5(\blk00000003/sig000000b8 ),
    .O(\blk00000003/sig00000044 )
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  \blk00000003/blk000000b7  (
    .I0(\blk00000003/sig00000034 ),
    .I1(\blk00000003/sig00000084 ),
    .I2(\blk00000003/sig00000090 ),
    .O(\blk00000003/sig000000ca )
  );
  LUT5 #(
    .INIT ( 32'hFEF410B0 ))
  \blk00000003/blk000000b6  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000034 ),
    .I2(\blk00000003/sig0000008d ),
    .I3(\blk00000003/sig00000030 ),
    .I4(\blk00000003/sig00000081 ),
    .O(\blk00000003/sig000000b8 )
  );
  LUT5 #(
    .INIT ( 32'hFEF410B0 ))
  \blk00000003/blk000000b5  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000034 ),
    .I2(\blk00000003/sig00000093 ),
    .I3(\blk00000003/sig00000030 ),
    .I4(\blk00000003/sig00000087 ),
    .O(\blk00000003/sig000000b5 )
  );
  LUT6 #(
    .INIT ( 64'hFFF11F11FFFBBFBB ))
  \blk00000003/blk000000b4  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig0000008a ),
    .I2(\blk00000003/sig00000036 ),
    .I3(\blk00000003/sig00000034 ),
    .I4(\blk00000003/sig00000030 ),
    .I5(\blk00000003/sig00000087 ),
    .O(\blk00000003/sig000000c9 )
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000b3  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000061 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[22])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000b2  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000005e ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[21])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000b1  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000005b ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[20])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000b0  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000058 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[19])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000af  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000055 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[18])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000ae  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000052 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[17])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000ad  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000004f ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[16])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000ac  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000004c ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[15])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000ab  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000049 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[14])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000aa  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000046 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[13])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a9  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000043 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[12])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a8  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000007e ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[11])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a7  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000007c ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[10])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a6  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000079 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[9])
  );
  LUT3 #(
    .INIT ( 8'h13 ))
  \blk00000003/blk000000a5  (
    .I0(\blk00000003/sig00000032 ),
    .I1(\blk00000003/sig0000003d ),
    .I2(\blk00000003/sig00000036 ),
    .O(\blk00000003/sig000000c8 )
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a4  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000076 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[8])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a3  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000065 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[0])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a2  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000067 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[1])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a1  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000069 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[2])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk000000a0  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000006b ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[3])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk0000009f  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000006d ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[4])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk0000009e  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000006f ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[5])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk0000009d  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000071 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[6])
  );
  LUT3 #(
    .INIT ( 8'h4C ))
  \blk00000003/blk0000009c  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000073 ),
    .I2(\blk00000003/sig00000032 ),
    .O(result[7])
  );
  LUT6 #(
    .INIT ( 64'h888DAAAFD8DDFAFF ))
  \blk00000003/blk0000009b  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000030 ),
    .I2(\blk00000003/sig00000034 ),
    .I3(\blk00000003/sig000000a2 ),
    .I4(\blk00000003/sig0000008a ),
    .I5(\blk00000003/sig00000096 ),
    .O(\blk00000003/sig000000c3 )
  );
  LUT6 #(
    .INIT ( 64'h7575207575202020 ))
  \blk00000003/blk0000009a  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000030 ),
    .I2(\blk00000003/sig00000084 ),
    .I3(\blk00000003/sig00000034 ),
    .I4(\blk00000003/sig00000090 ),
    .I5(\blk00000003/sig0000009c ),
    .O(\blk00000003/sig000000b1 )
  );
  LUT6 #(
    .INIT ( 64'h7575207575202020 ))
  \blk00000003/blk00000099  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000030 ),
    .I2(\blk00000003/sig00000081 ),
    .I3(\blk00000003/sig00000034 ),
    .I4(\blk00000003/sig0000008d ),
    .I5(\blk00000003/sig00000099 ),
    .O(\blk00000003/sig000000b3 )
  );
  LUT6 #(
    .INIT ( 64'h7575207575202020 ))
  \blk00000003/blk00000098  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000030 ),
    .I2(\blk00000003/sig00000087 ),
    .I3(\blk00000003/sig00000034 ),
    .I4(\blk00000003/sig00000093 ),
    .I5(\blk00000003/sig0000009f ),
    .O(\blk00000003/sig000000b2 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \blk00000003/blk00000097  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig000000ab ),
    .I2(\blk00000003/sig00000034 ),
    .I3(\blk00000003/sig0000009f ),
    .I4(\blk00000003/sig000000b5 ),
    .O(\blk00000003/sig000000c5 )
  );
  LUT6 #(
    .INIT ( 64'h0505050105051541 ))
  \blk00000003/blk00000096  (
    .I0(\blk00000003/sig000000af ),
    .I1(\blk00000003/sig000000c8 ),
    .I2(\blk00000003/sig000000be ),
    .I3(\blk00000003/sig00000062 ),
    .I4(\blk00000003/sig0000003a ),
    .I5(\blk00000003/sig0000003d ),
    .O(result[25])
  );
  LUT4 #(
    .INIT ( 16'hFF27 ))
  \blk00000003/blk00000095  (
    .I0(\blk00000003/sig00000034 ),
    .I1(\blk00000003/sig00000081 ),
    .I2(\blk00000003/sig0000008d ),
    .I3(\blk00000003/sig00000036 ),
    .O(\blk00000003/sig000000c4 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \blk00000003/blk00000094  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig000000a5 ),
    .I2(\blk00000003/sig00000034 ),
    .I3(\blk00000003/sig00000099 ),
    .I4(\blk00000003/sig000000b8 ),
    .O(\blk00000003/sig000000c1 )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \blk00000003/blk00000093  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000081 ),
    .I2(\blk00000003/sig00000034 ),
    .O(\blk00000003/sig000000ba )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \blk00000003/blk00000092  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000084 ),
    .I2(\blk00000003/sig00000034 ),
    .O(\blk00000003/sig000000b9 )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \blk00000003/blk00000091  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000087 ),
    .I2(\blk00000003/sig00000034 ),
    .O(\blk00000003/sig000000bc )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \blk00000003/blk00000090  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig0000008a ),
    .I2(\blk00000003/sig00000034 ),
    .O(\blk00000003/sig000000bb )
  );
  LUT6 #(
    .INIT ( 64'h7775557522200020 ))
  \blk00000003/blk0000008f  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig00000036 ),
    .I2(\blk00000003/sig00000090 ),
    .I3(\blk00000003/sig00000034 ),
    .I4(\blk00000003/sig00000084 ),
    .I5(\blk00000003/sig000000b0 ),
    .O(\blk00000003/sig000000b7 )
  );
  LUT4 #(
    .INIT ( 16'h5410 ))
  \blk00000003/blk0000008e  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000034 ),
    .I2(\blk00000003/sig00000096 ),
    .I3(\blk00000003/sig0000008a ),
    .O(\blk00000003/sig000000b0 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \blk00000003/blk0000008d  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000034 ),
    .O(\blk00000003/sig000000b6 )
  );
  LUT5 #(
    .INIT ( 32'h00000004 ))
  \blk00000003/blk0000008c  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig00000081 ),
    .I2(\blk00000003/sig0000003a ),
    .I3(\blk00000003/sig00000036 ),
    .I4(\blk00000003/sig00000034 ),
    .O(\blk00000003/sig00000074 )
  );
  LUT6 #(
    .INIT ( 64'h0101010000010000 ))
  \blk00000003/blk0000008b  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig00000036 ),
    .I2(\blk00000003/sig00000034 ),
    .I3(\blk00000003/sig0000003d ),
    .I4(\blk00000003/sig00000084 ),
    .I5(\blk00000003/sig00000081 ),
    .O(\blk00000003/sig00000077 )
  );
  LUT6 #(
    .INIT ( 64'h0101ABAB0100ABAA ))
  \blk00000003/blk0000008a  (
    .I0(\blk00000003/sig00000034 ),
    .I1(\blk00000003/sig000000ab ),
    .I2(\blk00000003/sig000000ac ),
    .I3(\blk00000003/sig000000a8 ),
    .I4(\blk00000003/sig000000c7 ),
    .I5(\blk00000003/sig000000a5 ),
    .O(\blk00000003/sig00000038 )
  );
  LUT4 #(
    .INIT ( 16'hFFAB ))
  \blk00000003/blk00000089  (
    .I0(\blk00000003/sig000000a2 ),
    .I1(\blk00000003/sig0000009c ),
    .I2(\blk00000003/sig00000099 ),
    .I3(\blk00000003/sig0000009f ),
    .O(\blk00000003/sig000000c7 )
  );
  LUT6 #(
    .INIT ( 64'h0101ABAB0100ABAA ))
  \blk00000003/blk00000088  (
    .I0(\blk00000003/sig00000030 ),
    .I1(\blk00000003/sig00000093 ),
    .I2(\blk00000003/sig00000096 ),
    .I3(\blk00000003/sig00000090 ),
    .I4(\blk00000003/sig000000c6 ),
    .I5(\blk00000003/sig0000008d ),
    .O(\blk00000003/sig00000039 )
  );
  LUT4 #(
    .INIT ( 16'hFFAB ))
  \blk00000003/blk00000087  (
    .I0(\blk00000003/sig0000008a ),
    .I1(\blk00000003/sig00000084 ),
    .I2(\blk00000003/sig00000081 ),
    .I3(\blk00000003/sig00000087 ),
    .O(\blk00000003/sig000000c6 )
  );
  LUT5 #(
    .INIT ( 32'hFEAE5404 ))
  \blk00000003/blk00000086  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig000000c5 ),
    .I2(\blk00000003/sig0000003a ),
    .I3(\blk00000003/sig000000c1 ),
    .I4(\blk00000003/sig000000c2 ),
    .O(\blk00000003/sig0000005f )
  );
  LUT6 #(
    .INIT ( 64'h028A139B46CE57DF ))
  \blk00000003/blk00000085  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig0000003d ),
    .I2(\blk00000003/sig000000bc ),
    .I3(\blk00000003/sig000000b9 ),
    .I4(\blk00000003/sig000000c4 ),
    .I5(\blk00000003/sig000000bb ),
    .O(\blk00000003/sig00000041 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000084  (
    .I0(\blk00000003/sig000000ac ),
    .I1(\blk00000003/sig000000ab ),
    .I2(\blk00000003/sig000000a8 ),
    .I3(\blk00000003/sig000000a5 ),
    .O(\blk00000003/sig00000037 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000083  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[0]),
    .O(\blk00000003/sig0000007f )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000082  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[1]),
    .O(\blk00000003/sig00000082 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000081  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[2]),
    .O(\blk00000003/sig00000085 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000080  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[3]),
    .O(\blk00000003/sig00000088 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000007f  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[4]),
    .O(\blk00000003/sig0000008b )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000007e  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[5]),
    .O(\blk00000003/sig0000008e )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000007d  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[6]),
    .O(\blk00000003/sig00000091 )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \blk00000003/blk0000007c  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000034 ),
    .I2(\blk00000003/sig00000030 ),
    .O(\blk00000003/sig000000be )
  );
  LUT6 #(
    .INIT ( 64'hF838C808FB3BCB0B ))
  \blk00000003/blk0000007b  (
    .I0(\blk00000003/sig000000b1 ),
    .I1(\blk00000003/sig0000003a ),
    .I2(\blk00000003/sig0000003d ),
    .I3(\blk00000003/sig000000b3 ),
    .I4(\blk00000003/sig000000b2 ),
    .I5(\blk00000003/sig000000c3 ),
    .O(\blk00000003/sig00000056 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000007a  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[7]),
    .O(\blk00000003/sig00000094 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000079  (
    .I0(\blk00000003/sig00000096 ),
    .I1(\blk00000003/sig00000093 ),
    .I2(\blk00000003/sig00000090 ),
    .I3(\blk00000003/sig0000008d ),
    .O(\blk00000003/sig00000033 )
  );
  LUT6 #(
    .INIT ( 64'hB9A8FDEC31207564 ))
  \blk00000003/blk00000078  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig0000003d ),
    .I2(\blk00000003/sig000000b2 ),
    .I3(\blk00000003/sig000000c1 ),
    .I4(\blk00000003/sig000000c3 ),
    .I5(\blk00000003/sig000000b1 ),
    .O(\blk00000003/sig00000059 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000077  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[8]),
    .O(\blk00000003/sig00000097 )
  );
  LUT5 #(
    .INIT ( 32'hF7D5A280 ))
  \blk00000003/blk00000076  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig0000003a ),
    .I2(\blk00000003/sig000000b2 ),
    .I3(\blk00000003/sig000000c1 ),
    .I4(\blk00000003/sig000000c2 ),
    .O(\blk00000003/sig0000005c )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000075  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[9]),
    .O(\blk00000003/sig0000009a )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000074  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[10]),
    .O(\blk00000003/sig0000009d )
  );
  LUT6 #(
    .INIT ( 64'h11110100BBBBABAA ))
  \blk00000003/blk00000073  (
    .I0(\blk00000003/sig00000034 ),
    .I1(\blk00000003/sig000000ac ),
    .I2(\blk00000003/sig000000a8 ),
    .I3(\blk00000003/sig000000a5 ),
    .I4(\blk00000003/sig000000ab ),
    .I5(\blk00000003/sig000000c0 ),
    .O(\blk00000003/sig0000003b )
  );
  LUT4 #(
    .INIT ( 16'hFF45 ))
  \blk00000003/blk00000072  (
    .I0(\blk00000003/sig0000009f ),
    .I1(\blk00000003/sig0000009c ),
    .I2(\blk00000003/sig00000099 ),
    .I3(\blk00000003/sig000000a2 ),
    .O(\blk00000003/sig000000c0 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk00000071  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[11]),
    .O(\blk00000003/sig000000a0 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000070  (
    .I0(\blk00000003/sig000000a2 ),
    .I1(\blk00000003/sig0000009f ),
    .I2(\blk00000003/sig0000009c ),
    .I3(\blk00000003/sig00000099 ),
    .O(\blk00000003/sig00000035 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000006f  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[12]),
    .O(\blk00000003/sig000000a3 )
  );
  LUT6 #(
    .INIT ( 64'h0302333200023032 ))
  \blk00000003/blk0000006e  (
    .I0(\blk00000003/sig000000b5 ),
    .I1(\blk00000003/sig00000036 ),
    .I2(\blk00000003/sig0000003d ),
    .I3(\blk00000003/sig0000003a ),
    .I4(\blk00000003/sig000000bf ),
    .I5(\blk00000003/sig000000b8 ),
    .O(\blk00000003/sig00000047 )
  );
  LUT5 #(
    .INIT ( 32'hA2A7F2F7 ))
  \blk00000003/blk0000006d  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig0000008a ),
    .I2(\blk00000003/sig000000be ),
    .I3(\blk00000003/sig00000090 ),
    .I4(\blk00000003/sig00000084 ),
    .O(\blk00000003/sig000000bf )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000006c  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[13]),
    .O(\blk00000003/sig000000a6 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \blk00000003/blk0000006b  (
    .I0(NlwRenamedSignal_a[15]),
    .I1(a_0[14]),
    .O(\blk00000003/sig000000a9 )
  );
  LUT6 #(
    .INIT ( 64'h11110100BBBBABAA ))
  \blk00000003/blk0000006a  (
    .I0(\blk00000003/sig00000030 ),
    .I1(\blk00000003/sig00000096 ),
    .I2(\blk00000003/sig00000090 ),
    .I3(\blk00000003/sig0000008d ),
    .I4(\blk00000003/sig00000093 ),
    .I5(\blk00000003/sig000000bd ),
    .O(\blk00000003/sig0000003c )
  );
  LUT4 #(
    .INIT ( 16'hFF45 ))
  \blk00000003/blk00000069  (
    .I0(\blk00000003/sig00000087 ),
    .I1(\blk00000003/sig00000084 ),
    .I2(\blk00000003/sig00000081 ),
    .I3(\blk00000003/sig0000008a ),
    .O(\blk00000003/sig000000bd )
  );
  LUT6 #(
    .INIT ( 64'h028A139B46CE57DF ))
  \blk00000003/blk00000068  (
    .I0(\blk00000003/sig0000003a ),
    .I1(\blk00000003/sig0000003d ),
    .I2(\blk00000003/sig000000b9 ),
    .I3(\blk00000003/sig000000ba ),
    .I4(\blk00000003/sig000000bb ),
    .I5(\blk00000003/sig000000bc ),
    .O(\blk00000003/sig0000007d )
  );
  LUT6 #(
    .INIT ( 64'h7775557522200020 ))
  \blk00000003/blk00000067  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig00000036 ),
    .I2(\blk00000003/sig000000b5 ),
    .I3(\blk00000003/sig0000003a ),
    .I4(\blk00000003/sig000000b8 ),
    .I5(\blk00000003/sig000000b7 ),
    .O(\blk00000003/sig0000004a )
  );
  LUT6 #(
    .INIT ( 64'hAEAEFEAE04045404 ))
  \blk00000003/blk00000066  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig000000b3 ),
    .I2(\blk00000003/sig0000003a ),
    .I3(\blk00000003/sig000000b5 ),
    .I4(\blk00000003/sig00000036 ),
    .I5(\blk00000003/sig000000b7 ),
    .O(\blk00000003/sig0000004d )
  );
  LUT6 #(
    .INIT ( 64'h0703060205010400 ))
  \blk00000003/blk00000065  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig0000003a ),
    .I2(\blk00000003/sig000000b6 ),
    .I3(\blk00000003/sig00000081 ),
    .I4(\blk00000003/sig00000087 ),
    .I5(\blk00000003/sig00000084 ),
    .O(\blk00000003/sig0000007a )
  );
  LUT6 #(
    .INIT ( 64'h0808C8083B3BFB3B ))
  \blk00000003/blk00000064  (
    .I0(\blk00000003/sig000000b0 ),
    .I1(\blk00000003/sig0000003a ),
    .I2(\blk00000003/sig0000003d ),
    .I3(\blk00000003/sig000000b5 ),
    .I4(\blk00000003/sig00000036 ),
    .I5(\blk00000003/sig000000b4 ),
    .O(\blk00000003/sig00000050 )
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  \blk00000003/blk00000063  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig000000b3 ),
    .I2(\blk00000003/sig000000b1 ),
    .O(\blk00000003/sig000000b4 )
  );
  LUT6 #(
    .INIT ( 64'hDFD5DAD08F858A80 ))
  \blk00000003/blk00000062  (
    .I0(\blk00000003/sig0000003d ),
    .I1(\blk00000003/sig000000b0 ),
    .I2(\blk00000003/sig0000003a ),
    .I3(\blk00000003/sig000000b1 ),
    .I4(\blk00000003/sig000000b2 ),
    .I5(\blk00000003/sig000000b3 ),
    .O(\blk00000003/sig00000053 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000003/blk00000061  (
    .I0(\blk00000003/sig00000036 ),
    .I1(\blk00000003/sig00000032 ),
    .O(\blk00000003/sig000000af )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \blk00000003/blk00000060  (
    .I0(\blk00000003/sig0000008a ),
    .I1(\blk00000003/sig00000087 ),
    .I2(\blk00000003/sig00000084 ),
    .I3(\blk00000003/sig00000081 ),
    .O(\blk00000003/sig00000031 )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000003/blk0000005f  (
    .I0(\blk00000003/sig00000034 ),
    .I1(\blk00000003/sig00000036 ),
    .O(\blk00000003/sig0000003e )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \blk00000003/blk0000005e  (
    .I0(\blk00000003/sig00000030 ),
    .I1(\blk00000003/sig00000032 ),
    .O(\blk00000003/sig0000003f )
  );
  MUXCY   \blk00000003/blk0000005d  (
    .CI(\blk00000003/sig000000ae ),
    .DI(\blk00000003/sig00000002 ),
    .S(\blk00000003/sig00000002 ),
    .O(\blk00000003/sig00000063 )
  );
  MUXCY   \blk00000003/blk0000005c  (
    .CI(\blk00000003/sig000000ad ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig000000ae )
  );
  MUXCY   \blk00000003/blk0000005b  (
    .CI(\blk00000003/sig00000002 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig000000ad )
  );
  XORCY   \blk00000003/blk0000005a  (
    .CI(\blk00000003/sig000000aa ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig000000ac )
  );
  XORCY   \blk00000003/blk00000059  (
    .CI(\blk00000003/sig000000a7 ),
    .LI(\blk00000003/sig000000a9 ),
    .O(\blk00000003/sig000000ab )
  );
  MUXCY   \blk00000003/blk00000058  (
    .CI(\blk00000003/sig000000a7 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig000000a9 ),
    .O(\blk00000003/sig000000aa )
  );
  XORCY   \blk00000003/blk00000057  (
    .CI(\blk00000003/sig000000a4 ),
    .LI(\blk00000003/sig000000a6 ),
    .O(\blk00000003/sig000000a8 )
  );
  MUXCY   \blk00000003/blk00000056  (
    .CI(\blk00000003/sig000000a4 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig000000a6 ),
    .O(\blk00000003/sig000000a7 )
  );
  XORCY   \blk00000003/blk00000055  (
    .CI(\blk00000003/sig000000a1 ),
    .LI(\blk00000003/sig000000a3 ),
    .O(\blk00000003/sig000000a5 )
  );
  MUXCY   \blk00000003/blk00000054  (
    .CI(\blk00000003/sig000000a1 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig000000a3 ),
    .O(\blk00000003/sig000000a4 )
  );
  XORCY   \blk00000003/blk00000053  (
    .CI(\blk00000003/sig0000009e ),
    .LI(\blk00000003/sig000000a0 ),
    .O(\blk00000003/sig000000a2 )
  );
  MUXCY   \blk00000003/blk00000052  (
    .CI(\blk00000003/sig0000009e ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig000000a0 ),
    .O(\blk00000003/sig000000a1 )
  );
  XORCY   \blk00000003/blk00000051  (
    .CI(\blk00000003/sig0000009b ),
    .LI(\blk00000003/sig0000009d ),
    .O(\blk00000003/sig0000009f )
  );
  MUXCY   \blk00000003/blk00000050  (
    .CI(\blk00000003/sig0000009b ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000009d ),
    .O(\blk00000003/sig0000009e )
  );
  XORCY   \blk00000003/blk0000004f  (
    .CI(\blk00000003/sig00000098 ),
    .LI(\blk00000003/sig0000009a ),
    .O(\blk00000003/sig0000009c )
  );
  MUXCY   \blk00000003/blk0000004e  (
    .CI(\blk00000003/sig00000098 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000009a ),
    .O(\blk00000003/sig0000009b )
  );
  XORCY   \blk00000003/blk0000004d  (
    .CI(\blk00000003/sig00000095 ),
    .LI(\blk00000003/sig00000097 ),
    .O(\blk00000003/sig00000099 )
  );
  MUXCY   \blk00000003/blk0000004c  (
    .CI(\blk00000003/sig00000095 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000097 ),
    .O(\blk00000003/sig00000098 )
  );
  XORCY   \blk00000003/blk0000004b  (
    .CI(\blk00000003/sig00000092 ),
    .LI(\blk00000003/sig00000094 ),
    .O(\blk00000003/sig00000096 )
  );
  MUXCY   \blk00000003/blk0000004a  (
    .CI(\blk00000003/sig00000092 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000094 ),
    .O(\blk00000003/sig00000095 )
  );
  XORCY   \blk00000003/blk00000049  (
    .CI(\blk00000003/sig0000008f ),
    .LI(\blk00000003/sig00000091 ),
    .O(\blk00000003/sig00000093 )
  );
  MUXCY   \blk00000003/blk00000048  (
    .CI(\blk00000003/sig0000008f ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000091 ),
    .O(\blk00000003/sig00000092 )
  );
  XORCY   \blk00000003/blk00000047  (
    .CI(\blk00000003/sig0000008c ),
    .LI(\blk00000003/sig0000008e ),
    .O(\blk00000003/sig00000090 )
  );
  MUXCY   \blk00000003/blk00000046  (
    .CI(\blk00000003/sig0000008c ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000008e ),
    .O(\blk00000003/sig0000008f )
  );
  XORCY   \blk00000003/blk00000045  (
    .CI(\blk00000003/sig00000089 ),
    .LI(\blk00000003/sig0000008b ),
    .O(\blk00000003/sig0000008d )
  );
  MUXCY   \blk00000003/blk00000044  (
    .CI(\blk00000003/sig00000089 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000008b ),
    .O(\blk00000003/sig0000008c )
  );
  XORCY   \blk00000003/blk00000043  (
    .CI(\blk00000003/sig00000086 ),
    .LI(\blk00000003/sig00000088 ),
    .O(\blk00000003/sig0000008a )
  );
  MUXCY   \blk00000003/blk00000042  (
    .CI(\blk00000003/sig00000086 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000088 ),
    .O(\blk00000003/sig00000089 )
  );
  XORCY   \blk00000003/blk00000041  (
    .CI(\blk00000003/sig00000083 ),
    .LI(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig00000087 )
  );
  MUXCY   \blk00000003/blk00000040  (
    .CI(\blk00000003/sig00000083 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000085 ),
    .O(\blk00000003/sig00000086 )
  );
  XORCY   \blk00000003/blk0000003f  (
    .CI(\blk00000003/sig00000080 ),
    .LI(\blk00000003/sig00000082 ),
    .O(\blk00000003/sig00000084 )
  );
  MUXCY   \blk00000003/blk0000003e  (
    .CI(\blk00000003/sig00000080 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000082 ),
    .O(\blk00000003/sig00000083 )
  );
  XORCY   \blk00000003/blk0000003d  (
    .CI(NlwRenamedSignal_a[15]),
    .LI(\blk00000003/sig0000007f ),
    .O(\blk00000003/sig00000081 )
  );
  MUXCY   \blk00000003/blk0000003c  (
    .CI(NlwRenamedSignal_a[15]),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000007f ),
    .O(\blk00000003/sig00000080 )
  );
  XORCY   \blk00000003/blk0000003b  (
    .CI(\blk00000003/sig0000007b ),
    .LI(\blk00000003/sig0000007d ),
    .O(\blk00000003/sig0000007e )
  );
  MUXCY   \blk00000003/blk0000003a  (
    .CI(\blk00000003/sig0000007b ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000007d ),
    .O(\blk00000003/sig00000040 )
  );
  XORCY   \blk00000003/blk00000039  (
    .CI(\blk00000003/sig00000078 ),
    .LI(\blk00000003/sig0000007a ),
    .O(\blk00000003/sig0000007c )
  );
  MUXCY   \blk00000003/blk00000038  (
    .CI(\blk00000003/sig00000078 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000007a ),
    .O(\blk00000003/sig0000007b )
  );
  XORCY   \blk00000003/blk00000037  (
    .CI(\blk00000003/sig00000075 ),
    .LI(\blk00000003/sig00000077 ),
    .O(\blk00000003/sig00000079 )
  );
  MUXCY   \blk00000003/blk00000036  (
    .CI(\blk00000003/sig00000075 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000077 ),
    .O(\blk00000003/sig00000078 )
  );
  XORCY   \blk00000003/blk00000035  (
    .CI(\blk00000003/sig00000072 ),
    .LI(\blk00000003/sig00000074 ),
    .O(\blk00000003/sig00000076 )
  );
  MUXCY   \blk00000003/blk00000034  (
    .CI(\blk00000003/sig00000072 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000074 ),
    .O(\blk00000003/sig00000075 )
  );
  XORCY   \blk00000003/blk00000033  (
    .CI(\blk00000003/sig00000070 ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000073 )
  );
  MUXCY   \blk00000003/blk00000032  (
    .CI(\blk00000003/sig00000070 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000072 )
  );
  XORCY   \blk00000003/blk00000031  (
    .CI(\blk00000003/sig0000006e ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000071 )
  );
  MUXCY   \blk00000003/blk00000030  (
    .CI(\blk00000003/sig0000006e ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000070 )
  );
  XORCY   \blk00000003/blk0000002f  (
    .CI(\blk00000003/sig0000006c ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig0000006f )
  );
  MUXCY   \blk00000003/blk0000002e  (
    .CI(\blk00000003/sig0000006c ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig0000006e )
  );
  XORCY   \blk00000003/blk0000002d  (
    .CI(\blk00000003/sig0000006a ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig0000006d )
  );
  MUXCY   \blk00000003/blk0000002c  (
    .CI(\blk00000003/sig0000006a ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig0000006c )
  );
  XORCY   \blk00000003/blk0000002b  (
    .CI(\blk00000003/sig00000068 ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig0000006b )
  );
  MUXCY   \blk00000003/blk0000002a  (
    .CI(\blk00000003/sig00000068 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig0000006a )
  );
  XORCY   \blk00000003/blk00000029  (
    .CI(\blk00000003/sig00000066 ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000069 )
  );
  MUXCY   \blk00000003/blk00000028  (
    .CI(\blk00000003/sig00000066 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000068 )
  );
  XORCY   \blk00000003/blk00000027  (
    .CI(\blk00000003/sig00000064 ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000067 )
  );
  MUXCY   \blk00000003/blk00000026  (
    .CI(\blk00000003/sig00000064 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000066 )
  );
  XORCY   \blk00000003/blk00000025  (
    .CI(\blk00000003/sig00000063 ),
    .LI(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000065 )
  );
  MUXCY   \blk00000003/blk00000024  (
    .CI(\blk00000003/sig00000063 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000001 ),
    .O(\blk00000003/sig00000064 )
  );
  XORCY   \blk00000003/blk00000023  (
    .CI(\blk00000003/sig00000060 ),
    .LI(\blk00000003/sig00000002 ),
    .O(\blk00000003/sig00000062 )
  );
  XORCY   \blk00000003/blk00000022  (
    .CI(\blk00000003/sig0000005d ),
    .LI(\blk00000003/sig0000005f ),
    .O(\blk00000003/sig00000061 )
  );
  MUXCY   \blk00000003/blk00000021  (
    .CI(\blk00000003/sig0000005d ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000005f ),
    .O(\blk00000003/sig00000060 )
  );
  XORCY   \blk00000003/blk00000020  (
    .CI(\blk00000003/sig0000005a ),
    .LI(\blk00000003/sig0000005c ),
    .O(\blk00000003/sig0000005e )
  );
  MUXCY   \blk00000003/blk0000001f  (
    .CI(\blk00000003/sig0000005a ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000005c ),
    .O(\blk00000003/sig0000005d )
  );
  XORCY   \blk00000003/blk0000001e  (
    .CI(\blk00000003/sig00000057 ),
    .LI(\blk00000003/sig00000059 ),
    .O(\blk00000003/sig0000005b )
  );
  MUXCY   \blk00000003/blk0000001d  (
    .CI(\blk00000003/sig00000057 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000059 ),
    .O(\blk00000003/sig0000005a )
  );
  XORCY   \blk00000003/blk0000001c  (
    .CI(\blk00000003/sig00000054 ),
    .LI(\blk00000003/sig00000056 ),
    .O(\blk00000003/sig00000058 )
  );
  MUXCY   \blk00000003/blk0000001b  (
    .CI(\blk00000003/sig00000054 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000056 ),
    .O(\blk00000003/sig00000057 )
  );
  XORCY   \blk00000003/blk0000001a  (
    .CI(\blk00000003/sig00000051 ),
    .LI(\blk00000003/sig00000053 ),
    .O(\blk00000003/sig00000055 )
  );
  MUXCY   \blk00000003/blk00000019  (
    .CI(\blk00000003/sig00000051 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000053 ),
    .O(\blk00000003/sig00000054 )
  );
  XORCY   \blk00000003/blk00000018  (
    .CI(\blk00000003/sig0000004e ),
    .LI(\blk00000003/sig00000050 ),
    .O(\blk00000003/sig00000052 )
  );
  MUXCY   \blk00000003/blk00000017  (
    .CI(\blk00000003/sig0000004e ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000050 ),
    .O(\blk00000003/sig00000051 )
  );
  XORCY   \blk00000003/blk00000016  (
    .CI(\blk00000003/sig0000004b ),
    .LI(\blk00000003/sig0000004d ),
    .O(\blk00000003/sig0000004f )
  );
  MUXCY   \blk00000003/blk00000015  (
    .CI(\blk00000003/sig0000004b ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000004d ),
    .O(\blk00000003/sig0000004e )
  );
  XORCY   \blk00000003/blk00000014  (
    .CI(\blk00000003/sig00000048 ),
    .LI(\blk00000003/sig0000004a ),
    .O(\blk00000003/sig0000004c )
  );
  MUXCY   \blk00000003/blk00000013  (
    .CI(\blk00000003/sig00000048 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig0000004a ),
    .O(\blk00000003/sig0000004b )
  );
  XORCY   \blk00000003/blk00000012  (
    .CI(\blk00000003/sig00000045 ),
    .LI(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig00000049 )
  );
  MUXCY   \blk00000003/blk00000011  (
    .CI(\blk00000003/sig00000045 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000047 ),
    .O(\blk00000003/sig00000048 )
  );
  XORCY   \blk00000003/blk00000010  (
    .CI(\blk00000003/sig00000042 ),
    .LI(\blk00000003/sig00000044 ),
    .O(\blk00000003/sig00000046 )
  );
  MUXCY   \blk00000003/blk0000000f  (
    .CI(\blk00000003/sig00000042 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000044 ),
    .O(\blk00000003/sig00000045 )
  );
  XORCY   \blk00000003/blk0000000e  (
    .CI(\blk00000003/sig00000040 ),
    .LI(\blk00000003/sig00000041 ),
    .O(\blk00000003/sig00000043 )
  );
  MUXCY   \blk00000003/blk0000000d  (
    .CI(\blk00000003/sig00000040 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000041 ),
    .O(\blk00000003/sig00000042 )
  );
  MUXF7   \blk00000003/blk0000000c  (
    .I0(\blk00000003/sig0000003e ),
    .I1(\blk00000003/sig0000003f ),
    .S(\blk00000003/sig00000036 ),
    .O(\NLW_blk00000003/blk0000000c_O_UNCONNECTED )
  );
  MUXF7   \blk00000003/blk0000000b  (
    .I0(\blk00000003/sig0000003b ),
    .I1(\blk00000003/sig0000003c ),
    .S(\blk00000003/sig00000036 ),
    .O(\blk00000003/sig0000003d )
  );
  MUXF7   \blk00000003/blk0000000a  (
    .I0(\blk00000003/sig00000038 ),
    .I1(\blk00000003/sig00000039 ),
    .S(\blk00000003/sig00000036 ),
    .O(\blk00000003/sig0000003a )
  );
  MUXCY   \blk00000003/blk00000009  (
    .CI(\blk00000003/sig00000002 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000037 ),
    .O(\blk00000003/sig00000034 )
  );
  MUXCY   \blk00000003/blk00000008  (
    .CI(\blk00000003/sig00000034 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000035 ),
    .O(\blk00000003/sig00000036 )
  );
  MUXCY   \blk00000003/blk00000007  (
    .CI(\blk00000003/sig00000002 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000033 ),
    .O(\blk00000003/sig00000030 )
  );
  MUXCY   \blk00000003/blk00000006  (
    .CI(\blk00000003/sig00000030 ),
    .DI(\blk00000003/sig00000001 ),
    .S(\blk00000003/sig00000031 ),
    .O(\blk00000003/sig00000032 )
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
