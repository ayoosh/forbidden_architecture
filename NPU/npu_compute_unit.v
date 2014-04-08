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
    input npu_config_offset_buf_write_en,
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
    input [15:0] npu_input_fifo_data_bus,
	 input [15:0] npu_sigmoid_out_data_bus,
    input npu_sched_pe_write_en,
    input npu_sched_acc_fifo_read_en,
    input npu_sched_acc_fifo_write_en,
    input [2:0] npu_sched_sigmoid_input_sel_pe,
	 input npu_offset_bram_read_en,
    output [47:0] npu_pe_dout
    );
  
  wire [15:0] npu_w0_data;
  wire [15:0] npu_w1_data;
  wire [15:0] npu_w2_data;
  wire [15:0] npu_w3_data;
  wire [15:0] npu_w4_data;
  wire [15:0] npu_w5_data;
  wire [15:0] npu_w6_data;
  wire [15:0] npu_w7_data;
  
  wire [47:0] npu_pe_acc_val_dout0;
  wire [47:0] npu_pe_acc_val_dout1;
  wire [47:0] npu_pe_acc_val_dout2;
  wire [47:0] npu_pe_acc_val_dout3;
  wire [47:0] npu_pe_acc_val_dout4;
  wire [47:0] npu_pe_acc_val_dout5;
  wire [47:0] npu_pe_acc_val_dout6;
  wire [47:0] npu_pe_acc_val_dout7;
  
  wire npu_pe_new_indata_en0;
  wire npu_pe_new_indata_en1;
  wire npu_pe_new_indata_en2;
  wire npu_pe_new_indata_en3;
  wire npu_pe_new_indata_en4;
  wire npu_pe_new_indata_en5;
  wire npu_pe_new_indata_en6;
  wire npu_pe_new_indata_en7;
  
  assign npu_pe_new_indata_en0 = (npu_sched_pe_write_en && (npu_sched_pe_select_in == 0)) ? 1 : 0;
  assign npu_pe_new_indata_en1 = (npu_sched_pe_write_en && (npu_sched_pe_select_in == 1)) ? 1 : 0;
  assign npu_pe_new_indata_en2 = (npu_sched_pe_write_en && (npu_sched_pe_select_in == 2)) ? 1 : 0;
  assign npu_pe_new_indata_en3 = (npu_sched_pe_write_en && (npu_sched_pe_select_in == 3)) ? 1 : 0;
  assign npu_pe_new_indata_en4 = (npu_sched_pe_write_en && (npu_sched_pe_select_in == 4)) ? 1 : 0;
  assign npu_pe_new_indata_en5 = (npu_sched_pe_write_en && (npu_sched_pe_select_in == 5)) ? 1 : 0;
  assign npu_pe_new_indata_en6 = (npu_sched_pe_write_en && (npu_sched_pe_select_in == 6)) ? 1 : 0;
  assign npu_pe_new_indata_en7 = (npu_sched_pe_write_en && (npu_sched_pe_select_in == 7)) ? 1 : 0;
  
  assign npu_pe_dout = ((npu_sched_sigmoid_input_sel_pe == 0) ? npu_pe_acc_val_dout0 :
                       ((npu_sched_sigmoid_input_sel_pe == 1) ? npu_pe_acc_val_dout1 :
					        ((npu_sched_sigmoid_input_sel_pe == 2) ? npu_pe_acc_val_dout2 :
					        ((npu_sched_sigmoid_input_sel_pe == 3) ? npu_pe_acc_val_dout3 :
					        ((npu_sched_sigmoid_input_sel_pe == 4) ? npu_pe_acc_val_dout4 :
					        ((npu_sched_sigmoid_input_sel_pe == 5) ? npu_pe_acc_val_dout5 :
					        ((npu_sched_sigmoid_input_sel_pe == 6) ? npu_pe_acc_val_dout6 : npu_pe_acc_val_dout7)))))));
					 
  wire [47:0] npu_accum_fifo_dout;
  wire [15:0] npu_offset_bram_dout;
  wire [47:0] npu_pe0_cin;
  assign npu_pe0_cin = npu_sched_acc_fifo_read_en ? npu_accum_fifo_dout : {{25{npu_offset_bram_dout[15]}}, npu_offset_bram_dout[15:0], 7'd0};
  
  wire [15:0] npu_sigmoid_fifo_dout;
  wire [15:0] npu_pe_input_data_bus;
  reg  npu_sched_sigmoid_fifo_read_en_delayed;
  assign npu_pe_input_data_bus = npu_sched_sigmoid_fifo_read_en_delayed ? npu_sigmoid_fifo_dout : npu_input_fifo_data_bus;
  
  npu_circ_buf_small npu_offset_bram(
	 CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 npu_offset_bram_read_en, // input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    npu_config_offset_buf_write_en, // input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    npu_config_data, // input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    npu_offset_bram_dout // output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );
	 
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
    npu_pe_new_indata_en0, // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w0_data, // input [15:0] npu_pe_weight_in,  // Weight input
    npu_pe0_cin, // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
	 npu_pe_acc_val_dout0 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
  npu_proc_eng npu_pe1(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
    npu_pe_new_indata_en1, // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w1_data, // input [15:0] npu_pe_weight_in,  // Weight input
    npu_pe_acc_val_dout0, // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
	 npu_pe_acc_val_dout1 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
  npu_proc_eng npu_pe2(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
    npu_pe_new_indata_en2, // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w2_data, // input [15:0] npu_pe_weight_in,  // Weight input
    npu_pe_acc_val_dout1, // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
	 npu_pe_acc_val_dout2 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
  npu_proc_eng npu_pe3(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
    npu_pe_new_indata_en3, // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w3_data, // input [15:0] npu_pe_weight_in,  // Weight input
    npu_pe_acc_val_dout2, // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
	 npu_pe_acc_val_dout3 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
  npu_proc_eng npu_pe4(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
    npu_pe_new_indata_en4, // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w4_data, // input [15:0] npu_pe_weight_in,  // Weight input
    npu_pe_acc_val_dout3, // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
	 npu_pe_acc_val_dout4 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
  npu_proc_eng npu_pe5(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
    npu_pe_new_indata_en5, // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w5_data, // input [15:0] npu_pe_weight_in,  // Weight input
    npu_pe_acc_val_dout4, // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
	 npu_pe_acc_val_dout5 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
  npu_proc_eng npu_pe6(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
    npu_pe_new_indata_en6, // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w6_data, // input [15:0] npu_pe_weight_in,  // Weight input
    npu_pe_acc_val_dout5, // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
	 npu_pe_acc_val_dout6 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
  npu_proc_eng npu_pe7(
    CLK,  // Global 100 Mhz clock
    npu_rst,  // npu level active high synchronous reset. global reset || npu config change
    npu_pe_new_indata_en7, // input npu_pe_new_input_wren, // new input needs to be stored into the PE
	 npu_state_compute, // input npu_pe_en,  // Active high enable signal to PE.
    npu_pe_input_data_bus, // input [15:0] npu_pe_data_in,  // Data input, to be registered inside PE
    npu_w7_data, // input [15:0] npu_pe_weight_in,  // Weight input
    npu_pe_acc_val_dout6, // input [47:0] npu_pe_acc_in, // Flowing accumulated value or the offset input for first PE
	 npu_pe_acc_val_dout7 // output reg [47:0] npu_pe_acc_output // output of this PE for Sigmoid Unit
    );
	 
  // Accumulator FIFO
  // Empty and Full signals and not checked. Read / Write should happen properly by design.
  npu_accum_fifo npu_accum_fifo (
    .clk(CLK), // input clk
    .rst(npu_rst), // input rst
    .din(npu_pe_acc_val_dout7), // input [47 : 0] din
    .wr_en(npu_sched_acc_fifo_write_en), // input wr_en
    .rd_en(npu_sched_acc_fifo_read_en), // input rd_en
    .dout(npu_accum_fifo_dout), // output [47 : 0] dout
    .full(), // output full
    .empty() // output empty
    );

  // Sigmoid FIFO
  // Empty and Full signals and not checked. Read / Write should happen properly by design.	 
  npu_sigmoid_fifo npu_sigmoid_fifo (
  .clk(CLK), // input clk
  .rst(npu_rst), // input rst
  .din(npu_sigmoid_out_data_bus), // input [15 : 0] din
  .wr_en(npu_sched_sigmoid_fifo_write_en), // input wr_en
  .rd_en(npu_sched_sigmoid_fifo_read_en), // input rd_en
  .dout(npu_sigmoid_fifo_dout), // output [15 : 0] dout
  .full(), // output full
  .empty() // output empty
  );

always @(posedge CLK) begin
	if (npu_rst) begin
		npu_sched_sigmoid_fifo_read_en_delayed <= 0;
	end else if (npu_state_compute) begin
		npu_sched_sigmoid_fifo_read_en_delayed <= npu_sched_sigmoid_fifo_read_en;
	end
end
endmodule

