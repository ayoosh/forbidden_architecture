// Timescale definition
`timescale	1ns/1ps

// Include listing
`include	"../src/BranchControl.v"

// Memory Stage module ports declaration
module MemoryStage (
	// Outputs
	output	[31:0]	oMemData,
	output	[31:0]	oExuData,
	output	[4:0]	oWriteAddr,
	output	[31:0]	oNextPC,
	output	[31:0]	oDataMemAddr,
	output	[31:0]	oDataMemData,
	output			oDataMemRW,
	output			oDataMemValid,
	output	[31:0]	oBranchMissAddr,
	output			oBranchCmd,
	output			oBranchMissCmd,
	output			oWriteEn,
	output			oMemReady,
	output			oMemToReg,
	output	[25:0]	oOffset,
	output			oRetCmd,
	output	[31:0]	oRetAddr,
	output			oNpuCfgOp,
	output			oNpuEnqOp,
	output			oHalt,

	// Inputs
	input	[31:0]	iExuResult,
	input	[31:0]	iDataMemData,
	input	[31:0]	iNextPC,
	input	[4:0]	iWriteAddr,
	input			iWriteEn,
	input	[31:0]	iBranchAddr,
	input	[2:0]	iBranchOp,
	input			iBranchCmd,
	input	[31:0]	iMemData,
	input			iMemWrite,
	input			iMemValid,
	input			iMemToReg,
	input			iDataMemReady,
	input			iZeroFlag,
	input			iNegativeFlag,
	input			iOverflowFlag,
	input	[25:0]	iOffset,
	input			iRetCmd,
	input			iBranchPredict,
	input			iNpuCfgOp,
	input			iNpuEnqOp,
	input			iHalt
);

	// External modules instantiation
	BranchControl BranchControl_0 (
		.oBranchCmd		(oBranchCmd),
		.iBranchOp		(iBranchOp),
		.iBranchCmd		(iBranchCmd),
		.iZeroFlag		(iZeroFlag),
		.iOverflowFlag	(iOverflowFlag),
		.iNegativeFlag	(iNegativeFlag)
	);
	
	// Outputs assignment
	assign oExuData			= iExuResult;
	assign oNextPC			= iNextPC;
	assign oDataMemAddr		= iExuResult;
	assign oDataMemData		= iMemData;
	assign oDataMemRW		= iMemWrite;
	assign oDataMemValid	= iMemValid;
	assign oWriteAddr		= iWriteAddr;
	assign oMemData			= iDataMemData;
	assign oWriteEn			= iWriteEn;
	assign oMemReady		= iDataMemReady;
	assign oMemToReg		= iMemToReg;
	assign oBranchMissAddr	= iBranchPredict ? iNextPC : iBranchAddr;
	assign oOffset			= iOffset;
	assign oRetCmd			= iRetCmd;
	assign oRetAddr			= iDataMemData;
	assign oHalt			= iHalt;
	assign oBranchMissCmd	= oBranchCmd ^ iBranchPredict;
	assign oNpuCfgOp		= iNpuCfgOp;
	assign oNpuEnqOp		= iNpuEnqOp;
	
endmodule
