// Timescale definition
`timescale	1ns/1ps

// Include listing

// Sign Extend module ports declaration
module SignExtend (
	// Outputs
	output	[31:0]	oOutput,

	// Inputs
	input	[15:0]	iInput
);

	// Outputs assignment
	assign oOutput = {{16{iInput[15]}}, iInput};

endmodule
