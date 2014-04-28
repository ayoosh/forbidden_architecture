// Include listing
`include	"../src/Alu.v"
`include	"../src/MultiplyDivideUnit.v"
`include	"../src/FloatingPointUnit.v"

// Execution Unit module ports declaration
module ExecutionUnit (
	// Outputs
	output	[31:0]	oExuResult,
	output			oZeroFlag,
	output			oOverflowFlag,
	output			oNegativeFlag,

	// Inputs
	input	[31:0]	iSrc0,
	input	[31:0]	iSrc1,
	input	[4:0]	iExuShift,
	input	[1:0]	iExuOp,
	input	[3:0]	iAluOp,
	input			iMduOp,
	input	[2:0]	iFpuOp,
	input			iClk
);

	// Internal parameters definition
	localparam	ALU	=	2'b00;
	localparam	MDU	=	2'b01;
	localparam	FPU	=	2'b10;

	// Internal signals declaration
	wire	[31:0]	aluResult;
	wire	[31:0]	mduResult;
	wire	[31:0]	fpuResult;
	
	reg		[1:0]	rExuOp;

	// External modules instantiation
	Alu Alu_0 (
		//Outputs
		.dst		(aluResult),
		.ov			(oOverflowFlag),
		.zr			(oZeroFlag),
		.neg		(oNegativeFlag),

		//Inputs
		.src0		(iSrc0),
		.src1		(iSrc1),
		.shamt		(iExuShift),
		.op			(iAluOp),
		.iClk		(iClk)
	);

	MultiplyDivideUnit MultplyDivideUnit_0 (
		// Outputs
		.oResult	(mduResult),

		// Inputs
		.iSrc0		(iSrc0),
		.iSrc1		(iSrc1),
		.iOperation (iMduOp),
		.iClk		(iClk)
	);

	FloatingPointUnit FloatingPointUnit_0 (
		// Outputs
		.oResult	(fpuResult),
		
		// Inputs
		.iSrc0		(iSrc0),
		.iSrc1		(iSrc1),
		.iOperation	(iFpuOp),
		.iClk		(iClk)
	);
	
	always @ (posedge iClk) begin
		rExuOp	<= iExuOp;
	end

	// Outputs assignment
	assign oExuResult	=	(rExuOp == ALU) ? aluResult :
							(rExuOp == MDU) ? mduResult :
							(rExuOp == FPU) ? fpuResult :
							32'h0000_0000;

endmodule
