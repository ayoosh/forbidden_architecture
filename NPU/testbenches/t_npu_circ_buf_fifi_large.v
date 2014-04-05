`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:23:23 03/22/2014
// Design Name:   npu_circ_buf_fifo_large
// Module Name:   D:/Xil/NPU2/t_npu_circ_buf_fifi_large.v
// Project Name:  NPU2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_circ_buf_fifo_large
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_npu_circ_buf_fifi_large;

	// Inputs
	reg clk;
	reg rst;
	reg [15:0] din;
	reg wr_en;
	reg rd_en;

	// Outputs
	wire [15:0] dout;
	wire full;
	wire empty;
	reg [2:0]count ;

	// Instantiate the Unit Under Test (UUT)
	npu_circ_buf_fifo_large uut (
		.clk(clk), 
		.rst(rst), 
		.din(din), 
		.wr_en(wr_en), 
		.rd_en(rd_en), 
		.dout(dout), 
		.full(full), 
		.empty(empty)
	);

	initial 
		clk=1;
	
	always 
		#5 clk = ~clk;
		
	initial begin
		// Initialize Inputs
		rst = 1;
			
		#100 rst = 0;
		// Wait 100 ns for global reset to finish
	end
	
		always@(posedge clk) begin
		if(rst) begin
			din <= 0;
			wr_en <= 0;
			rd_en <= 0;
			count <= 0;
 		end
		else begin 
			if(count < 7)begin
			din <= din + 1 ;
			wr_en <= 1;
			count <= count +1;
			rd_en <= 0;
			end
			else begin
				count <= 0;
				wr_en = 0;
				rd_en <= 1;
			end
		end      
		// Add stimulus here

	end
      
endmodule

