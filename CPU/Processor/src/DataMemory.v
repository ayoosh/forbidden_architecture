/* Data memory.  Single ported, can read or write but
not both in a single cycle.  Precharge on clock
high, read/write on clock low. */

module DataMemory #(
	parameter			NUM_CLK_CYCLES = 0
)
(
	output	reg	[31:0]	rd_data,	//output of data memory
	output				ready,

	input		[31:0]	addr,
	input		[31:0]	wr_data,	// data to be written
	input				rw,
	input				valid,
	input				clk
);

	function integer log2(input integer value);
		begin
			value = value - 1;
			for (log2 = 0; value > 0; log2 = log2 + 1) begin
				value = value >> 1;
			end
		end
	endfunction
	
	localparam	NUM_STALL = log2(NUM_CLK_CYCLES);
	
	reg		[31:0]			data_mem[4111:0];
	reg						rd_ready, wr_ready;
	reg		[NUM_STALL-1:0]	stallCounter;
	
	wire					unstall;
	
	initial data_mem[1] = 32'h1;
	
	always @ (posedge clk) begin
		if (!valid)
			stallCounter <= 0;
		else
			stallCounter <= stallCounter + 1;
	end
	
	assign unstall = (stallCounter == NUM_CLK_CYCLES);

	// Model read, data is latched on clock low
	always @(posedge clk) begin
		if (valid && unstall && !rw && !rd_ready) begin
			rd_data		<= data_mem[addr];
			rd_ready	<= 1'b1;
		end
		else begin
			rd_data		<= 32'bx;
			rd_ready	<= 1'b0;
		end
	end
		
	// Model write, data is written on clock high
	always @(posedge clk) begin
		if (valid && unstall && rw && !wr_ready) begin
			data_mem[addr]	<= wr_data;
			wr_ready		<= 1'b1;
		end
		else begin
			data_mem[addr]	<= data_mem[addr];
			wr_ready		<= 1'b0;
		end
	end

	// Outputs assignment
	assign ready = rd_ready | wr_ready;

endmodule
