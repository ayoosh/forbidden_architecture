// Timescale definition
`timescale	1ns/1ps

// Include listing

// Floating Point Unit module ports declaration
module FloatingPointUnit (
	// Outputs
	output	[31:0]	oResult,

	// Inputs
	input	[31:0]	iSrc0,
	input	[31:0]	iSrc1,
	input	[2:0]	iOperation,
	input			iClk
);

	// Internal parameters definition
	localparam	ADD		= 3'b000;
	localparam	SUB		= 3'b001;
	localparam	MULT	= 3'b010;
	localparam	DIV		= 3'b011;
	localparam	FTOI	= 3'b100;
	localparam	ITOF	= 3'b101;
	localparam	SQRT	= 3'b110;

	localparam	FPU_ADD	= 6'b00_0000;
	localparam	FPU_SUB	= 6'b00_0001;

	// Internal signals declaration
	wire	[5:0]	adderOp;

	wire	[31:0]	dataAdderResult;
	wire	[31:0]	dataMultiplierResult;
	wire	[31:0]	dataDividerResult;
	wire	[31:0]	dataFtoiResult;
	wire	[31:0]	dataItofResult;
	wire	[31:0]	dataSqrtResult;

	// External modules instantiation
	FPU_Adder FPU_Adder_0 (
		.a			(iSrc0),
		.b			(iSrc1),
		.operation	(adderOp),
		.result		(dataAdderResult),
		.clk		(iClk)
	);

	FPU_Multiplier FPU_Multiplier_0 (
		.a		(iSrc0),
		.b		(iSrc1),
		.result	(dataMultiplierResult),
		.clk	(iClk)
	);

	FPU_Divider FPU_Divider_0 (
		.a		(iSrc0),
		.b		(iSrc1),
		.result	(dataDividerResult),
		.clk	(iClk)
	);

	FPU_Ftoi FPU_Ftoi_0 (
		.a		(iSrc0),
		.result	(dataFtoiResult),
		.clk	(iClk)
	);

	FPU_Itof FPU_Itof_0 (
		.a		(iSrc0),
		.result	(dataItofResult),
		.clk	(iClk)
	);

	FPU_Sqrt FPU_Sqrt_0 (
		.a		(iSrc0),
		.result	(dataSqrtResult),
		.clk	(iClk)
	);


	// Internal signals assignment
	assign adderOp	= (iOperation == SUB) ? FPU_SUB : FPU_ADD;

	// Outputs assignment
	assign oResult	=	(iOperation == ADD)	? dataAdderResult :
						(iOperation == SUB) ? dataAdderResult :
						(iOperation == MULT) ? dataMultiplierResult :
						(iOperation == DIV) ? dataDividerResult :
						(iOperation == FTOI) ? dataFtoiResult :
						(iOperation == ITOF) ? dataItofResult :
						(iOperation == SQRT) ? dataSqrtResult :
						32'h0000_0000;

endmodule
