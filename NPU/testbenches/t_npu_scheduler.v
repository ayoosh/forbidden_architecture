`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:37:02 03/24/2014
// Design Name:   npu_scheduler
// Module Name:   D:/Xil/NPU2/t_npu_scheduler.v
// Project Name:  NPU2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_scheduler
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_npu_scheduler;

	// Inputs
	reg CLK;
	reg npu_rst;
	reg npu_sched_write_en;
	reg [15:0] npu_sched_din;
	reg npu_state_compute;
	reg [5:0]count;
		
	// Outputs
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

	// Instantiate the Unit Under Test (UUT)
	npu_scheduler uut (
		.CLK(CLK), 
		.npu_rst(npu_rst), 
		.npu_sched_write_en(npu_sched_write_en), 
		.npu_sched_din(npu_sched_din), 
		.npu_state_compute(npu_state_compute), 
		.npu_sched_input_fifo_read_en(npu_sched_input_fifo_read_en), 
		.npu_sched_sigmoid_fifo_read_en(npu_sched_sigmoid_fifo_read_en), 
		.npu_sched_sigmoid_fifo_write_en(npu_sched_sigmoid_fifo_write_en), 
		.npu_sched_output_fifo_write_en(npu_sched_output_fifo_write_en), 
		.npu_sched_pe_select_in(npu_sched_pe_select_in), 
		.npu_sched_pe_write_en(npu_sched_pe_write_en), 
		.npu_sched_acc_fifo_read_en(npu_sched_acc_fifo_read_en), 
		.npu_sched_acc_fifo_write_en(npu_sched_acc_fifo_write_en), 
		.npu_sched_sigmoid_input_sel_pe(npu_sched_sigmoid_input_sel_pe), 
		.npu_sched_sigmoid_input_en(npu_sched_sigmoid_input_en), 
		.npu_sched_sigmoid_function_sel(npu_sched_sigmoid_function_sel)
	);

	initial begin
		// Initialize Inputs
		npu_rst = 1;
		// Wait 100 ns for global reset to finish
		#50;
      npu_rst = 0; 
		// Add stimulus here
	end
	
	initial 
	CLK = 1;
	
	always
	#5 CLK = ~CLK;
		
	always@(posedge CLK)begin
	if(npu_rst)begin
		npu_sched_write_en <= 0;
		npu_sched_din <= 0;
		npu_state_compute <= 0;
		count <=0;
   end   
	else begin
		if(count <10) begin
			npu_sched_write_en <= 1;
			npu_sched_din <= $random;
			npu_state_compute <= 0;
			count <= count + 1;
		end
		else begin
			npu_sched_write_en <= 0;
			npu_sched_din <= $random;
			npu_state_compute <= 1;
		end
	end
	end
endmodule

