// Timescale definition
`timescale	1ns/1ps

// Include listing

// Program Counter module ports declaration
module ProgramCounter (
	// Outputs
	output	reg	[31:0]	oPC,

	// Inputs
	input		[31:0]	iNextPC,
	input				iHalt
);
	
	// Outputs assignment
	// Program counter flip-flop with reset and halt mux
	always @ (iHalt, iNextPC) begin
		if (!iHalt)
			oPC <= iNextPC;			// Update the program counter to the new one
		else
			oPC <= oPC;				// Halt operation freezes the program counter update
	end
endmodule
