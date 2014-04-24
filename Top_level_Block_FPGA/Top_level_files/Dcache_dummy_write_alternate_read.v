`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:32 03/26/2014 
// Design Name: 
// Module Name:    write_data_mem 
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
module Dcache_dummy #(
      parameter CYCLE_DELAY = 1
		)
(
		input clk,
		input rst,
	
// ROM interface
   
	input  [63:0]  rom_data,
	output reg [15:0] rom_addr,
	
	output  reg	   [255:0] mem_data_wr1,
								// Input data from cache
								
	input   [255:0] mem_data_rd1,
								// Output the data to cache
								
   output  reg      [27:0]  mem_data_addr1,
								// DDR2 address from cache to read/write the data from/to
								
	output                mem_rw_data1,
	                     // To indicate read/write command from cache
								
	output reg               mem_valid_data1,
	                     // To indicate from cache if command is valid
								
	input 				  mem_ready_data1
	
                        // To indicate to cache that response is ready	
    );



   reg  read_done;	
	reg write_done;
	reg [63:0] temp_data;
   assign mem_rw_data1 = 1; // Only write for this block

	// Read from ROM block
	always @(posedge clk)
	begin
		if(rst)
			begin
			rom_addr <= 16'd0;
			read_done <= 0;   
			end
		else if(write_done & ~read_done)
			begin

			// Check for last address, if last address, read_done is always zero
			if(rom_addr == 16'd38400)
				read_done <= 0;
			else
				begin
				read_done <= 1;
				rom_addr <= rom_addr + 1;
			   temp_data <= rom_data;
				end

			end
		else if(read_done)  // read_done only for 1 cycle
		read_done <= 0;		
	end
	
	// Write to DDR block
	always @(posedge clk)
	begin
		if(rst)
			begin
			mem_data_addr1 <= 28'h3000000;
			write_done <= 1; 
         mem_valid_data1 <= 0;	
			mem_data_wr1 <= 256'd0;
			end
			
		else if(read_done & write_done)
			begin
         mem_valid_data1 <= 1;
         
			//Data
			mem_data_wr1 <= {
			24'd0, temp_data[63:56],
			24'd0, temp_data[55:48],
			24'd0, temp_data[47:40],
			24'd0, temp_data[39:32],
			24'd0, temp_data[31:24],
			24'd0, temp_data[23:16],
			24'd0, temp_data[15:8],
			24'd0, temp_data[7:0]};
			
			write_done <= 0;
			end
			
		else if(~write_done & mem_ready_data1)
			begin
			write_done <= 1;
         mem_valid_data1 <= 0;	
			mem_data_wr1 <= 256'd0;		
			mem_data_addr1 <= mem_data_addr1 + 8;	
			end
			
	//	else if(write_done)  // write_done only for 1 cycle
	//	write_done <= 0;		
		
	end

	
	
endmodule

