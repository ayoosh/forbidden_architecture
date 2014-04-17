`timescale 1ns/1ps

module top_level(
    input clk,         // 100mhz clock
    input rst,         // Asynchronous reset, tied to dip switch 0
    output txd,        // RS232 Transmit Data
    input rxd        // RS232 Receive Data
    );
	
	wire   [31:0] mem_data_wr1;
								// Input data from cache
								
	wire   [31:0] mem_data_rd1;
								// Output the data to cache
								
    wire     [27:0]  mem_data_addr1;
								// DDR2 address from cache to read/write the data from/to
								
	wire      mem_rw_data1;
	                     // To indicate read/write command from cache
								
	wire      mem_valid_data1;
	                     // To indicate from cache if command is valid
								
	wire	  mem_ready_data1;

	Dcache_dummy proc (
		.clk(clk), 
		.rst(rst), 
		.mem_data_wr1(mem_data_wr1), 
		.mem_data_rd1(mem_data_rd1), 
		.mem_data_addr1(mem_data_addr1), 
		.mem_rw_data1(mem_rw_data1), 
		.mem_valid_data1(mem_valid_data1), 
		.mem_ready_data1(mem_ready_data1)
	);

// Instantiate SPART here

	spart_top_level spart_interface (
		.clk(clk),         // 100mhz clock
		.rst(rst),         // Asynchronous reset, tied to dip switch 0
		.txd(txd),        // RS232 Transmit Data
		.rxd(rxd),         // RS232 Receive Data
	
	// Clocks from DDR2 for ChipScope
//	input clk0_tb,    
//	input clk200_out,
	
	// Signals from/to SPART Cache interface
		.io_rw_data(mem_rw_data1),
		.io_valid_data(mem_valid_data1),
		.io_ready_data(mem_ready_data1),
		.mem_addr(mem_data_addr1),
		.io_rd_data(mem_data_rd1),
		.io_wr_data(mem_data_wr1)
	);

endmodule
