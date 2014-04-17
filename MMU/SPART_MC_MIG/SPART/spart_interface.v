`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:53 04/16/2014 
// Design Name: 
// Module Name:    spart_interface 
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
module spart_interface(
   // Signals from the FPGA
	input clk,
	input rst,
	output txd, // Transmitter for RS-232
	input rxd,   // Receiver for RS-232
	
   // Connections from/to caches
    input io_rw_data,
	input io_valid_data,
	output io_ready_data,
	input [27:0] mem_addr,
	output [31:0] io_rd_data,
	input [31:0] io_wr_data
    );


	
   
   
   spart_top_level spart_driver_module(
		.clk(clk),         // 100mhz clock
		.rst(rst),         // Asynchronous reset, tied to dip switch 0
		.txd(txd),        // RS232 Transmit Data
		.rxd(rxd),         // RS232 Receive Data
	
	// Clocks from DDR2 for ChipScope
//		.clk0_tb(clk0_tb),    
//		.clk200_out(clk200_out),

	// Connections to/from cache controller.
		.io_rw_data(io_rw_data),
		.io_valid_data(io_valid_data),
		.io_ready_data(io_ready_data),
		.mem_addr(mem_addr),
		.io_rd_data(io_rd_data),
		.io_wr_data(io_wr_data)
    );
endmodule
