`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:51:13 04/16/2014
// Design Name:   top_level
// Module Name:   C:/Users/Kush/Desktop/spring_2014/901/SPART_cache/TB_spart.v
// Project Name:  SPART_cache
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TB_spart;

	// Inputs
	reg clk;
	reg rst;
	reg RX;

	// Outputs
	wire txd;

	// Instantiate the Unit Under Test (UUT)
	top_level uut (
		.clk(clk), 
		.rst(rst), 
		.txd(txd), 
		.rxd(RX)
	);


initial
begin
clk = 0;
rst = 1;
RX = 1;

#40 rst = 0;

#6500;
RX = 0;		


#26077;
RX = 1;		

#26077;
RX = 0;		

#26077;
RX = 1;

#26077;
RX = 0;

#26077;
RX = 1;

#26077;
RX = 0;		

#26077;
RX = 1;		

#26077;
RX = 0;
	
#26077;
RX = 1;	


// Next Read command
#6500000;
RX = 0;		


#26077;
RX = 0;		

#26077;
RX = 1;		

#26077;
RX = 0;

#26077;
RX = 1;

#26077;
RX = 0;

#26077;
RX = 1;		

#26077;
RX = 0;		

#26077;
RX = 1;
	
#26077;
RX = 1;	


// Next Read command
#6500000;
RX = 0;		


#26077;
RX = 0;		

#26077;
RX = 1;		

#26077;
RX = 0;

#26077;
RX = 1;

#26077;
RX = 0;

#26077;
RX = 1;		

#26077;
RX = 0;		

#26077;
RX = 1;
	
#26077;
RX = 1;	


// Next Read command
#6500000;
RX = 0;		


#26077;
RX = 0;		

#26077;
RX = 1;		

#26077;
RX = 0;

#26077;
RX = 1;

#26077;
RX = 0;

#26077;
RX = 1;		

#26077;
RX = 0;		

#26077;
RX = 1;
	
#26077;
RX = 1;	

// End of 32-bit data sent


// Another READ

#65000;
RX = 0;		


#26077;
RX = 0;		

#26077;
RX = 0;		

#26077;
RX = 1;

#26077;
RX = 0;

#26077;
RX = 1;

#26077;
RX = 0;		

#26077;
RX = 1;		

#26077;
RX = 0;
	
#26077;
RX = 1;	


// Next Read command
#6500000;
RX = 0;		


#26077;
RX = 1;		

#26077;
RX = 1;		

#26077;
RX = 0;

#26077;
RX = 1;

#26077;
RX = 0;

#26077;
RX = 1;		

#26077;
RX = 0;		

#26077;
RX = 1;
	
#26077;
RX = 1;	


// Next Read command
#6500000;
RX = 0;		


#26077;
RX = 1;		

#26077;
RX = 1;		

#26077;
RX = 0;

#26077;
RX = 1;

#26077;
RX = 0;

#26077;
RX = 1;		

#26077;
RX = 0;		

#26077;
RX = 1;
	
#26077;
RX = 1;	


// Next Read command
#6500000;
RX = 0;		


#26077;
RX = 1;		

#26077;
RX = 1;		

#26077;
RX = 0;

#26077;
RX = 1;

#26077;
RX = 0;

#26077;
RX = 1;		

#26077;
RX = 0;		

#26077;
RX = 1;
	
#26077;
RX = 1;	

// End of 32-bit data sent



end

always 
#5 clk = ~clk;
      
endmodule

