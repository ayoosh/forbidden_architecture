`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:51:22 03/25/2014
// Design Name:   npu_config_fifo
// Module Name:   D:/Xil/NPU2/t_npu_config_fifo.v
// Project Name:  NPU2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_config_fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_npu_config_fifo;

	// Inputs
	reg clk;
	reg srst;
	reg [25:0] din;
	reg wr_en;
	reg rd_en;
	reg [5:0]count;

	// Outputs
	wire [25:0] dout;
	wire full;
	wire empty;

	// Instantiate the Unit Under Test (UUT)
	npu_config_fifo uut (
		.clk(clk), 
		.srst(srst), 
		.din(din), 
		.wr_en(wr_en), 
		.rd_en(rd_en), 
		.dout(dout), 
		.full(full), 
		.empty(empty)
	);

	initial 
		  clk = 1;

	always
	#5 clk =~clk;
		
	initial begin
	
		srst = 1;
		#50 srst = 0;
	end
	      
	always@(posedge clk)begin
		if(srst)begin
			din <= 0;
			wr_en <= 0;
			rd_en <= 0;
			count<=0;
		end
		else begin
			if(count <7) begin
				din <= din + 1;
				wr_en <= 1;
				rd_en <= 0;
				count <=count +1;
			end
			else begin
			if(empty == 1)
				wr_en <= 0;
				rd_en <= 1;
			end
		end
	end
endmodule

