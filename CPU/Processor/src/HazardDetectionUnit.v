// Timescale definition
`timescale	1ns/1ps

// Include listing

// Hazard Detection Unit module ports declaration
module HazardDetectionUnit (
	// Outputs
	output			oStall,

	// Inputs
	input	[4:0]	iIdRegRs,
	input	[4:0]	iIdRegRt,
	input	[4:0]	iExRegRt,
	input			iExMemRead,
	input			iExRetCmd,
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
	assign npuHazard	= iNpuConfigFull | iNpuInputFull | iNpuOutputEmpty;
	assign cacheHazard	= (iInstrCacheValid & ~iInstrCacheReady) | (iDataCacheValid & ~iDataCacheReady);

	// Outputs assignment
	assign oStall = dataHazard | npuHazard | cacheHazard;

endmodule