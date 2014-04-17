// Timescale definition
`timescale	1ns/1ps

// Include listing

// Forward Multiplexer module ports declaration
module ForwardMux (
	// Outputs
	output	[31:0]	oSrc,

	// Inputs
	input	[31:0]	iSrc,
	input	[31:0]	iForwardMem,
	input	[31:0]	iForwardWb,
	input	[1:0]	iForwardCmd
);

	// Outputs assignments
	assign oSrc =	(iForwardCmd == 2'b10) ? iForwardWb: 
					(iForwardCmd == 2'b01) ? iForwardMem:
					iSrc;

endmodule
