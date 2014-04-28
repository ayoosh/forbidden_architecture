// Include listing
`include	"../src/BranchAdder.v"
`include	"../src/AluMux.v"
`include	"../src/ForwardMux.v"
`include	"../src/ExecutionUnit.v"

// Execution Stage module ports declaration
module ExecutionStage (
	// Outputs
	output	[31:0]	oExuResult,
	output	[31:0]	oBranchAddr,
	output	[31:0]	oNextPC,
	output	reg		oZeroFlag,
	output	reg		oNegativeFlag,
	output	reg		oOverflowFlag,
	output	[2:0]	oBranchOp,
	output			oBranchCmd,
	output	[31:0]	oMemData,
	output			oMemWrite,
	output			oMemValid,
	output			oMemToReg,
	output			oCacheFlush,
	output	[4:0]	oWriteAddr,
	output			oWriteEn,
	output			oHalt,
	output	[25:0]	oOffset,
	output			oRetCmd,
	output			oBranchPredict,
	output	[31:0]	oNpuConfigFifo,
	output			oNpuConfigWe,
	output	[31:0]	oNpuDataFifo,
	output			oNpuDataWe,
	output			oNpuDataRe,
	output			oNpuCfgOp,
	output			oNpuEnqOp,

	// Inputs
	input	[31:0]	iInstruction,
	input	[31:0]	iSrc0,
	input	[31:0]	iSrc1,
	input	[31:0]	iImmediate,
	input	[31:0]	iNextPC,
	input	[4:0]	iExuShift,
	input	[31:0]	iForwardMem0,
	input	[31:0]	iForwardWb0,
	input	[1:0]	iForwardCmd0,
	input	[31:0]	iForwardMem1,
	input	[31:0]	iForwardWb1,
	input	[1:0]	iForwardCmd1,
	input	[1:0]	iExuOp,
	input	[3:0]	iAluOp,
	input			iMduOp,
	input	[2:0]	iFpuOp,
	input	[2:0]	iBranchOp,
	input			iBranchCmd,
	input			iAluCmd,
	input			iHalt,
	input	[31:0]	iMemData,
	input			iMemWrite,
	input			iMemValid,
	input			iMemToReg,
	input			iCacheFlush,
	input			iZeroEn,
	input			iNegativeEn,
	input			iOverflowEn,
	input	[4:0]	iWriteAddr,
	input			iWriteEn,
	input	[25:0]	iOffset,
	input			iRetCmd,
	input			iCallCmd,
	input			iBranchPredict,
	input	[31:0]	iBranchAddr,
	input			iNpuCfgOp,
	input			iNpuEnqOp,
	input			iNpuDeqOp,
	input	[31:0]	iNpuDataFifo,
	input			iClk,
	input			iRst_n
);

	// Internal signals declaration
	wire	[31:0]	forwardSrc0;
	wire	[31:0]	forwardSrc1;
	wire	[31:0]	aluSrc1;
	wire	[31:0]	exuResult;
	
	wire			zeroFlag, negativeFlag, overflowFlag;
	reg				zeroEn, negativeEn, overflowEn;

	// External modules declaration
	AluMux AluMux_0 (
		.oSrc			(aluSrc1),
		.iSrc			(forwardSrc1),
		.iImmediate		(iImmediate),
		.iAluCmd		(iAluCmd),
		.iCallCmd		(iCallCmd)
	);

	ForwardMux ForwardMux_0 (
		.oSrc			(forwardSrc0),
		.iSrc			(iSrc0),
		.iForwardMem	(iForwardMem0),
		.iForwardWb		(iForwardWb0),
		.iForwardCmd	(iForwardCmd0)
	);

	ForwardMux ForwardMux_1 (
		.oSrc			(forwardSrc1),
		.iSrc			(iSrc1),
		.iForwardMem	(iForwardMem1),
		.iForwardWb		(iForwardWb1),
		.iForwardCmd	(iForwardCmd1)
	);

	ExecutionUnit ExecutionUnit_0 (
		.oExuResult		(exuResult),
		.oZeroFlag		(zeroFlag),
		.oOverflowFlag	(overflowFlag),
		.oNegativeFlag	(negativeFlag),
		.iSrc0			(forwardSrc0),
		.iSrc1			(aluSrc1),
		.iExuShift		(iExuShift),
		.iExuOp			(iExuOp),
		.iAluOp			(iAluOp),
		.iMduOp			(iMduOp),
		.iFpuOp			(iFpuOp),
		.iClk			(iClk)
	);	

	always @ (posedge iClk) begin
		if (!iRst_n) begin
			oZeroFlag		<= 0;
			oNegativeFlag	<= 0;
			oOverflowFlag	<= 0;
			zeroEn			<= 0;
			negativeEn		<= 0;
			overflowEn		<= 0;
		end
		else begin
			zeroEn		<= iZeroEn;
			negativeEn	<= iNegativeEn;
			overflowEn	<= iOverflowEn;
			
			if (zeroEn)
				oZeroFlag		<= zeroFlag;
			if (negativeEn)
				oNegativeFlag	<= negativeFlag;
			if (overflowEn)
				oOverflowFlag	<= overflowFlag;
		end
	end
	
	
	
	// Outputs assignment
	assign oNextPC			= iNextPC;			// Bypass next program counter
	assign oBranchOp		= iBranchOp;		// Bypass branch opcode
	assign oBranchCmd		= iBranchCmd;		// Bypass branch command signal
	assign oMemWrite		= iMemWrite;		// Bypass data memory write signal
	assign oMemValid		= iMemValid;		// Bypass data memory valid signal
	assign oCacheFlush		= iCacheFlush;		// Bypass data cache flush signal
	assign oWriteAddr		= iWriteAddr;		// Bypass write address
	assign oWriteEn			= iWriteEn;			// Bypass write enable signal
	assign oHalt			= iHalt;			// Bypass halt signal
	assign oMemToReg		= iMemToReg;		// Bypass memory to register file signal
	assign oMemData			= iCallCmd ? iNextPC : forwardSrc1;			// Bypass write data
	assign oOffset			= iOffset;			// Bypass offset value for jump
	assign oRetCmd			= iRetCmd;			// Bypass return command signal
	assign oBranchPredict	= iBranchPredict;	// Bypass branch prediction
	assign oBranchAddr		= iBranchAddr;		// Bypass branch address

	assign oNpuConfigFifo	= iNpuCfgOp ? iInstruction : 32'h0;
	assign oNpuDataFifo		= iNpuEnqOp ? forwardSrc0 : 32'h0;
	assign oExuResult		= iNpuDeqOp ? iNpuDataFifo : exuResult;
	
	assign oNpuEnqOp		= iNpuEnqOp;
	assign oNpuCfgOp		= iNpuCfgOp;
	
	assign oNpuConfigWe		= iNpuCfgOp;
	assign oNpuDataWe		= iNpuEnqOp;
	assign oNpuDataRe		= iNpuDeqOp;
endmodule
