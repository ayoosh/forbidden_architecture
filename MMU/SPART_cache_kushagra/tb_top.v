`timescale 1ns/1ps

module top_level(
    input clk,         // 100mhz clock
    input rst,         // Asynchronous reset, tied to dip switch 0
    output txd,        // RS232 Transmit Data
    input rxd        // RS232 Receive Data
    );

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

endmodule
