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
module Icache_dummy #(
      parameter CYCLE_DELAY = 50
		)
(
		input clk,
		input rst,
		
	output  	   [255:0] mem_data_wr1,
								// Input data from cache
								
	input   [255:0] mem_data_rd1,
								// Output the data to cache
								
   output        [27:0]  mem_data_addr1,
								// DDR2 address from cache to read/write the data from/to
								
	output reg               mem_rw_data1,
	                     // To indicate read/write command from cache
								
	output reg               mem_valid_data1,
	                     // To indicate from cache if command is valid
								
	input 				  mem_ready_data1,
	
	output   reg			error
                        // To indicate to cache that response is ready	
    );

	reg [255:0] temp_mem [0:8];
	reg [255:0] temp_mem_addr [0:8];
	reg [20:0] cycle_count;
   reg  enable_cycle;	
	reg [3:0] rom_addr;
	reg [5:0] mem_ready_count;
	assign mem_data_wr1 = temp_mem[rom_addr];
   assign mem_data_addr1 = temp_mem_addr[rom_addr];
	
	
	
	//assign error = (mem_ready_data1 & mem_valid_data1 & ~mem_rw_data1) ? ( (mem_data_rd1 == temp_mem[rom_addr]) ? 0 : 1) : 1'b0;
	
	always @(posedge clk)
	begin
	if(rst)
	error <= 0;
	else
		begin
		if((mem_ready_data1 & mem_valid_data1 & ~mem_rw_data1) & (mem_data_rd1 != temp_mem[rom_addr]))
		error <= 1;
		end
	end
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			rom_addr <= 4'd0;
			temp_mem[0] <= 256'h800020C0800020C8000020D0000020D8990010E0000010E8800010F0800010F8;
			temp_mem[1] <= 256'hFF0020C0800020C8000020D0000020DDD00010E0000010E8800010F0800010F8;
			temp_mem[2] <= 256'h100040C0100040C8900040D0900040D8440030E0900030E8100030F0100030F8;
			temp_mem[3] <= 256'h660040C0100040C8900040D0900040D8980030E0900030E8100030F0100030F8;
			temp_mem[4] <= 256'hA00060D0200060F8200060D0A00060D8660050E0A00050E8A00050F0200050FF;
			temp_mem[5] <= 256'h110060C0200060C8200060D0A00060D8200050E0A00050E8A00050F0200050F8;
			temp_mem[6] <= 256'h300080C0B00080C8B00080D0300080D8DD0070E0300070E8300070F0B00070F8;
			temp_mem[7] <= 256'h330080C0B00080C8B00080D0300080D8B00070E0300070E8300070F0B00070F8;
			temp_mem[8] <= 256'h11111111000000001111111100000000FF111111000000001111111100000000;
			temp_mem_addr[0] <= 31'h300_0000;
			temp_mem_addr[1] <= 31'h300_0008;
			temp_mem_addr[2] <= 31'h300_0010;
			temp_mem_addr[3] <= 31'h300_0018;
			temp_mem_addr[4] <= 31'h300_0020;
			temp_mem_addr[5] <= 31'h300_1028;
			temp_mem_addr[6] <= 31'h300_1030;
			temp_mem_addr[7] <= 31'h300_1038;
			temp_mem_addr[8] <= 31'h300_1040;
			mem_rw_data1 <= 1;
			mem_valid_data1 <= 1;   // Starting with write command
			cycle_count <= 0;
			enable_cycle <= 0;
		end
		else
		begin
			if(rom_addr == 4'd8 && (mem_ready_data1 | enable_cycle) )
				begin
				
				if(cycle_count == CYCLE_DELAY)
					begin
					mem_valid_data1 <= 1;
					cycle_count <= 0;
					enable_cycle <= 0;
					if(mem_ready_count == 1)  // Last Command was read, so now write
						begin
						mem_rw_data1 <= 1;
						rom_addr <= 4'd0;
						end
					else if(mem_ready_count == 2)
						begin
						mem_rw_data1 <= 0;
						rom_addr <= 4'd0;
						end
					end
					
					else
					begin
					mem_valid_data1 <= 0;
					mem_rw_data1 <= 0;
					enable_cycle <= 1;
					cycle_count <= cycle_count + 1;
					end
				
				end
				
			else if(mem_ready_data1 | enable_cycle )
				begin

				if(cycle_count == CYCLE_DELAY)
					begin
					mem_valid_data1 <= 1;
					cycle_count <= 0;
					enable_cycle <= 0;
					if(mem_ready_count == 2)  // Last Command was write, so now write
						begin
						mem_rw_data1 <= 1;
						rom_addr <= rom_addr+1;
						end
					else if(mem_ready_count == 1)
						begin
						rom_addr <= rom_addr+1;
						mem_rw_data1 <= 0;
						end
					end
					
					else
					begin
					mem_valid_data1 <= 0;
					mem_rw_data1 <= 0;
					enable_cycle <= 1;
					cycle_count <= cycle_count + 1;
					end				
				
				end
					
			else
			   begin
				rom_addr <= rom_addr;
				// Start with first write
				end
		end
	end
	
	
		always @(posedge clk)
	begin
   if(rst)
	mem_ready_count <= 0;
	else if(mem_rw_data1 & mem_valid_data1) // For write increment by 2
	mem_ready_count <= 2;   // Write
	else if(~mem_rw_data1 & mem_valid_data1)
	mem_ready_count <= 1;  // Read
	
	end
	
	
	
endmodule
