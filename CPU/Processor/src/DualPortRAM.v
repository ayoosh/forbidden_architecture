// Timescale definition
`timescale	1ns/1ps

// Include listing

// Dual Port RAM module ports declaration
module DualPortRAM #(
	// External parameters
	parameter	DATA_WIDTH		= 32,
	parameter	ADDR_WIDTH		= 5
)
(
	// Outputs
	output	reg	[DATA_WIDTH-1:0]	oDataA,
	output	reg	[DATA_WIDTH-1:0]	oDataB,

	// Inputs
	input		[DATA_WIDTH-1:0]	iDataA,
	input		[ADDR_WIDTH-1:0]	iAddrA,
	input							iEnA,
	input							iWeA,
	input							iClkA,
	input		[DATA_WIDTH-1:0]	iDataB,
	input		[ADDR_WIDTH-1:0]	iAddrB,
	input							iEnB,
	input							iWeB,
	input							iClkB,
	input							iRst_n
);

	// Internal signals declaration
	reg		[DATA_WIDTH-1:0]	ram[(2**ADDR_WIDTH)-1:0];
	
	initial
		ram[0] = {DATA_WIDTH{1'b0}};

	// Internal signals assignment
	always @ (negedge iClkA) begin		// Port A: Clock A logic
		if (iEnA) begin
			oDataA <= ram[iAddrA];		// Port A: Read logic
			
			if (iWeA)
				ram[iAddrA] <= iDataA;	// Port A: Write logic
		end
	end

	always @ (negedge iClkB) begin		// Port B: Clock B logic
		if (iEnB) begin
			oDataB <= ram[iAddrB];		// Port B: Read logic
			
			if (iWeB)
				ram[iAddrB] <= iDataB;	// Port B: Write logic
		end
	end
endmodule
