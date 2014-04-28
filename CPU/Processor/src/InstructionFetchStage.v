// Include listing
`include	"../src/JumpMux.v"
`include	"../src/ProgramCounter.v"

// Instruction Fetch Stage module ports declaration
module InstructionFetchStage (
	// Outputs
	output	[31:0]	oInstruction,
	output	[31:0]	oNextPC,
	output			oMemReady,
	output	[31:0]	oInstrMemAddress,
	output			oInstrMemValid,

	// Inputs
	input	[31:0]	iNextPC,
	input	[31:0]	iInstrMemData,
	input			iInstrMemReady,
	input	[25:0]	iOffset,
	input	[31:0]	iBranchAddr,
	input	[31:0]	iBranchMissAddr,
	input	[31:0]	iRetAddr,
	input			iBranchCmd,
	input			iBranchMissCmd,
	input			iJumpCmd,
	input			iRetCmd,
	input			iFullStall,
	input			iStall,
	input			iHalt,
	input			iClk
);

	// Internal signals declaration
	wire	[31:0]	newPC;
	wire	[31:0]	nextPC;
	wire	[31:0]	currentPC;
	reg		[31:0]	lastPC;

	// External modules instantiation
	JumpMux JumpMux_0(							// Selects the next address to program counter
		.oNewPC				(newPC),
		.iOffset			(iOffset),
		.iNextPC			(iNextPC),
		.iRetAddr			(iRetAddr),
		.iBranchAddr		(iBranchAddr),
		.iBranchMissAddr	(iBranchMissAddr),
		.iRetCmd			(iRetCmd),
		.iBranchCmd			(iBranchCmd),
		.iBranchMissCmd		(iBranchMissCmd),
		.iJumpCmd			(iJumpCmd),
		.iStall				(iStall)
	);

	ProgramCounter ProgramCounter_0(			// Generates program counter based on a address input
		.oPC		(currentPC),
		.iNextPC	(newPC),
		.iHalt		(iHalt)
	);
	
	always @ (posedge iClk) begin
		lastPC <= currentPC;
	end

	
	// Internal signals assignment
	assign nextPC			= currentPC + 1;	// Each address correspond to 32-bit instruction

	// Outputs assignment
	assign oInstrMemAddress	= iFullStall ? lastPC : currentPC;		// Request from memory a instruction
	assign oInstruction		= iInstrMemData;	// Read from memory a instruction
	assign oNextPC			= nextPC;			// Output next program counter
	assign oInstrMemValid	= 1'b1;				// Always reading instruction memory
	assign oMemReady		= iInstrMemReady;	// Output ready signal from memory

endmodule
