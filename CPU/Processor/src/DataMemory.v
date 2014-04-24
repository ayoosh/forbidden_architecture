/* Data memory.  Single ported, can read or write but
not both in a single cycle.  Precharge on clock
high, read/write on clock low. */

module DataMemory (
	output	reg	[31:0]	rd_data,	//output of data memory
	output				ready,

	input		[31:0]	addr,
	input		[31:0]	wr_data,	// data to be written
	input				rw,
	input				valid,
	input				clk
);

	reg		[31:0]	data_mem[15:0];
	reg				rd_ready, wr_ready;
	
	initial			data_mem[1] = 32'h1;

	// Model read, data is latched on clock low
	always @(posedge clk) begin
		if (valid && !rw && !rd_ready) begin
			rd_data		<= data_mem[addr];
			rd_ready	<= 1'b1;
		end
		else begin
			rd_data		<= rd_data;
			rd_ready	<= 1'b0;
		end
	end
		
	// Model write, data is written on clock high
	always @(posedge clk) begin
		if (valid && rw && !wr_ready) begin
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
