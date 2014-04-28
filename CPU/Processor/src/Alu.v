// Include listing

// Arithmetic Logic Unit module ports declaration
module Alu (
	//Outputs
	output	reg	[31:0]	dst,
	output				ov,
	output				zr,
	output				neg,

	//Inputs
	input		[31:0]	src0,
	input		[31:0]	src1,
	input		[4:0]	shamt,
	input		[3:0]	op,
	input				iClk
);

	// Internal parameters definition
	// Operations parameters
	localparam	ADD	= 4'b0000;
	localparam	SUB	= 4'b0001; 
	localparam	LHW	= 4'b0010;
	localparam	LLW	= 4'b0011;
	localparam	AND	= 4'b0100;
	localparam	OR	= 4'b0101;
	localparam	XOR	= 4'b0110;
	localparam	NOT	= 4'b0111;
	localparam	SLL	= 4'b1000;
	localparam	SRL	= 4'b1001;
	localparam	SRA	= 4'b1010;
	
	// Internal signals assignment
	// Control Signals
	wire Sub, ShiftLeftRight, ShiftArithmetic;
	
	assign Sub = (op == SUB); // Subtract or Add control signal
	assign ShiftLeftRight = (op == SLL) ? 1'b1 : (op == SRL) ? 1'b0 : 1'b0; // Shift Left or Right control signal
	assign ShiftArithmetic = (op == SRA); // Arithmetic shift control signal
	
	// --------------------------------------------------------------------- //

	// Adder with 2's Complement
	wire	[31:0]	A, B;
	wire	[31:0]	Sum, AdderResult;
	wire			CarryIn, CarryOut;
	
	// Adjust, if required, the input with 2's Complement
	assign	A = src0;
	assign	B = Sub ? ~src1 : src1;
	assign	CarryIn = Sub;
	
	// Perform the operation
	assign	{CarryOut, Sum} = A + B + CarryIn;
	
	// Overflow signal active only for ADD and SUB operations
	assign	ov = ((op == ADD) || (op == SUB)) ? (A[31] == B[31]) && (A[31] != Sum[31]) : 1'b0; 
	
	// Saturation logic
	assign	AdderResult = ov ? Sum[31] ? 32'h7FFF_FFFF : 32'h8000_0000 : Sum;
	
	// --------------------------------------------------------------------- //
	
	// Shifter
	wire	[31:0]	ShiftResult;
	wire	[31:0]	Shift[4:0];
	wire			ShiftMSB;
	
	assign	ShiftMSB = ShiftArithmetic & src0[31]; // Selects between Arithmetic or Logic Shift by just an AND port
	
	assign	Shift[0] = shamt[0] ? (ShiftLeftRight ? {src0[30:0], 1'h0} 		: {ShiftMSB, src0[31:1]})				: src0; // Shifts 1 position
	assign	Shift[1] = shamt[1] ? (ShiftLeftRight ? {Shift[0][29:0], 2'h0}	: {{2{ShiftMSB}}, Shift[0][31:2]})		: Shift[0]; // Shifts 2 positions
	assign	Shift[2] = shamt[2] ? (ShiftLeftRight ? {Shift[1][27:0], 4'h0}	: {{4{ShiftMSB}}, Shift[1][31:4]})		: Shift[1]; // Shifts 4 positions
	assign	Shift[3] = shamt[3] ? (ShiftLeftRight ? {Shift[2][23:0], 8'h0}	: {{8{ShiftMSB}}, Shift[2][31:8]})		: Shift[2]; // Shifts 8 positions
	assign	Shift[4] = shamt[4] ? (ShiftLeftRight ? {Shift[2][15:0], 16'h0}	: {{16{ShiftMSB}}, Shift[3][31:16]})	: Shift[3]; // Shifts 16 positions
	
	assign	ShiftResult = Shift[4]; // Return the correct shifted amount
	
	// --------------------------------------------------------------------- //
	
	// Logic AND
	wire	[31:0]	AndResult;
	
	assign	AndResult = src0 & src1; // And Operation
	
	// --------------------------------------------------------------------- //
	
	// Logic OR
	wire	[31:0]	OrResult;
	
	assign	OrResult = src0 | src1; // Or Operation
	
	// --------------------------------------------------------------------- //
	
	// Logic XOR
	wire	[31:0]	XorResult;
	
	assign	XorResult = src0 ^ src1; // Xor Operation
	
	// --------------------------------------------------------------------- //
	
	// Logic NOT
	wire	[31:0]	NotResult;
	
	assign	NotResult = ~src0; // Not Operation
	
	// --------------------------------------------------------------------- //
	
	// Load High Word
	wire	[31:0]	LHWResult;
	
	assign	LHWResult = {src1[15:0], src0[15:0]}; // Load Higher word keeping the Lower word as it is
	
	// --------------------------------------------------------------------- //
	
	// Load High Word
	wire	[31:0]	LLWResult;
	
	assign	LLWResult = {{16{src1[15]}}, src1[15:0]}; // Load Lower word with sign extended
	
	// --------------------------------------------------------------------- //
	
	// Output Multiplexer (select the correct operation result)
	always @ (posedge iClk) begin
		dst <=	(op == ADD)	? AdderResult :
				(op == SUB)	? AdderResult :
				(op == LHW)	? LHWResult :
				(op == LLW)	? LLWResult :
				(op == AND)	? AndResult :
				(op == OR)	? OrResult :
				(op == XOR)	? XorResult :
				(op == NOT)	? NotResult :
				(op == SLL)	? ShiftResult :
				(op == SRL)	? ShiftResult :
				(op == SRA)	? ShiftResult :
				32'h0000_0000;
	end
	
	assign	zr = ~|dst; // Zero flag always active
	assign	neg = dst[31];

endmodule
