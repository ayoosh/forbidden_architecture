`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:53:51 03/19/2014 
// Design Name: 
// Module Name:    npu_compute_unit 
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
module npu_compute_unit(
    input CLK,
    input npu_rst,
    input npu_state_compute,
    input [15:0] npu_config_data,
    input npu_offset_buf_write_en,
    input npu_wbuf0_wren,
    input npu_wbuf1_wren,
    input npu_wbuf2_wren,
    input npu_wbuf3_wren,
    input npu_wbuf4_wren,
    input npu_wbuf5_wren,
    input npu_wbuf6_wren,
    input npu_wbuf7_wren,
    input npu_sched_sigmoid_fifo_read_en,
    input npu_sched_sigmoid_fifo_write_en,
    input [2:0] npu_sched_pe_select_in,
    input [15:0] npu_pe_input_data_bus,
    input npu_sched_pe_write_en,
    input npu_sched_acc_fifo_read_en,
    input npu_sched_acc_fifo_write_en,
    input [2:0] npu_sched_sigmoid_input_sel_pe,
    input npu_sched_sigmoid_input_en,
    output [47:0] npu_pe_acc_dout
    );
  
  wire [15:0] npu_w0_data;
  wire [15:0] npu_w1_data;
  wire [15:0] npu_w2_data;
  wire [15:0] npu_w3_data;
  wire [15:0] npu_w4_data;
  wire [15:0] npu_w5_data;
  wire [15:0] npu_w6_data;
  wire [15:0] npu_w7_data;
  
  wire [47:0] npu_pe_acc_val_flowing_out0;
  wire [47:0] npu_pe_acc_val_flowing_out1;
  wire [47:0] npu_pe_acc_val_flowing_out2;
  wire [47:0] npu_pe_acc_val_flowing_out3;
  wire [47:0] npu_pe_acc_val_flowing_out4;
  wire [47:0] npu_pe_acc_val_flowing_out5;
  wire [47:0] npu_pe_acc_val_flowing_out6;
  wire [47:0] npu_pe_acc_val_flowing_out7;
  
  wire [47:0] npu_pe_acc_val_dout0;
  wire [47:0] npu_pe_acc_val_dout1;
  wire [47:0] npu_pe_acc_val_dout2;
  wire [47:0] npu_pe_acc_val_dout3;
  wire [47:0] npu_pe_acc_val_dout4;
  wire [47:0] npu_pe_acc_val_dout5;
  wire [47:0] npu_pe_acc_val_dout6;
  wire [47:0] npu_pe_acc_val_dout7;
  
  npu_circ_buf_large npu_wbuf0(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_wbuf0_wren, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_w0_data // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );
  npu_circ_buf_large npu_wbuf1(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_wbuf1_wren, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_w1_data // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );
  npu_circ_buf_large npu_wbuf2(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_wbuf2_wren, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_w2_data // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );
  npu_circ_buf_large npu_wbuf3(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_wbuf3_wren, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_w3_data // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );
  npu_circ_buf_large npu_wbuf4(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_wbuf4_wren, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_w4_data // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );
  npu_circ_buf_large npu_wbuf5(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_wbuf5_wren, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_w5_data // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );
  npu_circ_buf_large npu_wbuf6(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_wbuf6_wren, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_w6_data // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );
  npu_circ_buf_large npu_wbuf7(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_state_compute, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_wbuf7_wren, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_w7_data // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );

  npu_proc_eng npu_pe0(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
    , // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w0_data, // input [15:0] npu_pe_weight_in,  // Weight input
    , // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
    npu_pe_acc_val_flowing_out0, // output reg [47:0] npu_pe_acc_val, // output of this PE for next PE or Acc FIFO
	 npu_pe_acc_val_dout0 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
endmodule
