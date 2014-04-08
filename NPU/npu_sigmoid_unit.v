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
    input signed [47:0] npu_sigmoid_din, // data from PEs selected as per scheduling logic
    input [1:0] npu_sched_sigmoid_function_sel, // 2 bits to select which sigmoid function to use. Comes from Sheduling logic
    output [15:0] npu_sigmoid_dout // output of the sigmoid unit, will be routed to sigmoid fifo or the output fifo as required.
    );

reg signed [47:0]npu_sigmoid_data_reg;
wire signed [15:0]npu_sigmoid_tanh_out;
wire signed [15:0]npu_sigmoid_linear_out;
//wire signed [15:0]pu_sigmoid_log_out;
wire signed [15:0]npu_tansig_lut_data_out;
wire signed [10:0]npu_tansig_lut_addr;

assign npu_sigmoid_dout = ((npu_sched_sigmoid_function_sel == 0) ? npu_sigmoid_tanh_out :
								  ((npu_sched_sigmoid_function_sel == 1) ? npu_sigmoid_linear_out : 0));

assign npu_sigmoid_linear_out = npu_sigmoid_data_reg[22:7];

assign npu_tansig_lut_addr = (npu_sigmoid_din >= 0) ? npu_sigmoid_din[15:5] : -npu_sigmoid_din[15:5];

assign npu_sigmoid_tanh_out =	((npu_sigmoid_data_reg > 48'sh00000000c7a0) ? 16'h0080 :
										((npu_sigmoid_data_reg < 48'shFFFFFFFF3860) ? 16'hFF80 :
										((npu_sigmoid_data_reg >= 0) ? npu_tansig_lut_data_out : -npu_tansig_lut_data_out)));

tansig tansig_lut (
  .clka(CLK), // input clka
  .addra(npu_tansig_lut_addr), // input [10 : 0] addra
  .douta(npu_tansig_lut_data_out) // output [15 : 0] douta
);

always @(posedge CLK) begin
	npu_sigmoid_data_reg <= npu_sigmoid_din;
end

endmodule
