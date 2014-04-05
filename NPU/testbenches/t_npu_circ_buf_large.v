`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:07:22 03/22/2014
// Design Name:   npu_circ_buf_large
// Module Name:   D:/Xil/NPU2/t_npu_circ_buf_large.v
// Project Name:  NPU2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_circ_buf_large
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_npu_circ_buf_large;

	// Inputs
	reg CLK;
	reg npu_rst;
	reg npu_circ_buf_read_en;
	reg npu_circ_buf_write_en;
	reg [15:0] npu_circ_buf_data_input;
	reg [6:0]count;
	// Outputs
	wire [15:0] npu_circ_buf_data_output;

		
	// Instantiate the Unit Under Test (UUT)
	npu_circ_buf_large uut (
		.CLK(CLK), 
		.npu_rst(npu_rst), 
		.npu_circ_buf_read_en(npu_circ_buf_read_en), 
		.npu_circ_buf_write_en(npu_circ_buf_write_en), 
		.npu_circ_buf_data_input(npu_circ_buf_data_input), 
		.npu_circ_buf_data_output(npu_circ_buf_data_output)
	);

	initial 
		// Initialize Inputs
		CLK = 1;
	
	always 
	#5 CLK = ~CLK;
	
	initial  begin
		npu_rst = 1;
		#50 npu_rst = 0;
	end
	
	always@(posedge CLK) begin
		if(npu_rst)begin
			npu_circ_buf_read_en <= 0;
			npu_circ_buf_write_en <= 0;
			npu_circ_buf_data_input <= 0;
			count <= 0;
		end
	
		else begin
				if(count <7) begin
					npu_circ_buf_write_en <= 1;
					count <= count +1;
					npu_circ_buf_data_input <= npu_circ_buf_data_input +1;
					npu_circ_buf_read_en <= 0;
				end      
			 else begin
					npu_circ_buf_write_en <= 0;
					count <= count;
					npu_circ_buf_data_input <= npu_circ_buf_data_input +1;
					npu_circ_buf_read_en <= 1;
				end
			end
		end
endmodule

