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
	input			iJumpCmd,
	input			iStall
);

	// Internal signal declaration
	wire	[31:0]	newPC;
	wire	[31:0]	RetAddr;
	wire	[31:0]	BranchAddr;
	wire	[31:0]	JumpAddr;

	// Internal signal assignment
	assign BranchAddr	= iBranchCmd ? iBranchAddr : iNextPC;
	assign RetAddr		= iRetCmd ? iRetAddr : BranchAddr;
	assign JumpAddr		= iJumpCmd ? {iNextPC[31:26], iOffset} : RetAddr;
	assign newPC		= iBranchMissCmd ? iBranchMissAddr : JumpAddr;
	
	// Output assignment
	assign oNewPC = newPC;

endmodule
