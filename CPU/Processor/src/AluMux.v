// Timescale definition
`timescale	1ns/1ps

// Include listing

// Alu Multiplexer module ports declaration
module AluMux (
	// Outputs
	output	[31:0]	oSrc,

	// Inputs
	input	[31:0]	iSrc,
	input	[31:0]	iImmediate,
	input			iAluCmd,
	input			iCallCmd
);

	wire	[31:0]	callSrc;

	//Internal signals assignment
	assign	callSrc = -1;
	
	// Outputs assignment
	assign	oSrc =	iAluCmd ? iImmediate : 
					iCallCmd ? callSrc :
					iSrc;	// Sign extended immediate for LLW, LHW, LOAD and STORE

endmodule
