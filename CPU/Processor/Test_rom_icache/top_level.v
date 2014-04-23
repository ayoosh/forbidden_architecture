`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:43:50 04/21/2014 
// Design Name: 
// Module Name:    top_level 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_level(
    );

wire [31:0]instr_addr, data_addr, npu_input_fifo, npu_config_fifo, instr, npu_output_fifo;
wire npu_input_fifo_we, npu_config_fifo_we, npu_output_fifo_re,npu_output_fifo_empty, npu_input_fifo_full;
wire npu_config_fifo_full,CLK0_OUT, CLK2X_OUT, rst;
reg clock,reset;

initial begin
	clock = 1;
	reset = 1;
	#50 reset =0;
end

always begin
	#5 clock = ~clock;
end

Processor P1(
	// Outputs
		.cache_addr_instr(instr_addr),    // 31..0
		.cache_addr_data(data_addr),     // 32..0
		.cache_wr_data(),      //31..0
		.cache_rw_data(),
	   .cache_valid_instr(),
		.cache_valid_data(),
		.cache_flush_data(),
		.npu_input_fifo(npu_input_fifo),     //31..0
		.npu_input_fifo_we(npu_input_fifo_we),
		.npu_config_fifo(npu_config_fifo),    //31..0
		.npu_config_fifo_we(npu_config_fifo_we),
		.npu_output_fifo_re(npu_output_fifo_re),
		.halt(),

	// Inputs
	.cache_rd_instr(instr),     //31..0
	.cache_rd_data(),     //31..0
	.cache_ready_instr(1'b1),
	.cache_ready_data(),
	.npu_output_fifo(npu_output_fifo),    //31..0
	.npu_output_fifo_empty(npu_output_fifo_empty),
	.npu_input_fifo_full(npu_input_fifo_full),
	.npu_config_fifo_full(npu_config_fifo_full),
	.clk(CLK0_OUT),
	.clk_x2(CLK2X_OUT),
	.rst_n(rst)
);

npu npu1(
     //inputs
    .CLK(CLK0_OUT),
    .RST(~rst),
    .npu_input_data(npu_input_fifo),
    .npu_input_fifo_write_enable(npu_input_fifo_we),
    .npu_config_data(npu_config_fifo[25:0]),
    .npu_config_fifo_write_enable(npu_config_fifo_we),
    .npu_output_fifo_read_enable(npu_output_fifo_re),
	 
	 //outputs
    .npu_output_data(npu_output_fifo),
    .npu_output_fifo_empty(npu_output_fifo_empty),
    .npu_input_fifo_full(npu_input_fifo_full),
    .npu_config_fifo_full(npu_config_fifo_full)
    );

I_cache cache(
	.clka(CLK0_OUT),
	.addra(instr_addr[9:0]), // Bus [9 : 0] 
	.douta(instr)); // Bus [31 : 0] 

clock instance_name (
    .CLKIN_IN(clock), 
    .RST_IN(reset), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(CLK0_OUT), 
    .CLK2X_OUT(CLK2X_OUT), 
    .LOCKED_OUT(rst)
    );

initial
#20000 $stop;

endmodule
