`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:02 03/17/2014 
// Design Name: 
// Module Name:    npu_state_machine 
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
module npu_state_machine(
    input CLK,
    input RST,
    input [15:0] npu_state_data_in,  // NPU data in to get input and output count values
    input npu_state_output_reg_enable,
    input npu_state_input_reg_enable,
    input npu_config_fifo_empty,  // Config FIFO Empty signal
	 input npu_input_fifo_empty,
	 input npu_sched_input_fifo_read_en,
    input npu_output_fifo_full,
	 input npu_sched_output_fifo_write_en,
	 output wire npu_input_fifo_read_en,
	 output wire npu_output_fifo_write_en,
	 output reg npu_state_idle,
    output reg npu_state_stall,
    output wire npu_stall_signal_inv,
    output reg npu_state_config,
	 output reg npu_inputs_done
    );

reg [15:0] npu_input_cnt;
reg [15:0] npu_input_cnt_cur;
reg [15:0] npu_output_cnt;
reg [15:0] npu_output_cnt_cur;
reg npu_input_stall;
reg npu_output_stall;
reg npu_state_compute;

wire npu_input_cnt_equals;
wire npu_outputs_done;

assign npu_stall_signal_inv = (npu_state_compute && ~(~(npu_inputs_done || npu_input_cnt_equals) && npu_input_fifo_empty) && 
											(~npu_output_fifo_full)) ? 1 : 0;

assign npu_input_cnt_equals = (npu_input_cnt == npu_input_cnt_cur) ? 1 : 0;
assign npu_outputs_done = (npu_inputs_done && (npu_output_cnt == npu_output_cnt_cur)) ? 1 : 0;

assign npu_input_fifo_read_en = (npu_sched_input_fifo_read_en && npu_stall_signal_inv) ? 1 : 0;
assign npu_output_fifo_write_en = (npu_sched_output_fifo_write_en && npu_stall_signal_inv) ? 1 : 0;

always @(posedge CLK) begin
  if (RST) begin
    npu_state_idle <= 1;
	 npu_state_stall <= 0;
	 npu_state_compute <= 0;
	 npu_state_config <= 0;
	 npu_output_cnt <= 0;
	 npu_output_cnt_cur <= 0;
	 npu_input_stall <= 0;
    npu_output_stall <= 0;
	 npu_input_cnt <= 0;
	 npu_input_cnt_cur <= 0;
	 npu_inputs_done <= 0;
  end // RST
  
  else begin // ~RST
    if (npu_state_idle) begin
		if (~npu_input_fifo_empty) begin // From idle state, compute state takes predence and not config state
		  npu_state_idle <= 0;
		  npu_state_compute <= 1;
		end // ~npu_input_fifo_empty
		else if (~npu_config_fifo_empty) begin
		  npu_state_idle <= 0;
		  npu_state_config <= 1;
		end // ~npu_config_fifo_empty
		else begin
		// Nothing to do really
		end
	 end // npu_state_idle
	 
	 else if (npu_state_stall) begin
	   if (npu_input_stall && ~npu_input_fifo_empty) begin // Input caused stall resolved
		  npu_state_stall <= 0;
		  npu_state_compute <= 1;
		  npu_input_stall <= 0;
		end // Input caused stall resolved
		if (npu_output_stall && ~npu_output_fifo_full) begin // Output caused stall resolved
		  npu_state_stall <= 0;
		  npu_state_compute <= 1;
		  npu_output_stall <= 0;
		end // Output caused stall resolved
	 end // npu_state_stall
	 
	 else if (npu_state_compute) begin
	   
		if (npu_inputs_done) begin
	     npu_input_cnt_cur <= 0;
		  if (npu_outputs_done) begin // Cannot be true until npu_inputs_done is true too
		    npu_state_idle <= 1;
		    npu_state_compute <= 0;
		    npu_output_cnt_cur <= 0;
		    npu_inputs_done <= 0;
		  end // npu_outputs_done
	   end // npu_inputs_done
		
		if (npu_input_fifo_read_en) begin
		  npu_input_cnt_cur <= npu_input_cnt_cur + 1;
      end // npu_input_fifo_read_en
		if (npu_output_fifo_write_en) begin
		  npu_output_cnt_cur <= npu_output_cnt_cur + 1;
      end // npu_output_fifo_write_en
		
	   if (npu_input_cnt_equals) begin
		  npu_inputs_done <= 1;
		end // input_cnt_equals 
		
		if (~(npu_inputs_done || npu_input_cnt_equals) && npu_input_fifo_empty) begin // Input caused stall
		  npu_state_stall <= 1;
		  npu_state_compute <= 0;
		  npu_input_stall <= 1;
		end // Input caused stall
		
		if (npu_output_fifo_full && npu_output_fifo_write_en) begin // Output caused stall
		  npu_state_stall <= 1;
		  npu_state_compute <= 0;
		  npu_output_stall <= 1;
		end // Output caused stall
		
	 end // npu_state_compute
	 
	 else if (npu_state_config) begin  
	   if (npu_config_fifo_empty) begin
		  npu_state_config <= 0;
		  npu_state_idle <= 1;
		end // npu_config_fifo_empty
		if (npu_state_output_reg_enable) begin
		  npu_output_cnt <= npu_state_data_in;
		end // npu_state_output_reg_enable
		if (npu_state_input_reg_enable) begin
		  npu_input_cnt <= npu_state_data_in;
		end // npu_state_input_reg_enable
	 end //npu_state_config
	 
  end // ~RST	 
end // always
endmodule
