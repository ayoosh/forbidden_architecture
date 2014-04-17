// Timescale definition
`timescale	1ns/1ps

// Include listing

// Branch Adder module ports declaration
module BranchAdder (
	/// Outputs
	output	[31:0]	oBranchAddr,

	// Inputs
	input	[31:0]	iNextPC,
	input	[20:0]	iOffset
);

	// Internal signals assignment
	assign oBranchAddr		= iNextPC + {11'h0, iOffset};

endmodule
