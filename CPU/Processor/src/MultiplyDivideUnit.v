// Include listing

// Multiply and Divide Unit module ports declaration
module MultiplyDivideUnit (
	// Outputs
	output	[31:0]	oResult,

	// Inputs
	input	[31:0]	iSrc0,
	input	[31:0]	iSrc1,
	input			iOperation,
	input			iClk
);

	// Internal signals declaration
	reg		[63:0]	multiplierResult;
	wire	[31:0]	dividerResult;
	wire	[31:0]	fractionalResult;
	wire			dataReady;
	reg			operation;

	// Internal signals assignment
	always @ (posedge iClk) begin
		multiplierResult	<= iSrc0 * iSrc1;
	end
	
	always @ (posedge iClk) begin
		operation <= iOperation;
	end

	// Output assignment
	assign oResult = operation ? (dataReady ? dividerResult : 32'h0000_0000) : multiplierResult[63:32];
	

	// External modules instantiation
	MDU_Divider MDU_Divider_0 (
		.clk		(iClk),				// input clk
		.rfd		(dataReady),		// output rfd
		.dividend	(iSrc0),			// input [31 : 0] dividend
		.divisor	(iSrc1),			// input [31 : 0] divisor
		.quotient	(dividerResult),	// output [31 : 0] quotient
		.fractional	(fractionalResult)	// output [31 : 0] fractional
	);

endmodule
