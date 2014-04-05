`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:35:49 03/25/2014
// Design Name:   npu_config_interface
// Module Name:   D:/Xil/NPU2/t_npu_config_interface.v
// Project Name:  NPU2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: npu_config_interface
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module t_npu_config_interface;

	// Inputs
	reg CKL;
	reg RST;
	reg [25:0] npu_config_interface_din;
	reg npu_config_fifo_write_en;
	reg npu_config_fifo_read_en;

	// Outputs
	wire [15:0] npu_config_dout;
	wire npu_config_fifo_full;
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

	// Instantiate the Unit Under Test (UUT)
	npu_config_interface uut (
		.CKL(CKL), 
		.RST(RST), 
		.npu_config_interface_din(npu_config_interface_din), 
		.npu_config_fifo_write_en(npu_config_fifo_write_en), 
		.npu_config_fifo_read_en(npu_config_fifo_read_en), 
		.npu_config_dout(npu_config_dout), 
		.npu_config_fifo_full(npu_config_fifo_full), 
		.npu_config_fifo_empty(npu_config_fifo_empty), 
		.npu_weight0_write_en(npu_weight0_write_en), 
		.npu_weight1_write_en(npu_weight1_write_en), 
		.npu_weight2_write_en(npu_weight2_write_en), 
		.npu_weight3_write_en(npu_weight3_write_en), 
		.npu_weight4_write_en(npu_weight4_write_en), 
		.npu_weight5_write_en(npu_weight5_write_en), 
		.npu_weight6_write_en(npu_weight6_write_en), 
		.npu_weight7_write_en(npu_weight7_write_en), 
		.npu_input_format_write_en(npu_input_format_write_en), 
		.npu_output_format_write_en(npu_output_format_write_en), 
		.npu_input_cnt_write_en(npu_input_cnt_write_en), 
		.npu_output_cnt_write_en(npu_output_cnt_write_en), 
		.npu_sched_buf_write_en(npu_sched_buf_write_en), 
		.npu_offset_buf_write_en(npu_offset_buf_write_en), 
		.npu_rst(npu_rst)
	);

	initial begin
		// Initialize Inputs
		CKL = 0;
		RST = 0;
		npu_config_interface_din = 0;
		npu_config_fifo_write_en = 0;
		npu_config_fifo_read_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

