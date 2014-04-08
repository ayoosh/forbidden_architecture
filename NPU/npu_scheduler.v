`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:19 03/19/2014 
// Design Name: 
// Module Name:    npu_scheduler 
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
module npu_scheduler(
    input CLK,
    input npu_rst,
    input npu_sched_write_en,
    input [15:0] npu_sched_din,
    input npu_state_compute, // Becomes read enable for scheduling buffer
    output npu_sched_input_fifo_read_en,
    output npu_sched_sigmoid_fifo_read_en,
    output npu_sched_sigmoid_fifo_write_en,
    output npu_sched_output_fifo_write_en,
    output [2:0] npu_sched_pe_select_in,
    output npu_sched_pe_write_en,
    output npu_sched_acc_fifo_read_en,
    output npu_sched_acc_fifo_write_en,
    output [2:0] npu_sched_sigmoid_input_sel_pe,
    output npu_offset_bram_read_en,
    output [1:0] npu_sched_sigmoid_function_sel
    );

wire [15:0] npu_sched_val_cur;
wire [15:0] npu_sched_fifo_dout;

npu_circ_buf_large npu_sched_buf(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_sched_write_en, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_sched_din, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_sched_fifo_dout // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );

assign npu_sched_val_cur = npu_state_compute ? npu_sched_fifo_dout : 0;

assign npu_sched_input_fifo_read_en = npu_sched_val_cur[0];
assign npu_sched_sigmoid_fifo_read_en = npu_sched_val_cur[1];
assign npu_sched_sigmoid_fifo_write_en = npu_sched_val_cur[2];
assign npu_sched_output_fifo_write_en = npu_sched_val_cur[3];
assign npu_sched_pe_select_in[2:0] = npu_sched_val_cur[6:4];
assign npu_sched_pe_write_en = npu_sched_val_cur[7];
assign npu_sched_acc_fifo_read_en = npu_sched_val_cur[8];
assign npu_sched_acc_fifo_write_en = npu_sched_val_cur[9];
assign npu_sched_sigmoid_input_sel_pe[2:0] = npu_sched_val_cur[12:10];
assign npu_offset_bram_read_en = npu_sched_val_cur[13];
assign npu_sched_sigmoid_function_sel[1:0] = npu_sched_val_cur[15:14];

endmodule
