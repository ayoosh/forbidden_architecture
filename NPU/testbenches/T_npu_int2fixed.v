`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:16:41 03/18/2014
// Design Name:   npu_int2fixed
// Module Name:   C:/Users/Ayoosh/Documents/GitHub/forbidden_architecture/NPU/testbenches/T_npu_int2fixed.v
// Project Name:  npu_temp
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_int2fixed
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module T_npu_int2fixed;

	// Inputs
	reg [31:0] npu_i2f_datain;
	reg [4:0] npu_i2f_shiftdownby;

	// Outputs
	wire [15:0] npu_i2f_dataout;

	// Instantiate the Unit Under Test (UUT)
	npu_int2fixed uut (
		.npu_i2f_datain(npu_i2f_datain), 
		.npu_i2f_dataout(npu_i2f_dataout), 
		.npu_i2f_shiftdownby(npu_i2f_shiftdownby)
	);

	initial begin
		// Initialize Inputs
		npu_i2f_datain = 32'b0000_0000_0000_0000_1100_0101_0011_1010;
		npu_i2f_shiftdownby = 0;

		// Wait 100 ns for global reset to finish
		#100 npu_i2f_shiftdownby = 1;
      #100 npu_i2f_shiftdownby = 2;
#100 npu_i2f_shiftdownby = 3;
#100 npu_i2f_shiftdownby = 4;
#100 npu_i2f_shiftdownby = 5;
#100 npu_i2f_shiftdownby = 6;		
#100 npu_i2f_shiftdownby = 7;
		// Add stimulus here

	end

      
endmodule

