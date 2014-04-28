module InstructionMemory #(
	parameter			MEMORY_FILENAME = "../hex/InstructionMemory.hex"
)
(
	// Outputs
	output	reg	[31:0]	instr,	//output of insturction memory
	output	reg			ready,
	
	// Inputs
	input		[31:0]	addr,
	input				rd_en,			// asserted when instruction read desired
	input				clk
);

	reg		[31:0]	instr_mem[0:65535];

	// Memory is latched on clock low
	always @(posedge clk) begin
		if (rd_en) begin
			instr	<= instr_mem[addr];
			ready	<= 1'b1;
		end
		else begin
			instr	<= instr;
			ready	<= 1'b0;
		end
	end

	initial begin
	  $readmemh(MEMORY_FILENAME, instr_mem);
	end

endmodule
