`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:15 04/19/2014 
// Design Name: 
// Module Name:    proc_dcache_spart_top 
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
module proc_dcache_spart_top(
		input clk,
		input rst,
		
		input rxd,
		output txd

    );

	wire [31:0] io_wr_data;
	wire [31:0] io_rd_data;
	wire [27:0] mem_addr;
	wire 		io_rw_data;
	wire		io_valid_data;
	wire		io_ready_data;

	Dcache_dummy dcache
	(
		.clk(clk),
		.rst(rst),
		
		.mem_data_wr1(io_wr_data),								
		.mem_data_rd1(io_rd_data),		
		.mem_data_addr1(mem_addr),
		.mem_rw_data1(io_rw_data),
		.mem_valid_data1(io_valid_data),								
		.mem_ready_data1(io_ready_data)
		
    );
	
	spart_top_level spart_interface
	(
		.clk(clk),         // 100mhz clock
		.rst(rst),         // Asynchronous reset, tied to dip switch 0
		.txd(txd),        // RS232 Transmit Data
		.rxd(rxd),         // RS232 Receive Data
	
	// Clocks from DDR2 for ChipScope
//	input clk0_tb,    
//	input clk200_out,
	
	// Signals from/to SPART Cache interface
		.io_rw_data(io_rw_data),
		.io_valid_data(io_valid_data),
		.io_ready_data(io_ready_data),
		.mem_addr(mem_addr),
		.io_rd_data(io_rd_data),
		.io_wr_data(io_wr_data)
    );
endmodule