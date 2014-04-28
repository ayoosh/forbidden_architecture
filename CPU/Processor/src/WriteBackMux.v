// Include listing

// Write-Back Multiplexer module ports declaration
module WriteBackMux (
	// Outputs
	output	[31:0]	oWriteData,
	
	// Inputs
	input	[31:0]	iMemData,
	input	[31:0]	iExuData,
	input			iMemToReg,
	input			iRetCmd
);

	wire	[31:0]	retData;

	// Internal signals assignment
	assign retData = iExuData + 1;
	
	// Outputs assignment
	assign oWriteData = iMemToReg ? iMemData : 
						iRetCmd ? retData :
						iExuData;

endmodule
