`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:29:45 03/25/2014
// Design Name:   npu_input_interface
// Module Name:   D:/Xil/NPU2/t_npu_input_interface.v
// Project Name:  NPU2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_input_interface
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_npu_input_interface;

	// Inputs
	reg CLK;
	reg npu_rst;
	reg npu_input_fifo_write_en;
	reg npu_input_fifo_read_en;
	reg [31:0] npu_input_data;
	reg npu_input_interface_conf_data_en;
	reg [15:0] npu_input_interface_conf_data;


	reg [5:0]count;
	// Outputs
	wire [15:0] npu_input_interface_data_out;
	wire npu_input_fifo_full;
	wire npu_input_fifo_empty;

	// Instantiate the Unit Under Test (UUT)
	npu_input_interface uut (
		.CLK(CLK), 
		.npu_rst(npu_rst), 
		.npu_input_fifo_write_en(npu_input_fifo_write_en), 
		.npu_input_fifo_read_en(npu_input_fifo_read_en), 
		.npu_input_data(npu_input_data), 
		.npu_input_interface_conf_data_en(npu_input_interface_conf_data_en), 
		.npu_input_interface_conf_data(npu_input_interface_conf_data), 
		.npu_input_interface_data_out(npu_input_interface_data_out), 
		.npu_input_fifo_full(npu_input_fifo_full), 
		.npu_input_fifo_empty(npu_input_fifo_empty)
	);

	initial 
	CLK = 1;

	always
	CLK = ~CLK;
	
	initial begin
	npu_rst = 1;
	#50 npu_rst = 0;
	end
	
	always@(posedge clk)begin
		if(rst)begin
			npu_input_fifo_write_en <= 0;
			npu_input_fifo_read_en <= 0;
			npu_input_data <= 0;
			npu_input_interface_conf_data_en <= 0;
			npu_input_interface_conf_data <= 0;
			count <= 0;
		end
		else begin
			if(count<1) begin
				npu_input_interface_conf_data_en <= 1;
				npu_input_interface_conf_data <= npu_input_interface_conf_data + 1;
			end
			else begin
				npu_input_interface_conf_data_en <= 0;
				npu_input_fifo_write_en <= 1;
				npu_input_fifo_read_en <= 0;
				npu_input_data <= 0;
				
				if(count == 6)
					count <= 0;
			end
		end
	end
endmodule

