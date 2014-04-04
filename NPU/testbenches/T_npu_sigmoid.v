`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:15:09 04/03/2014
// Design Name:   npu_sigmoid_unit
// Module Name:   C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/testbenches/T_npu_sigmoid.v
// Project Name:  npu_temp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_sigmoid_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module T_npu_sigmoid;

	// Inputs
	reg CLK;
	reg npu_rst;
	reg [47:0] npu_sigmoid_din;
	reg [1:0] npu_sched_sigmoid_function_sel;
	reg npu_sched_sigmoid_input_en;

	// Outputs
	wire [15:0] npu_sigmoid_dout;

	// Instantiate the Unit Under Test (UUT)
	npu_sigmoid_unit uut (
		.CLK(CLK), 
		.npu_rst(npu_rst), 
		.npu_sigmoid_din(npu_sigmoid_din), 
		.npu_sched_sigmoid_function_sel(npu_sched_sigmoid_function_sel), 
		.npu_sched_sigmoid_input_en(npu_sched_sigmoid_input_en), 
		.npu_sigmoid_dout(npu_sigmoid_dout)
	);

	initial begin
		// Initialize Inputs
		CLK = 1;
		npu_rst = 1;
		npu_sigmoid_din = 0;
		npu_sched_sigmoid_function_sel = 0;
		npu_sched_sigmoid_input_en = 0;

		// Wait 100 ns for global reset to finish
		#11;
      npu_rst = 0;
		// Add stimulus here
		npu_sigmoid_din = 48'hFF;
		npu_sched_sigmoid_function_sel = 1;
		#10;
		npu_sigmoid_din = 48'hF0;
		npu_sched_sigmoid_function_sel = 1;
		#10;
		npu_sigmoid_din = 48'h0;
		npu_sched_sigmoid_function_sel = 0;
		#10;
		npu_sigmoid_din = 48'h000000000260;
		npu_sched_sigmoid_function_sel = 0;
		#10;
		npu_sigmoid_din = 48'hFFFFFFFFFDA0;
		npu_sched_sigmoid_function_sel = 0;
		#10;
		npu_sigmoid_din = 48'h000000000f05;
		npu_sched_sigmoid_function_sel = 0;
		#10;
		npu_sigmoid_din = 48'hFFFFFFFFF0FB;
		npu_sched_sigmoid_function_sel = 0;
		#10;
		npu_sigmoid_din = 48'h000000FFc7a0;
		npu_sched_sigmoid_function_sel = 0;
		#10;
		npu_sigmoid_din = 48'hFFFFFF003860;
		npu_sched_sigmoid_function_sel = 0;
		#10;
	end

	always
	#5 CLK = ~CLK;

	initial 
	#1000 $stop;
	
endmodule

