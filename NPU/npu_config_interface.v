`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:06 03/18/2014 
// Design Name: 
// Module Name:    npu_config_interface 
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
module npu_config_interface(
    input CLK,
    input RST,
    input [25:0] npu_config_interface_din,
    input npu_config_fifo_write_en,
    input npu_config_fifo_read_en,
    output [15:0] npu_config_dout,
	 output npu_config_fifo_full,
    output npu_config_fifo_empty,
	 output npu_weight0_write_en,
    output npu_weight1_write_en,
    output npu_weight2_write_en,
    output npu_weight3_write_en,
    output npu_weight4_write_en,
    output npu_weight5_write_en,
    output npu_weight6_write_en,
	 output npu_weight7_write_en,
    output npu_input_format_write_en,
    output npu_output_format_write_en,
    output npu_input_cnt_write_en,
    output npu_output_cnt_write_en,
    output npu_sched_buf_write_en,
    output npu_offset_buf_write_en,
    output npu_rst
    );

wire [3:0] npu_config_fifo_sel;
wire [25:0] npu_config_fifo_dout;
assign npu_config_dout = npu_config_fifo_dout[15:0];
assign npu_config_fifo_sel[3:0] = npu_config_fifo_read_en ? npu_config_fifo_dout[25:22] : 4'd8;

npu_config_fifo npu_config_fifo (
  .clk(CLK), // input clk
  .srst(RST), // input srst
  .din(npu_config_interface_din), // input [25 : 0] din
  .wr_en(npu_config_fifo_write_en), // input wr_en
  .rd_en(npu_config_fifo_read_en), // input rd_en
  .dout(npu_config_fifo_dout), // output [25 : 0] dout
  .full(npu_config_fifo_full), // output full
  .empty(npu_config_fifo_empty) // output empty
);

assign npu_weight0_write_en = (npu_config_fifo_sel[3:0] == 0) ? 1 : 0;
assign npu_weight1_write_en = (npu_config_fifo_sel[3:0] == 1) ? 1 : 0;
assign npu_weight2_write_en = (npu_config_fifo_sel[3:0] == 2) ? 1 : 0;
assign npu_weight3_write_en = (npu_config_fifo_sel[3:0] == 3) ? 1 : 0;
assign npu_weight4_write_en = (npu_config_fifo_sel[3:0] == 4) ? 1 : 0;
assign npu_weight5_write_en = (npu_config_fifo_sel[3:0] == 5) ? 1 : 0;
assign npu_weight6_write_en = (npu_config_fifo_sel[3:0] == 6) ? 1 : 0;
assign npu_weight7_write_en = (npu_config_fifo_sel[3:0] == 7) ? 1 : 0;
// value 8 is missing from the spec too. Used as no val when config fifo read enable is low.
assign npu_input_format_write_en		= (npu_config_fifo_sel[3:0] == 9) ? 1 : 0;
assign npu_output_format_write_en	= (npu_config_fifo_sel[3:0] == 10) ? 1 : 0;
assign npu_input_cnt_write_en			= (npu_config_fifo_sel[3:0] == 11) ? 1 : 0;
assign npu_output_cnt_write_en		= (npu_config_fifo_sel[3:0] == 12) ? 1 : 0;
assign npu_sched_buf_write_en			= (npu_config_fifo_sel[3:0] == 13) ? 1 : 0;
assign npu_offset_buf_write_en		= (npu_config_fifo_sel[3:0] == 14) ? 1 : 0;
assign npu_rst = ((npu_config_fifo_sel[3:0] == 15) || RST) ? 1 : 0;

endmodule
