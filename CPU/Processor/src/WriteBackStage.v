// Timescale definition
`timescale	1ns/1ps

// Include listing
`include	"../src/WriteBackMux.v"

// Write-Back Stage module ports declaration
module WriteBackStage (
	// Outputs
	output	[31:0]	oWriteData,
	output	[4:0]	oWriteAddr,
	output			oWriteEn,
	output			oRetCmd,
	output	[31:0]	oRetAddr,
	output			oHalt,

	// Inputs
	input	[31:0]	iMemData,
	input	[31:0]	iExuData,
	input	[4:0]	iWriteAddr,
	input			iWriteEn,
	input			iMemToReg,
	input			iRetCmd,
	input	[31:0]	iRetAddr,
	input			iHalt
);

	// External modules instantiation
	WriteBackMux WriteBackMux_0 (
		.oWriteData	(oWriteData),
		.iMemData	(iMemData),
		.iExuData	(iExuData),
		.iMemToReg	(iMemToReg),
		.iRetCmd	(iRetCmd)
	);

	// Outputs assignment
	assign oWriteAddr	= iWriteAddr;
	assign oWriteEn		= iWriteEn;
	assign oRetCmd		= iRetCmd;
	assign oRetAddr		= iRetAddr;
	assign oHalt		= iHalt;

endmodule
