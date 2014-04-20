// Timescale definition
`timescale	1ns/1ps

// Include listing

// Hazard Detection Unit module ports declaration
module HazardDetectionUnit (
	// Outputs
	output			oFullStall,
	output			oSemiStall,

	// Inputs
	input	[4:0]	iIdRegRs,
	input	[4:0]	iIdRegRt,
	input	[4:0]	iExRegRt,
	input			iExMemRead,
	input			iExRetCmd,
	input			iExNpuCfgOp,
	input			iExNpuEnqOp,
	input			iExNpuDeqOp,
	input			iNpuConfigFull,
	input			iNpuInputFull,
	input			iNpuOutputEmpty,
	input			iInstrCacheValid,
	input			iDataCacheValid,
	input			iInstrCacheReady,
	input			iDataCacheReady
);

	wire			dataHazard;
	wire			npuHazard;
	wire			cacheHazard;
	
	// Internal signals assigment
	assign dataHazard	= iExMemRead & ~iExRetCmd & ((iExRegRt == iIdRegRs) | (iExRegRt == iIdRegRt));
	assign npuHazard	= (iExNpuCfgOp & iNpuConfigFull) | (iExNpuEnqOp & iNpuInputFull) | (iExNpuDeqOp & iNpuOutputEmpty);
	assign cacheHazard	= (iInstrCacheValid & ~iInstrCacheReady) | (iDataCacheValid & ~iDataCacheReady);

	// Outputs assignment
	assign oSemiStall = dataHazard;
	assign oFullStall = npuHazard | cacheHazard;

endmodule
