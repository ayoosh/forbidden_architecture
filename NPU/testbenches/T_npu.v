`timescale 1ns / 1ns

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

	
	reg CLK;
	reg RST;
	
	reg npu_input_fifo_write_enable;
	reg npu_config_fifo_write_enable;
	reg [10:0] config_addr;
	reg [18:0] input_addr;
	
	reg [31:0] input_array [35:0];
	
	wire [31:0] npu_config_data;
	wire npu_output_fifo_read_enable;
	wire [31:0] npu_input_data;
	wire [31:0] npu_output_data;
	wire npu_output_fifo_empty;
	wire npu_input_fifo_full;
	wire npu_config_fifo_full;
	
	assign npu_output_fifo_read_enable = ~npu_output_fifo_empty;
	assign npu_input_data = input_array [input_addr];
	// Instantiate the Unit Under Test (UUT)
	npu uut (
		.CLK(CLK), 
		.RST(RST), 
		.npu_input_data(npu_input_data), 
		.npu_input_fifo_write_enable(npu_input_fifo_write_enable), 
		.npu_config_data(npu_config_data[25:0]), 
		.npu_config_fifo_write_enable(npu_config_fifo_write_enable), 
		.npu_output_fifo_read_enable(npu_output_fifo_read_enable), 
		.npu_output_data(npu_output_data), 
		.npu_output_fifo_empty(npu_output_fifo_empty), 
		.npu_input_fifo_full(npu_input_fifo_full), 
		.npu_config_fifo_full(npu_config_fifo_full)
	);

	testbench_rom testy_config_rom (
		.clka(CLK), // input clka
		.addra(config_addr), // input [9 : 0] addra
		.douta(npu_config_data) // output [31 : 0] douta
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 1;
		#31
		RST = 0;
	end

	
always@(posedge CLK)begin
	if(RST)begin
		config_addr <= -1;
		npu_input_fifo_write_enable <= 0;
		npu_config_fifo_write_enable <= 0;
		input_addr <= -1;

		// Output = 0.0011026
		input_array [0] <= 162;
		input_array [1] <= 162;
		input_array [2] <= 159;
		input_array [3] <= 161;
		input_array [4] <= 160;
		input_array [5] <= 158;
		input_array [6] <= 162;
		input_array [7] <= 162;
		input_array [8] <= 159;
		
		// Output = 0.94649
		input_array [9]  <= 211;
		input_array [10] <= 212;
		input_array [11] <= 217;
		input_array [12] <= 172;
		input_array [13] <= 175;
		input_array [14] <= 198;
		input_array [15] <= 114;
		input_array [16] <= 115;
		input_array [17] <= 143;
		
		// Output = 0.0011539
		input_array [18] <= 161;
		input_array [19] <= 160;
		input_array [20] <= 158;
		input_array [21] <= 162;
		input_array [22] <= 162;
		input_array [23] <= 159;
		input_array [24] <= 162;
		input_array [25] <= 161;
		input_array [26] <= 160;
		
		// Output = 0.95808
		input_array [27] <= 172;
		input_array [28] <= 166;
		input_array [29] <= 092;
		input_array [30] <= 160;
		input_array [31] <= 146;
		input_array [32] <= 064;
		input_array [33] <= 129;
		input_array [34] <= 114;
		input_array [35] <= 052;		
		
	end
	else begin
		if (config_addr == 11'd604) begin // Configuration done .. go to input stage
			if (input_addr == 35) begin // done sending inputs
				npu_input_fifo_write_enable <= 0;
			end else begin // Still sending new input values
				npu_config_fifo_write_enable <= 0;
				npu_input_fifo_write_enable <= 1;
				input_addr <= input_addr + 1;
			end
		end else begin // Still sending configuration values
			config_addr <= config_addr + 1;
			npu_config_fifo_write_enable = 1;
		end
		
	end
end

   always
	#5 CLK = ~CLK;
	
	initial
	#10000 $stop;

endmodule

