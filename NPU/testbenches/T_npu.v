`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:56:14 04/04/2014
// Design Name:   npu
// Module Name:   C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/testbenches/T_npu.v
// Project Name:  npu_temp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module T_npu;

	// Inputs
	reg CLK;
	reg RST;
	reg [31:0] npu_input_data;
	reg npu_input_fifo_write_enable;
	reg [25:0] npu_config_data;
	reg npu_config_fifo_write_enable;
	reg npu_output_fifo_read_enable;

	// Outputs
	wire [31:0] npu_output_data;
	wire npu_output_fifo_empty;
	wire npu_input_fifo_full;
	wire npu_config_fifo_full;

	// Instantiate the Unit Under Test (UUT)
	npu uut (
		.CLK(CLK), 
		.RST(RST), 
		.npu_input_data(npu_input_data), 
		.npu_input_fifo_write_enable(npu_input_fifo_write_enable), 
		.npu_config_data(npu_config_data), 
		.npu_config_fifo_write_enable(npu_config_fifo_write_enable), 
		.npu_output_fifo_read_enable(npu_output_fifo_read_enable), 
		.npu_output_data(npu_output_data), 
		.npu_output_fifo_empty(npu_output_fifo_empty), 
		.npu_input_fifo_full(npu_input_fifo_full), 
		.npu_config_fifo_full(npu_config_fifo_full)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 1;
		#50 RST =0;
	end
		
	
	always@(posedge CLK)begin
	if(RST)begin
		npu_input_data <= 0;
		npu_input_fifo_write_enable <= 0;
		npu_config_data <= 0;
		npu_config_fifo_write_enable <= 0;
		npu_output_fifo_read_enable <= 0;
	end
	else begin
		npu_config_fifo_write_enable<=1;
		npu_config_data <= npu_config_data+1;
	end
		// Wait 100 ns for global reset to finish
	end
      
		// Add stimulus here
		//npu_config_data = 26'h3fffff;
		//npu_config_fifo_write_enable = 1;
		


	
   always
	#5 CLK = ~CLK;
	initial 
	#1000 $stop;  
endmodule

