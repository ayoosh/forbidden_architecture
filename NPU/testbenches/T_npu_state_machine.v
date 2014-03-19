`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:14:00 03/18/2014
// Design Name:   npu_state_machine
// Module Name:   C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/testbenches/T_npu_state_machine.v
// Project Name:  npu_temp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_state_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module T_npu_state_machine;

	// Inputs
	reg CLK;
	reg RST;
	reg [15:0] npu_state_data_in;
	reg npu_state_output_reg_enable;
	reg npu_state_input_reg_enable;
	reg npu_config_fifo_empty;
	reg npu_input_fifo_empty;
	reg npu_sched_input_fifo_read_en;
	reg npu_output_fifo_full;
	reg npu_sched_output_fifo_write_en;

	// Outputs
	wire npu_input_fifo_read_en;
	wire npu_output_fifo_write_en;
	wire npu_state_idle;
	wire npu_state_stall;
	wire npu_state_compute;
	wire npu_state_config;
	wire npu_inputs_done;

	// Instantiate the Unit Under Test (UUT)
	npu_state_machine uut (
		.CLK(CLK), 
		.RST(RST), 
		.npu_state_data_in(npu_state_data_in), 
		.npu_state_output_reg_enable(npu_state_output_reg_enable), 
		.npu_state_input_reg_enable(npu_state_input_reg_enable), 
		.npu_config_fifo_empty(npu_config_fifo_empty), 
		.npu_input_fifo_empty(npu_input_fifo_empty), 
		.npu_sched_input_fifo_read_en(npu_sched_input_fifo_read_en), 
		.npu_output_fifo_full(npu_output_fifo_full), 
		.npu_sched_output_fifo_write_en(npu_sched_output_fifo_write_en), 
		.npu_input_fifo_read_en(npu_input_fifo_read_en), 
		.npu_output_fifo_write_en(npu_output_fifo_write_en), 
		.npu_state_idle(npu_state_idle), 
		.npu_state_stall(npu_state_stall), 
		.npu_state_compute(npu_state_compute), 
		.npu_state_config(npu_state_config), 
		.npu_inputs_done(npu_inputs_done)
	);

	initial begin
		// Initialize Inputs
		CLK = 1;
		RST = 1;
		npu_state_data_in = 0;
		npu_state_output_reg_enable = 0;
		npu_state_input_reg_enable = 0;
		npu_config_fifo_empty = 1;
		npu_input_fifo_empty = 1;
		npu_sched_input_fifo_read_en = 0;
		npu_output_fifo_full = 0;
		npu_sched_output_fifo_write_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		RST = 0;
		#40 npu_config_fifo_empty = 0;
		#80 npu_state_output_reg_enable = 1;
		npu_state_data_in = 16'h0004;
		#10 npu_state_input_reg_enable = 1;
		npu_state_output_reg_enable = 0;
		npu_config_fifo_empty = 1;
		#10 npu_state_input_reg_enable = 0;
		#50 npu_input_fifo_empty = 0;
		npu_sched_input_fifo_read_en = 1;
		#20 npu_input_fifo_empty = 1;
		#40 npu_input_fifo_empty = 0;
		#100 npu_sched_output_fifo_write_en = 1;
		#10 npu_output_fifo_full = 1;
		npu_sched_output_fifo_write_en = 0;
		#40 npu_output_fifo_full = 0;
		npu_sched_output_fifo_write_en = 1;
		#30 npu_sched_output_fifo_write_en = 0;
		
		
		
		
		
	end
      
	always
	#5 CLK = ~CLK;

	initial 
	#1000 $stop;
	
endmodule

