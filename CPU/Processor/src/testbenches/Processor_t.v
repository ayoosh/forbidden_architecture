// Timescale definition
`timescale	1ns/1ps

// Include listing
`include	"../src/Processor.v"
`include	"../src/InstructionMemory.v"
`include	"../src/DataMemory.v"

// Processor testbench
module Processor_t();

	localparam	DELAY		= 1;
	localparam	CLK_DELAY	= 2*DELAY;
	localparam	RST_DELAY	= 10*CLK_DELAY;

	// Simulation signal
	reg				Clk, ClkX2, Rst_n;
	wire			Halt;
	integer			i;

	// Connection signals
	wire	[31:0]	addrICache, addrDCache, writeDCache;
	wire			rwDCache, validICache, validDCache, flushDCache;
	wire	[31:0]	inputNPU, configNPU;
	wire			weInputNPU, weConfigNPU, reOutputNPU;

	wire	[31:0]	readICache, readDCache;
	wire			readyICache, readyDCache;
	reg		[31:0]	outputNPU;
	reg				emptyOutputNPU, fullInputNPU, fullConfigNPU;

	Processor Processor_0 (
		// Outputs
		.cache_addr_instr		(addrICache),
		.cache_addr_data		(addrDCache),
		.cache_wr_data			(writeDCache),
		.cache_rw_data			(rwDCache),
		.cache_valid_instr		(validICache),
		.cache_valid_data		(validDCache),
		.cache_flush_data		(flushDCache),
		.npu_input_fifo			(inputNPU),
		.npu_input_fifo_we		(weInputNPU),
		.npu_config_fifo		(configNPU),
		.npu_config_fifo_we		(weConfigNPU),
		.npu_output_fifo_re		(reOutputNPU),
		.halt					(Halt),

		// Inputs
		.cache_rd_instr			(readICache),
		.cache_rd_data			(readDCache),
		.cache_ready_instr		(readyICache),
		.cache_ready_data		(readyDCache),
		.npu_output_fifo		(outputNPU),
		.npu_output_fifo_empty	(emptyOutputNPU),
		.npu_input_fifo_full	(fullInputNPU),
		.npu_config_fifo_full	(fullConfigNPU),
		.clk					(Clk),
		.clk_x2					(ClkX2),
		.rst_n					(Rst_n)
	);

	InstructionMemory InstructionMemory_0 (
		.instr					(readICache),
		.ready					(readyICache),
		.addr					(addrICache),
		.rd_en					(validICache),
		.clk					(Clk)
	);

	DataMemory	DataMemory_0 (
		.rd_data				(readDCache),
		.ready					(readyDCache),
		.addr					(addrDCache),
		.wr_data				(writeDCache),
		.rw						(rwDCache),
		.valid					(validDCache),
		.clk					(Clk)
	);

	initial begin
		$dumpfile("Processor_t.vcd");
		$dumpvars(0, Processor_t);
	end

	// Reset Execution
	initial begin
		Rst_n			= 1'b0;

		outputNPU		= 32'h0000_0000;
		emptyOutputNPU	= 1'b0;
		fullInputNPU	= 1'b0;
		fullConfigNPU	= 1'b0;

		#RST_DELAY Rst_n = 1'b1;
	end
	
	// Main Execution
	initial begin
		Clk				= 1'b0;
		ClkX2			= 1'b0;

		for (i = 0; i < RST_DELAY; i = i + 1)
			clockPulse;

		while (!Halt) begin
			clockPulse;
			clockPulse;
		end
		
		clockPulse;
		clockPulse;
	end

	// Clock Generator task
	task clockPulse;
		begin
			ClkX2 = ~ClkX2;
			Clk = ~Clk;
			#DELAY;
			ClkX2 = ~ClkX2;
			#DELAY;
		end
	endtask

endmodule
