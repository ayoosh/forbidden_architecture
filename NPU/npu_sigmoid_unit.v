`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:16:15 03/19/2014 
// Design Name: 
// Module Name:    npu_sigmoid_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module npu_sigmoid_unit(
    input CLK,
    input npu_rst, // NPU internal reset. Active with global reset or new config triggered reset
    input [47:0] npu_sigmoid_din, // data from PEs selected as per scheduling logic
    input [1:0] npu_sched_sigmoid_function_sel, // 2 bits to select which sigmoid function to use. Comes from Sheduling logic
    input npu_sched_sigmoid_input_en, // Active high. If active an input is read from npu_sigmoid_din to calculate sigmoid value
    output [15:0] npu_sigmoid_dout // output of the sigmoid unit, will be routed to sigmoid fifo or the output fifo as required.
    );


endmodule
