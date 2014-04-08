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

	// Inputs
	reg CLK;
	reg RST;
	reg [31:0] npu_input_data;
	reg npu_input_fifo_write_enable;
	wire [31:0] npu_config_data;
	reg npu_config_fifo_write_enable;
	reg npu_output_fifo_read_enable;
	reg [10:0] addr;
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
		.npu_config_data(npu_config_data[25:0]), 
		.npu_config_fifo_write_enable(npu_config_fifo_write_enable), 
		.npu_output_fifo_read_enable(npu_output_fifo_read_enable), 
		.npu_output_data(npu_output_data), 
		.npu_output_fifo_empty(npu_output_fifo_empty), 
		.npu_input_fifo_full(npu_input_fifo_full), 
		.npu_config_fifo_full(npu_config_fifo_full)
	);

testbench_rom testy_rom (
  .clka(CLK), // input clka
  .addra(addr), // input [9 : 0] addra
  .douta(npu_config_data) // output [31 : 0] douta
);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 1;
		npu_input_data = 0;
		npu_input_fifo_write_enable = 0;
		npu_config_fifo_write_enable = 0;
		npu_output_fifo_read_enable = 0;
		#31
		RST = 0;
		npu_config_fifo_write_enable = 1;
		
	end
		
	
always@(posedge CLK)begin
	if(RST)begin
		addr <= 0;
		npu_input_data <= 0;
	end
	else begin
		addr <= addr + 1;
		if (addr == 144) begin
			npu_config_fifo_write_enable <= 0;
			npu_input_fifo_write_enable <= 1;
			npu_input_data <= 32'h2;
		end else begin
			npu_input_data <= 32'h3;
		end
		
	end
end

   always
	#5 CLK = ~CLK;
	
	initial
	#2000 $stop;

endmodule

