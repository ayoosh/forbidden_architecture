////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.40d
//  \   \         Application: netgen
//  /   /         Filename: npu_mul_add_dsp.v
// /___/   /\     Timestamp: Mon Mar 17 14:11:16 2014
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_mul_add_dsp.ngc C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_mul_add_dsp.v 
// Device	: 5vlx110tff1136-1
// Input file	: C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_mul_add_dsp.ngc
// Output file	: C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/coregens/tmp/_cg/npu_mul_add_dsp.v
// # of Modules	: 1
// Design Name	: npu_mul_add_dsp
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

module npu_mul_add_dsp (
  subtract, pcout, a, b, c, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input subtract;
  output [47 : 0] pcout;
  input [15 : 0] a;
  input [15 : 0] b;
  input [47 : 0] c;
  output [47 : 0] p;
  
  // synthesis translate_off
  
  wire \blk00000003/sig000000b4 ;
  wire \blk00000003/sig000000b3 ;
  wire \blk00000003/sig00000001 ;
  wire NLW_blk00000001_P_UNCONNECTED;
  wire NLW_blk00000002_G_UNCONNECTED;
  wire \NLW_blk00000003/blk00000006_PATTERNBDETECT_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_PATTERNDETECT_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_OVERFLOW_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_UNDERFLOW_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYCASCOUT_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_MULTSIGNOUT_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000003/blk00000006_CARRYOUT<0>_UNCONNECTED ;
  wire [15 : 0] a_0;
  wire [15 : 0] b_1;
  wire [47 : 0] c_2;
  wire [47 : 0] p_3;
  wire [47 : 0] pcout_4;
  assign
    pcout[47] = pcout_4[47],
    pcout[46] = pcout_4[46],
    pcout[45] = pcout_4[45],
    pcout[44] = pcout_4[44],
    pcout[43] = pcout_4[43],
    pcout[42] = pcout_4[42],
    pcout[41] = pcout_4[41],
    pcout[40] = pcout_4[40],
    pcout[39] = pcout_4[39],
    pcout[38] = pcout_4[38],
    pcout[37] = pcout_4[37],
    pcout[36] = pcout_4[36],
    pcout[35] = pcout_4[35],
    pcout[34] = pcout_4[34],
    pcout[33] = pcout_4[33],
    pcout[32] = pcout_4[32],
    pcout[31] = pcout_4[31],
    pcout[30] = pcout_4[30],
    pcout[29] = pcout_4[29],
    pcout[28] = pcout_4[28],
    pcout[27] = pcout_4[27],
    pcout[26] = pcout_4[26],
    pcout[25] = pcout_4[25],
    pcout[24] = pcout_4[24],
    pcout[23] = pcout_4[23],
    pcout[22] = pcout_4[22],
    pcout[21] = pcout_4[21],
    pcout[20] = pcout_4[20],
    pcout[19] = pcout_4[19],
    pcout[18] = pcout_4[18],
    pcout[17] = pcout_4[17],
    pcout[16] = pcout_4[16],
    pcout[15] = pcout_4[15],
    pcout[14] = pcout_4[14],
    pcout[13] = pcout_4[13],
    pcout[12] = pcout_4[12],
    pcout[11] = pcout_4[11],
    pcout[10] = pcout_4[10],
    pcout[9] = pcout_4[9],
    pcout[8] = pcout_4[8],
    pcout[7] = pcout_4[7],
    pcout[6] = pcout_4[6],
    pcout[5] = pcout_4[5],
    pcout[4] = pcout_4[4],
    pcout[3] = pcout_4[3],
    pcout[2] = pcout_4[2],
    pcout[1] = pcout_4[1],
    pcout[0] = pcout_4[0],
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
    b_1[15] = b[15],
    b_1[14] = b[14],
    b_1[13] = b[13],
    b_1[12] = b[12],
    b_1[11] = b[11],
    b_1[10] = b[10],
    b_1[9] = b[9],
    b_1[8] = b[8],
    b_1[7] = b[7],
    b_1[6] = b[6],
    b_1[5] = b[5],
    b_1[4] = b[4],
    b_1[3] = b[3],
    b_1[2] = b[2],
    b_1[1] = b[1],
    b_1[0] = b[0],
    c_2[47] = c[47],
    c_2[46] = c[46],
    c_2[45] = c[45],
    c_2[44] = c[44],
    c_2[43] = c[43],
    c_2[42] = c[42],
    c_2[41] = c[41],
    c_2[40] = c[40],
    c_2[39] = c[39],
    c_2[38] = c[38],
    c_2[37] = c[37],
    c_2[36] = c[36],
    c_2[35] = c[35],
    c_2[34] = c[34],
    c_2[33] = c[33],
    c_2[32] = c[32],
    c_2[31] = c[31],
    c_2[30] = c[30],
    c_2[29] = c[29],
    c_2[28] = c[28],
    c_2[27] = c[27],
    c_2[26] = c[26],
    c_2[25] = c[25],
    c_2[24] = c[24],
    c_2[23] = c[23],
    c_2[22] = c[22],
    c_2[21] = c[21],
    c_2[20] = c[20],
    c_2[19] = c[19],
    c_2[18] = c[18],
    c_2[17] = c[17],
    c_2[16] = c[16],
    c_2[15] = c[15],
    c_2[14] = c[14],
    c_2[13] = c[13],
    c_2[12] = c[12],
    c_2[11] = c[11],
    c_2[10] = c[10],
    c_2[9] = c[9],
    c_2[8] = c[8],
    c_2[7] = c[7],
    c_2[6] = c[6],
    c_2[5] = c[5],
    c_2[4] = c[4],
    c_2[3] = c[3],
    c_2[2] = c[2],
    c_2[1] = c[1],
    c_2[0] = c[0],
    p[47] = p_3[47],
    p[46] = p_3[46],
    p[45] = p_3[45],
    p[44] = p_3[44],
    p[43] = p_3[43],
    p[42] = p_3[42],
    p[41] = p_3[41],
    p[40] = p_3[40],
    p[39] = p_3[39],
    p[38] = p_3[38],
    p[37] = p_3[37],
    p[36] = p_3[36],
    p[35] = p_3[35],
    p[34] = p_3[34],
    p[33] = p_3[33],
    p[32] = p_3[32],
    p[31] = p_3[31],
    p[30] = p_3[30],
    p[29] = p_3[29],
    p[28] = p_3[28],
    p[27] = p_3[27],
    p[26] = p_3[26],
    p[25] = p_3[25],
    p[24] = p_3[24],
    p[23] = p_3[23],
    p[22] = p_3[22],
    p[21] = p_3[21],
    p[20] = p_3[20],
    p[19] = p_3[19],
    p[18] = p_3[18],
    p[17] = p_3[17],
    p[16] = p_3[16],
    p[15] = p_3[15],
    p[14] = p_3[14],
    p[13] = p_3[13],
    p[12] = p_3[12],
    p[11] = p_3[11],
    p[10] = p_3[10],
    p[9] = p_3[9],
    p[8] = p_3[8],
    p[7] = p_3[7],
    p[6] = p_3[6],
    p[5] = p_3[5],
    p[4] = p_3[4],
    p[3] = p_3[3],
    p[2] = p_3[2],
    p[1] = p_3[1],
    p[0] = p_3[0];
  VCC   blk00000001 (
    .P(NLW_blk00000001_P_UNCONNECTED)
  );
  GND   blk00000002 (
    .G(NLW_blk00000002_G_UNCONNECTED)
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
  \blk00000003/blk00000006  (
    .CARRYIN(\blk00000003/sig000000b3 ),
    .CEA1(\blk00000003/sig000000b3 ),
    .CEA2(\blk00000003/sig000000b3 ),
    .CEB1(\blk00000003/sig000000b3 ),
    .CEB2(\blk00000003/sig000000b3 ),
    .CEC(\blk00000003/sig000000b3 ),
    .CECTRL(\blk00000003/sig000000b3 ),
    .CEP(\blk00000003/sig000000b3 ),
    .CEM(\blk00000003/sig000000b3 ),
    .CECARRYIN(\blk00000003/sig000000b3 ),
    .CEMULTCARRYIN(\blk00000003/sig000000b3 ),
    .CLK(\blk00000003/sig00000001 ),
    .RSTA(\blk00000003/sig000000b3 ),
    .RSTB(\blk00000003/sig000000b3 ),
    .RSTC(\blk00000003/sig000000b3 ),
    .RSTCTRL(\blk00000003/sig000000b3 ),
    .RSTP(\blk00000003/sig000000b3 ),
    .RSTM(\blk00000003/sig000000b3 ),
    .RSTALLCARRYIN(\blk00000003/sig000000b3 ),
    .CEALUMODE(\blk00000003/sig000000b3 ),
    .RSTALUMODE(\blk00000003/sig000000b3 ),
    .PATTERNBDETECT(\NLW_blk00000003/blk00000006_PATTERNBDETECT_UNCONNECTED ),
    .PATTERNDETECT(\NLW_blk00000003/blk00000006_PATTERNDETECT_UNCONNECTED ),
    .OVERFLOW(\NLW_blk00000003/blk00000006_OVERFLOW_UNCONNECTED ),
    .UNDERFLOW(\NLW_blk00000003/blk00000006_UNDERFLOW_UNCONNECTED ),
    .CARRYCASCIN(\blk00000003/sig000000b3 ),
    .CARRYCASCOUT(\NLW_blk00000003/blk00000006_CARRYCASCOUT_UNCONNECTED ),
    .MULTSIGNIN(\blk00000003/sig000000b3 ),
    .MULTSIGNOUT(\NLW_blk00000003/blk00000006_MULTSIGNOUT_UNCONNECTED ),
    .A({a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[15], a_0[14]
, a_0[13], a_0[12], a_0[11], a_0[10], a_0[9], a_0[8], a_0[7], a_0[6], a_0[5], a_0[4], a_0[3], a_0[2], a_0[1], a_0[0]}),
    .PCIN({\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 }),
    .B({b_1[15], b_1[15], b_1[15], b_1[14], b_1[13], b_1[12], b_1[11], b_1[10], b_1[9], b_1[8], b_1[7], b_1[6], b_1[5], b_1[4], b_1[3], b_1[2], b_1[1]
, b_1[0]}),
    .C({c_2[47], c_2[46], c_2[45], c_2[44], c_2[43], c_2[42], c_2[41], c_2[40], c_2[39], c_2[38], c_2[37], c_2[36], c_2[35], c_2[34], c_2[33], c_2[32]
, c_2[31], c_2[30], c_2[29], c_2[28], c_2[27], c_2[26], c_2[25], c_2[24], c_2[23], c_2[22], c_2[21], c_2[20], c_2[19], c_2[18], c_2[17], c_2[16], 
c_2[15], c_2[14], c_2[13], c_2[12], c_2[11], c_2[10], c_2[9], c_2[8], c_2[7], c_2[6], c_2[5], c_2[4], c_2[3], c_2[2], c_2[1], c_2[0]}),
    .CARRYINSEL({\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 }),
    .OPMODE({\blk00000003/sig000000b3 , \blk00000003/sig000000b4 , \blk00000003/sig000000b4 , \blk00000003/sig000000b3 , \blk00000003/sig000000b4 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b4 }),
    .BCIN({\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 }),
    .ALUMODE({\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , subtract, subtract}),
    .PCOUT({pcout_4[47], pcout_4[46], pcout_4[45], pcout_4[44], pcout_4[43], pcout_4[42], pcout_4[41], pcout_4[40], pcout_4[39], pcout_4[38], 
pcout_4[37], pcout_4[36], pcout_4[35], pcout_4[34], pcout_4[33], pcout_4[32], pcout_4[31], pcout_4[30], pcout_4[29], pcout_4[28], pcout_4[27], 
pcout_4[26], pcout_4[25], pcout_4[24], pcout_4[23], pcout_4[22], pcout_4[21], pcout_4[20], pcout_4[19], pcout_4[18], pcout_4[17], pcout_4[16], 
pcout_4[15], pcout_4[14], pcout_4[13], pcout_4[12], pcout_4[11], pcout_4[10], pcout_4[9], pcout_4[8], pcout_4[7], pcout_4[6], pcout_4[5], pcout_4[4], 
pcout_4[3], pcout_4[2], pcout_4[1], pcout_4[0]}),
    .P({p_3[47], p_3[46], p_3[45], p_3[44], p_3[43], p_3[42], p_3[41], p_3[40], p_3[39], p_3[38], p_3[37], p_3[36], p_3[35], p_3[34], p_3[33], p_3[32]
, p_3[31], p_3[30], p_3[29], p_3[28], p_3[27], p_3[26], p_3[25], p_3[24], p_3[23], p_3[22], p_3[21], p_3[20], p_3[19], p_3[18], p_3[17], p_3[16], 
p_3[15], p_3[14], p_3[13], p_3[12], p_3[11], p_3[10], p_3[9], p_3[8], p_3[7], p_3[6], p_3[5], p_3[4], p_3[3], p_3[2], p_3[1], p_3[0]}),
    .BCOUT({\NLW_blk00000003/blk00000006_BCOUT<17>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<16>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<15>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<14>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<13>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<11>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<10>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<9>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<8>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<7>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<5>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<4>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<3>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<2>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_BCOUT<1>_UNCONNECTED , \NLW_blk00000003/blk00000006_BCOUT<0>_UNCONNECTED }),
    .ACIN({\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , 
\blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 , \blk00000003/sig000000b3 }),
    .ACOUT({\NLW_blk00000003/blk00000006_ACOUT<29>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<28>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<27>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<26>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<25>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<23>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<22>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<21>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<20>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<19>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<17>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<16>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<15>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<14>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<13>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<11>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<10>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<9>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<8>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<7>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<5>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<4>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<3>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<2>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_ACOUT<1>_UNCONNECTED , \NLW_blk00000003/blk00000006_ACOUT<0>_UNCONNECTED }),
    .CARRYOUT({\NLW_blk00000003/blk00000006_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000003/blk00000006_CARRYOUT<2>_UNCONNECTED , 
\NLW_blk00000003/blk00000006_CARRYOUT<1>_UNCONNECTED , \NLW_blk00000003/blk00000006_CARRYOUT<0>_UNCONNECTED })
  );
  VCC   \blk00000003/blk00000005  (
    .P(\blk00000003/sig000000b4 )
  );
  GND   \blk00000003/blk00000004  (
    .G(\blk00000003/sig000000b3 )
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
