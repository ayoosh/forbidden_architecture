// Include listing

// Branch Control module ports declaration
module BranchControl (
	// Outputs
	output			oBranchCmd,

	// Inputs
	input	[2:0]	iBranchOp,
	input			iBranchCmd,
	input			iZeroFlag,
	input			iOverflowFlag,
	input			iNegativeFlag
);

	// Internal parameters definition
	// Branch Operations parameter
	localparam	B_NEQ	= 3'b000;
	localparam	B_EQ	= 3'b001;
	localparam	B_GT	= 3'b010;
	localparam	B_LT	= 3'b011;
	localparam	B_GTE	= 3'b100;
	localparam	B_LTE	= 3'b101;
	localparam	B_OVFL	= 3'b110;
	localparam	B_UNCON	= 3'b111;

	// Outputs assignment
	assign	oBranchCmd = iBranchCmd & (((iBranchOp == B_NEQ) & ~iZeroFlag) |
										((iBranchOp == B_EQ) & iZeroFlag) |
										((iBranchOp == B_GT) & ~iZeroFlag & ~iNegativeFlag) |
										((iBranchOp == B_LT) & iNegativeFlag) |
										((iBranchOp == B_GTE) & ~iNegativeFlag) |
										((iBranchOp == B_LTE) & (iNegativeFlag | iZeroFlag)) |
										((iBranchOp == B_OVFL) & iOverflowFlag) |
										(iBranchOp == B_UNCON));

endmodule
