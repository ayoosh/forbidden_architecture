This CPU code is not final! Note that some changes may occur.

Remaining:
- Comment better the code.
- Full system test.
- Reset is active low, take care while connecting

In case of any problem or a bug found, please contact Tiago for support.
To use the Processor in any code just add the following code:

`include	"Processor.v"

Processor Processor_0 (
	// Outputs
	.cache_addr_instr		(),
	.cache_addr_data		(),
	.cache_wr_data			(),
	.cache_rw_data			(),
	.cache_valid_instr		(),
	.cache_valid_data		(),
	.cache_flush_data		(),
	.npu_input_fifo			(),
	.npu_input_fifo_we		(),
	.npu_config_fifo		(),
	.npu_config_fifo_we		(),
	.npu_output_fifo_re		(),
	.halt					(),

	// Inputs
	.cache_rd_instr			(),
	.cache_rd_data			(),
	.cache_ready_instr		(),
	.cache_ready_data		(),
	.npu_output_fifo		(),
	.npu_output_fifo_empty	(),
	.npu_input_fifo_full	(),
	.npu_config_fifo_full	(),
	.clk					(),
	.clk_x2					(),
	.rst_n					()
);

Last change: 04/17/2014