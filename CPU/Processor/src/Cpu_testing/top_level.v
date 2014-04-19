`timescale 1ns/1ps

module top_level( );

wire [31:0]cache_addr_instr, npu_data, npu_data_out;
wire [31:0]dout;
wire full, ifull;
wire we, c_we, o_re, o_em;
wire [31:0]confi;
wire valid;
wire CLK0_OUT, CLK2X_OUT, CLK_IBUFG_OUT, LOCKED_OUT;
reg clk, reset, rst;

initial begin
	clk = 1'b1;
	reset = 1'b1;
	rst = 1'b1;
	#50 reset = 1'b0; 
	#400 rst = 1'b0;
end

always begin
	#5 clk = ~clk;
end


clocking1 instance_name (
    .CLKIN_IN(clk), 
    .RST_IN(reset), 
    .CLKIN_IBUFG_OUT(CLKIN_IBUFG_OUT), 
    .CLK0_OUT(CLK_OUT), 
    .CLK2X_OUT(CLK2X_OUT), 
    .LOCKED_OUT(LOCKED_OUT)
    );
	 
Processor Processor_0 (
	// Outputs
	.cache_addr_instr		(cache_addr_instr),
	.cache_addr_data		(),
	.cache_wr_data			(),
	.cache_rw_data			(),
	.cache_valid_instr		(),
	.cache_valid_data		(),
	.cache_flush_data		(),
	.npu_input_fifo			(npu_data),
	.npu_input_fifo_we		(we),
	.npu_config_fifo		(confi),
	.npu_config_fifo_we		(c_we),
	.npu_output_fifo_re		(o_re),
	.halt					(),

	// Inputs
	.cache_rd_instr			(dout),
	.cache_rd_data			(),
	.cache_ready_instr		(1'b1),
	.cache_ready_data		(1'b1),
	.npu_output_fifo		(npu_data_out),
	.npu_output_fifo_empty	(o_em),
	.npu_input_fifo_full	(ifull),
	.npu_config_fifo_full	(full),
	.clk					(CLKIN_IBUFG_OUT),
	.clk_x2					(CLK2X_OUT),
	.rst_n					(~rst)
);


I_cache icache (
	.clka(CLKIN_IBUFG_OUT),
	.rsta(rst),
	.addra(cache_addr_instr[9:0]), // Bus [9 : 0] 
	.douta(dout)); 


npu npu_test(
    .CLK (CLKIN_IBUFG_OUT),
    .RST (rst),
    .npu_input_data(npu_data),          // 31..0
    .npu_input_fifo_write_enable(we),
    .npu_config_data(confi[25:0]),           //25..0
    .npu_config_fifo_write_enable(c_we),
    .npu_output_fifo_read_enable(o_re),
    .npu_output_data(npu_data_out),        //31..0
    .npu_output_fifo_empty(o_em),
    .npu_input_fifo_full(ifull),
    .npu_config_fifo_full(full)
    );

endmodule
