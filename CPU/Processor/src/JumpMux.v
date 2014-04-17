// Timescale definition
`timescale	1ns/1ps

// Include listing

// Jump Mux module ports declaration
module JumpMux (
	// Outputs
	output	[31:0]	oNewPC,

	// Inputs
	input	[25:0]	iOffset,
	input	[31:0]	iNextPC,
	input	[31:0]	iRetAddr,
	input	[31:0]	iBranchAddr,
	input	[31:0]	iBranchMissAddr,
	input			iRetCmd,
	input			iBranchCmd,
	input			iBranchMissCmd,
	input			iJumpCmd
);

	// Internal signal declaration
	wire	[31:0]	RetAddr;
	wire	[31:0]	BranchAddr;
	wire	[31:0]	BranchMissAddr;

	// Internal signal assignment
	assign BranchAddr		= iBranchCmd ? iBranchAddr : iNextPC;
	assign RetAddr			= iRetCmd ? iRetAddr : BranchAddr;
	assign BranchMissAddr	= iBranchMissCmd ? iBranchMissAddr : RetAddr;

	// Output assignment
	assign oNewPC		= iJumpCmd ? {iNextPC[31:26], iOffset} : BranchMissAddr;

endmodule
