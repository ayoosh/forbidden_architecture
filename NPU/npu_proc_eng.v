`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:09:34 03/17/2014 
// Design Name: 
// Module Name:    npu_proc_eng 
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
module npu_proc_eng(
    input CLK,  // Global 100 Mhz clock
    input npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 input npu_pe_new_input_wren, // new input needs to be stored into the PE
    input npu_pe_en,  // Active high enable signal to PE.
    input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    input [15:0] npu_pe_weight_in,  // Weight input
    input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
    output reg [47:0] npu_pe_acc_val, // output of this PE for next PE or Acc FIFO
	 output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );

  reg [15:0] npu_pe_data_stored;  // Input data stored inside this PE
  wire [47:0] npu_pe_acc_val_wire;
  wire [47:0] npu_pe_acc_output_wire;
  
npu_mul_add_dsp npu_mul_add (
	.a(npu_pe_data_stored), // input [15 : 0] a
	.b(npu_pe_weight_in), // input [15 : 0] b
	.c(npu_pe_acc_in), // input [47 : 0] c
	.subtract(0), // input subtract always 0 cause we need addition only
	.p(npu_pe_acc_output_wire), // ouput [47 : 0] p
	.pcout(npu_pe_acc_val_wire)); // ouput [47 : 0] pcout

  always @(posedge CLK) begin
    if (npu_rst) begin // if reset is active
	   npu_pe_acc_val <= 0;
	   npu_pe_acc_output <= 0;
	   npu_pe_data_stored <= 0;
	 end // npu_rst
	 else begin // if reset is not active
	   if (npu_pe_en) begin
		  npu_pe_data_stored <= npu_pe_data_in;
		  npu_pe_acc_val <= npu_pe_acc_val_wire;
		  npu_pe_acc_output <= npu_pe_acc_output_wire;
		end // npu_pe_enable
		else begin // ~npu_pe_enable
		  // Nothing to do here
		end // ~npu_pe_enable
	 end // ~npu_rst
  end // always
endmodule
