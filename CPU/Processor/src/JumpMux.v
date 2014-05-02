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
	reg		[31:0]	newPC;
	reg		[31:0]	RetAddr;
	reg		[31:0]	BranchAddr;
	reg		[31:0]	JumpAddr;

	// Internal signal assignment
	always @ (*) begin
		if (!iStall) begin
			BranchAddr	<= iBranchCmd ? iBranchAddr : iNextPC;
			RetAddr		<= iRetCmd ? iRetAddr : BranchAddr;
			JumpAddr	<= iJumpCmd ? {iNextPC[31:26], iOffset} : RetAddr;
			newPC		<= iBranchMissCmd ? iBranchMissAddr : JumpAddr;
		end
	end
	
	// Output assignment
	assign oNewPC = newPC;

endmodule
