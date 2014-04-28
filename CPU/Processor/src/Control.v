// Include listing

// Decoder Control module ports declaration
module Control (
	//Outputs
	output	[4:0]	oAddrRead0,
	output			oEnRead0,
	output	[4:0]	oAddrRead1,
	output			oEnRead1,
	output	[4:0]	oAddrWrite,
	output			oEnWrite,
	output	[4:0]	oExuShift,
	output	[1:0]	oExuOp,
	output	[3:0]	oAluOp,
	output			oMduOp,
	output	[2:0]	oFpuOp,
	output	[2:0]	oBranchOp,
	output			oBranchCmd,
	output			oJumpCmd,
	output			oAluCmd,
	output			oHalt,
	output			oMemWrite, 
	output			oMemValid,
	output			oMemToReg,
	output			oCacheFlush,
	output			oZeroEn,
	output			oOverflowEn,
	output			oNegativeEn,
	output	[25:0]	oOffset,
	output			oCallCmd,
	output			oRetCmd,
	output			oLoadCmd,
	output			oStoreCmd,
	output			oNpuCfgOp,
	output			oNpuEnqOp,
	output			oNpuDeqOp,

	//Inputs
	input	[31:0]	iInstruction,
	input			iRst_n
);
	
	// Insternal signals declaration
	reg				zero;
	reg				negative;
	reg				overflow;

	wire	[5:0]	decode;
	wire	[2:0]	branch_op;
	wire	[4:0]	register_d;
	wire	[4:0]	register_n1;
	wire	[4:0]	register_n2;
	wire	[4:0]	shift_amount;

	// Internal parameters definition
	// Instruction Mnemonics
	localparam	ADD			= 6'b00_0000;
	localparam	SUB			= 6'b00_0001;
	localparam	LHW			= 6'b00_0010;
	localparam	LLW			= 6'b00_0011;
	localparam	AND			= 6'b00_0100;
	localparam	OR			= 6'b00_0101;
	localparam	XOR			= 6'b00_0110;
	localparam	NOT			= 6'b00_0111;
	localparam	SLL			= 6'b00_1000;
	localparam	SRL			= 6'b00_1001;
	localparam	SRA			= 6'b00_1010;
	localparam	FLUSH		= 6'b00_1100;
	localparam	BRANCH		= 6'b01_0000;
	localparam	CALL		= 6'b01_0001;
	localparam	RET			= 6'b01_0010;
	localparam	LOAD		= 6'b01_0100;
	localparam	STORE		= 6'b01_0101;
	localparam	MULT		= 6'b01_0110;
	localparam	DIV			= 6'b01_0111;
	localparam	FADD		= 6'b01_1000;
	localparam	FSUB		= 6'b01_1001;
	localparam	FMULT		= 6'b01_1010;
	localparam	FDIV		= 6'b01_1011;
	localparam	FTOI		= 6'b01_1100;
	localparam	ITOF		= 6'b01_1101;
	localparam	SQRT		= 6'b01_1110;
	localparam	HALT		= 6'b01_1111;
	localparam	ENQC		= 6'b10_0000;
	localparam	ENQD		= 6'b10_0100;
	localparam	DEQD		= 6'b10_0101;
	
	// EXU Operations parameters
	localparam	EXU_ALU		= 2'b00;
	localparam	EXU_MDU		= 2'b01;
	localparam	EXU_FPU		= 2'b10;

	// ALU Operations parameters
	localparam	ALU_ADD		= 4'b0000;
	localparam	ALU_SUB		= 4'b0001; 
	localparam	ALU_LHW		= 4'b0010;
	localparam	ALU_LLW		= 4'b0011;
	localparam	ALU_AND		= 4'b0100;
	localparam	ALU_OR		= 4'b0101;
	localparam	ALU_XOR		= 4'b0110;
	localparam	ALU_NOT		= 4'b0111;
	localparam	ALU_SLL		= 4'b1000;
	localparam	ALU_SRL		= 4'b1001;
	localparam	ALU_SRA		= 4'b1010;
	
	// FPU Operations parameters
	localparam	FPU_ADD		= 3'b000;
	localparam	FPU_SUB		= 3'b001;
	localparam	FPU_MULT	= 3'b010;
	localparam	FPU_DIV		= 3'b011;
	localparam	FPU_FTOI	= 3'b100;
	localparam	FPU_ITOF	= 3'b101;
	localparam	FPU_SQRT	= 3'b110;
	
	// Branch Operations parameter
	localparam	B_NEQ		= 3'b000;
	localparam	B_EQ		= 3'b001;
	localparam	B_GT		= 3'b010;
	localparam	B_LT		= 3'b011;
	localparam	B_GTE		= 3'b100;
	localparam	B_LTE		= 3'b101;
	localparam	B_OVFL		= 3'b110;
	localparam	B_UNCON		= 3'b111;

	// Internal signals assignment
	assign decode		= iInstruction[31:26];
	assign branch_op	= iInstruction[25:23];
	assign register_d	= iInstruction[25:21];
	assign register_n1	= iInstruction[20:16];
	assign register_n2	= iInstruction[15:11];
	assign shift_amount	= iInstruction[4:0];
	
	// Instruction Decoder
	assign	oEnWrite	= iRst_n & ~((decode == FLUSH) |
									(decode == BRANCH) |
									(decode == STORE) |
									(decode == HALT) |
									(decode == ENQC) |
									(decode == ENQD));
	assign	oAddrWrite	= ((decode == CALL) | (decode == RET)) ? 5'h01 : register_d;
	
	assign	oEnRead0	= iRst_n & ~((decode == LLW) |
									(decode == FLUSH) |
									(decode == BRANCH) |
									(decode == HALT) |
									(decode == ENQC) |
									(decode == DEQD));
	assign	oAddrRead0	= ((decode == LHW) | (decode == ENQD)) ? register_d : (((decode == CALL) | (decode == RET)) ? 5'h01 : register_n1);

	assign	oEnRead1	= iRst_n & ~((decode == LHW) |
									(decode == LLW) |
									(decode == NOT) |
									(decode == SLL) |
									(decode == SRL) |
									(decode == SRA) |
									(decode == FLUSH) |
									(decode == BRANCH) |
									(decode == LOAD) |
									(decode == CALL) |
									(decode == FTOI) |
									(decode == ITOF) |
									(decode == SQRT) |
									(decode == HALT) |
									(decode == ENQC) |
									(decode == ENQD) |
									(decode == DEQD));
	assign	oAddrRead1	= (decode == STORE) ? register_d : ((decode == LOAD) ? register_n1 :((decode == RET) ? 5'h00 : register_n2));
	
	assign	oZeroEn		= ~((decode == LHW) |
							(decode == LLW) |
							(decode == FLUSH) |
							(decode == BRANCH) |
							(decode == CALL) |
							(decode == RET) |
							(decode == LOAD) |
							(decode == STORE) |
							(decode == HALT) |
							(decode == ENQC) |
							(decode == ENQD) |
							(decode == DEQD));
	assign	oNegativeEn	= ~((decode == LHW) |
							(decode == LLW) |
							(decode == FLUSH) |
							(decode == BRANCH) |
							(decode == CALL) |
							(decode == RET) |
							(decode == LOAD) |
							(decode == STORE) |
							(decode == HALT) |
							(decode == ENQC) |
							(decode == ENQD) |
							(decode == DEQD));
	assign	oOverflowEn	= ~((decode == LHW) |
							(decode == LLW) |
							(decode == FLUSH) |
							(decode == BRANCH) |
							(decode == CALL) |
							(decode == RET) |
							(decode == LOAD) |
							(decode == STORE) |
							(decode == HALT) |
							(decode == ENQC) |
							(decode == ENQD) |
							(decode == DEQD));

	assign	oMemToReg	= iRst_n & (decode == LOAD); 
	assign	oMemValid	= iRst_n & ((decode == LOAD) | (decode == STORE) | (decode == CALL) | (decode == RET)); 
	assign	oMemWrite	= iRst_n & ((decode == STORE) | (decode == CALL));

	assign	oJumpCmd	= iRst_n & (decode == CALL);

	assign	oExuOp		= (iRst_n && !(decode == FLUSH) && (decode[5:4] == 2'b01)) ? (decode[3] ? EXU_FPU : ((decode[2:1] == 2'b11) ? EXU_MDU : EXU_ALU)) : EXU_ALU;
	assign	oExuShift	= (iRst_n & ((decode == SLL) | (decode == SRL) | (decode == SRA))) ? shift_amount : 5'h00;
	
	assign	oAluCmd		= iRst_n & ((decode == LHW) | (decode == LLW) | (decode == LOAD) | (decode == STORE) | (decode == ENQC));
	
	assign	oLoadCmd	= iRst_n & (decode == LHW);

	assign	oBranchCmd	= iRst_n & (decode == BRANCH);

	assign	oCacheFlush	= iRst_n & (decode == FLUSH);
	assign	oHalt		= iRst_n & (decode == HALT);
	
	assign	oAluOp		= ((decode == LOAD) | (decode == STORE) | (decode == CALL) | (decode == RET)) ? ALU_ADD : decode[3:0];
	assign	oFpuOp		= decode[2:0];
	assign	oBranchOp	= branch_op;
	assign	oMduOp		= decode[0];
	assign	oOffset		= iInstruction[25:0];
	
	assign	oNpuCfgOp	= iRst_n & (decode == ENQC);
	assign	oNpuEnqOp	= iRst_n & (decode == ENQD);
	assign	oNpuDeqOp	= iRst_n & (decode == DEQD);
	
	assign	oCallCmd	= iRst_n & (decode == CALL);
	assign	oRetCmd		= iRst_n & (decode == RET);
	
	assign	oStoreCmd	= iRst_n & (decode == STORE);
	
endmodule
