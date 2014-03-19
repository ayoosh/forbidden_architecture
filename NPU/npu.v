`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:53:58 03/18/2014 
// Design Name: 
// Module Name:    npu 
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
module npu(
    input CLK,
    input RST,
    input [31:0] npu_input_data,
    input npu_input_fifo_write_enable,
    input [25:0] npu_config_data,
    input npu_config_fifo_write_enable,
    input npu_output__fifo_read_enable,
    output [31:0] npu_output_data,
    output npu_output_fifo_empty,
    output npu_input_fifo_full,
    output npu_config_fifo_full
    );

  // npu_state_machine
  wire npu_input_fifo_read_en;
  wire npu_output_fifo_write_en;
  wire npu_state_idle;
  wire npu_state_stall;
  wire npu_state_compute;
  wire npu_state_config;
  wire npu_inputs_done;

  // npu_scheduler
  wire npu_sched_input_fifo_read_en;
  wire npu_sched_sigmoid_fifo_read_en;
  wire npu_sched_sigmoid_fifo_write_en;
  wire npu_sched_output_fifo_write_en;
  wire [2:0] npu_sched_pe_select_in;
  wire npu_sched_pe_write_en;
  wire npu_sched_acc_fifo_read_en;
  wire npu_sched_acc_fifo_write_en;
  wire [2:0] npu_sched_sigmoid_input_sel_pe;
  wire npu_sched_sigmoid_input_en;
  wire [1:0] npu_sched_sigmoid_function_sel;

  // npu_config_interface
  wire [15:0] npu_config_dout;
  // wire npu_config_fifo_full;
  wire npu_config_fifo_empty;
  wire npu_weight0_write_en;
  wire npu_weight1_write_en;
  wire npu_weight2_write_en;
  wire npu_weight3_write_en;
  wire npu_weight4_write_en;
  wire npu_weight5_write_en;
  wire npu_weight6_write_en;
  wire npu_weight7_write_en;
  wire npu_input_format_write_en;
  wire npu_output_format_write_en;
  wire npu_input_cnt_write_en;
  wire npu_output_cnt_write_en;
  wire npu_sched_buf_write_en;
  wire npu_offset_buf_write_en;
  wire npu_rst;

  // npu_input_interface
  wire [15:0] npu_input_interface_data_out;
  // wire npu_input_fifo_full;
  wire npu_input_fifo_empty;

  
  npu_state_machine npu_state_machine (
    CLK,
    RST,
    npu_config_dout, // input [15:0] npu_state_data_in,  // NPU data in to get input and output count values
    npu_output_cnt_write_en, // input npu_state_output_reg_enable,
    npu_input_cnt_write_en, // input npu_state_input_reg_enable,
    npu_config_fifo_empty, // input npu_config_fifo_empty,  // Config FIFO Empty signal
	 npu_input_fifo_empty, // input npu_input_fifo_empty,
	 npu_sched_input_fifo_read_en, // input npu_sched_input_fifo_read_en,
    , // input npu_output_fifo_full,
	 npu_sched_output_fifo_write_en, // input npu_sched_output_fifo_write_en,
	 npu_input_fifo_read_en,
	 npu_output_fifo_write_en,
	 npu_state_idle,
    npu_state_stall,
    npu_state_compute,
    npu_state_config,
	 npu_inputs_done
    );


  npu_scheduler npu_scheduler(
    CLK,
    npu_rst,
    npu_sched_buf_write_en, // input npu_sched_write_en,
    npu_config_dout, // input [15:0] npu_sched_din,
    npu_state_compute, // input npu_state_compute, // Becomes read enable for scheduling buffer
    npu_sched_input_fifo_read_en, // output npu_sched_input_fifo_read_en,
    npu_sched_sigmoid_fifo_read_en, // output npu_sched_sigmoid_fifo_read_en,
    npu_sched_sigmoid_fifo_write_en, // output npu_sched_sigmoid_fifo_write_en,
    npu_sched_output_fifo_write_en, // output npu_sched_output_fifo_write_en,
    npu_sched_pe_select_in, // output [2:0] npu_sched_pe_select_in,
    npu_sched_pe_write_en, // output npu_sched_pe_write_en,
    npu_sched_acc_fifo_read_en, // output npu_sched_acc_fifo_read_en,
    npu_sched_acc_fifo_write_en, // output npu_sched_acc_fifo_write_en,
    npu_sched_sigmoid_input_sel_pe, // output [2:0] npu_sched_sigmoid_input_sel_pe,
    npu_sched_sigmoid_input_en, // output npu_sched_sigmoid_input_en,
    npu_sched_sigmoid_function_sel // output [1:0] npu_sched_sigmoid_function_sel
    );
	 
	 
  npu_config_interface npu_config_interface(
    CLK, // input CKL,
    RST, // input RST,
    npu_config_data, // input [25:0] npu_config_interface_din,
    npu_config_fifo_write_enable, // input npu_config_fifo_write_en,
    npu_state_config, // input npu_config_fifo_read_en,
    npu_config_dout, // output [15:0] npu_config_dout,
	 npu_config_fifo_full, // output npu_config_fifo_full,
    npu_config_fifo_empty, // output npu_config_fifo_empty,
	 npu_weight0_write_en, // output npu_weight0_write_en,
    npu_weight1_write_en, // output npu_weight1_write_en,
    npu_weight2_write_en, // output npu_weight2_write_en,
    npu_weight3_write_en, // output npu_weight3_write_en,
    npu_weight4_write_en, // output npu_weight4_write_en,
    npu_weight5_write_en, // output npu_weight5_write_en,
    npu_weight6_write_en, // output npu_weight6_write_en,
	 npu_weight7_write_en, // output npu_weight7_write_en,
    npu_input_format_write_en, // output npu_input_format_write_en,
    npu_output_format_write_en, // output npu_output_format_write_en,
    npu_input_cnt_write_en, // output npu_input_cnt_write_en,
    npu_output_cnt_write_en, // output npu_output_cnt_write_en,
    npu_sched_buf_write_en, // output npu_sched_buf_write_en,
    npu_offset_buf_write_en, // output npu_offset_buf_write_en,
    npu_rst // output npu_rst
    );


  npu_input_interface npu_input_interface(
    CLK, //input CLK,
    npu_reset, //input RST,
    npu_input_fifo_write_enable, //input npu_input_fifo_write_en,
    npu_input_fifo_read_en, //input npu_input_fifo_read_en,
    npu_input_data, //input [32:0] npu_input_data,
    npu_input_format_write_en, //input npu_input_interface_conf_data_en,
    npu_config_dout, //input [15:0] npu_input_interface_conf_data,
    npu_input_interface_data_out, //output [15:0] npu_input_interface_data_out,
    npu_input_fifo_full, //output npu_input_fifo_full,
    npu_input_fifo_empty // output npu_input_fifo_empty
    );

endmodule
