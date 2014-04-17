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

	reg		[31:0]	data_mem[4111:4096];
	reg				rd_ready, wr_ready;
	reg		[31:0]	rrd_data;
	reg				rrd_ready;

	// Model read, data is latched on clock low
	always @(negedge clk) begin
		if (valid && !rw) begin
			rrd_data		<= data_mem[addr];
			rrd_ready	<= 1'b1;
		end
		else begin
			rrd_data		<= rd_data;
			rrd_ready	<= 1'b0;
		end
	end
		
	// Model write, data is written on clock high
	always @(posedge clk) begin
		if (valid && rw) begin
			data_mem[addr]	<= wr_data;
			wr_ready		<= 1'b1;
		end
		else begin
			data_mem[addr]	<= data_mem[addr];
			wr_ready		<= 1'b0;
		end
		rd_data			<= rrd_data;
		rd_ready		<= rrd_ready;
	end

	// Outputs assignment
	assign ready = rd_ready | wr_ready;

endmodule
