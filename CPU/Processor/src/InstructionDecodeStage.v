// Include listing
`include	"../src/Control.v"
`include	"../src/RegisterFile.v"
`include	"../src/SignExtend.v"

// Intruction Decode Stage module ports declaration
module InstructionDecodeStage (
	// Outputs
	output	[31:0]	oSrc0,
	output	[31:0]	oSrc1,
	output	[31:0]	oImmediate,
	output	[25:0]	oOffset,
	output	[31:0]	oNextPC,
	output	[4:0]	oExuShift,
	output	[1:0]	oExuOp,
	output	[3:0]	oAluOp,
	output			oMduOp,
	output	[2:0]	oFpuOp,
	output	[2:0]	oBranchOp,
	output			oBranchCmd,
	output			oJumpCmd,
	output			oAluCmd,
	output			oHalt,
	output	[31:0]	oMemData,
	output			oMemWrite,
	output			oMemValid,
	output			oMemToReg,
	output			oCacheFlush,
	output			oZeroEn,
	output			oOverflowEn,
	output			oNegativeEn,
	output	[4:0]	oWriteAddr,
	output			oWriteEn,
	output			oCallCmd,
	output			oRetCmd,
	output			oLoadCmd,
	output			oStoreCmd,
	output	[31:0]	oBranchAddr,
	output			oBranchPredict,
	output			oNpuCfgOp,
	output			oNpuEnqOp,
	output			oNpuDeqOp,
	output	[31:0]	oInstruction,

	// Inputs
	input	[31:0]	iInstruction,
	input	[31:0]	iNextPC,
	input	[4:0]	iWriteAddr,
	input	[31:0]	iWriteData,
	input			iWriteEn,
	input			iBranchPredict,
	input			iClk,
	input			iClkX2,
	input			iRst_n
);

	// Internal signals declaration
	wire	[4:0]	src0Addr, src1Addr;
	wire			src0En, src1En;
	wire			callCmd;
	reg		[31:0]	rNextPC;
	reg				rCallCmd;

	// External modules instantiation
	Control Control_0 (
		// Output
		.oAddrRead0		(src0Addr),
		.oEnRead0		(src0En),
		.oAddrRead1		(src1Addr),
		.oEnRead1		(src1En),
		.oAddrWrite		(oWriteAddr),
		.oEnWrite		(oWriteEn),
		.oExuShift		(oExuShift),
		.oExuOp			(oExuOp),
		.oAluOp			(oAluOp),
		.oMduOp			(oMduOp),
		.oFpuOp			(oFpuOp),
		.oBranchOp		(oBranchOp),
		.oBranchCmd		(oBranchCmd),
		.oJumpCmd		(oJumpCmd),
		.oAluCmd		(oAluCmd),
		.oHalt			(oHalt),
		.oMemWrite		(oMemWrite),
		.oMemValid		(oMemValid),
		.oMemToReg		(oMemToReg),
		.oCacheFlush	(oCacheFlush),
		.oZeroEn		(oZeroEn),
		.oOverflowEn	(oOverflowEn),
		.oNegativeEn	(oNegativeEn),
		.oOffset		(oOffset),
		.oCallCmd		(callCmd),
		.oRetCmd		(oRetCmd),
		.oLoadCmd		(oLoadCmd),
		.oStoreCmd		(oStoreCmd),
		.oNpuCfgOp		(oNpuCfgOp),
		.oNpuEnqOp		(oNpuEnqOp),
		.oNpuDeqOp		(oNpuDeqOp),
		.iInstruction	(iInstruction),
		.iRst_n			(iRst_n)
	);

	RegisterFile RegisterFile_0 (
		.oDataRead0		(oSrc0),
		.oDataRead1		(oSrc1),
		.iAddrRead0		(src0Addr),
		.iAddrRead1		(src1Addr),
		.iEnRead0		(src0En),
		.iEnRead1		(src1En),
		.iAddrWrite		(iWriteAddr),
		.iDataWrite		(iWriteData),
		.iEnWrite		(iWriteEn),
		.iClk			(iClk),
		.iClkX2			(iClkX2),
		.iRst_n			(iRst_n)
	);

	SignExtend SignExtend_0 (
		.oOutput		(oImmediate),
		.iInput			(iInstruction[15:0])
	);
	
	BranchAdder BranchAdder_0 (
		.oBranchAddr	(oBranchAddr),
		.iNextPC		(iNextPC),
		.iOffset		(oOffset[20:0])
	);

	// Outputs assignment
	assign oNextPC			= iNextPC;						// Bypass next program counter
	assign oMemData			= rCallCmd ? rNextPC : oSrc1;	// Output memory data to be written
	assign oCallCmd			= rCallCmd;
	assign oBranchPredict	= iBranchPredict;
	assign oInstruction		= iInstruction;

	always @ (posedge iClk) begin
		if(!iRst_n) begin
			rCallCmd	<= 0;
			rNextPC		<= 0;
		end
		else begin
			rCallCmd	<= callCmd;
			rNextPC		<= iNextPC;
		end
	end
	
endmodule
