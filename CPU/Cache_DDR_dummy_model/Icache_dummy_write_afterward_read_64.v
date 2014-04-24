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
      parameter CYCLE_DELAY = 0
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

	reg [255:0] temp_mem [0:35];
	reg [255:0] temp_mem_addr [0:35];
	reg [5:0] cycle_count;
   reg  enable_cycle;	
	reg [5:0] rom_addr;
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
			rom_addr <= 6'd0;
			temp_mem[0] <= 256'h0A0A_0B0B__ABCD_EF12__6666_5555__BDC1_4444__1234_5678__ADAD_BABA__5885_0990__3FBA_BAF1;
			temp_mem[1] <= 256'h1111_1111__2222_2222__3333_3333__4444_4444__5555_5555__6666_6666__7777_7777__8888_8888;
			temp_mem[2] <= 256'h100040C0100040C8900040D0900040D8440030E0900030E8100030F0100030F8;
			temp_mem[3] <= 256'h660040C0100040C8900040D0900040D8980030E0900030E8100030F0100030F8;
			temp_mem[4] <= 256'hA00060C0200060C8200060D0A00060D8660050E0A00050E8A00050F0200050F8;
			temp_mem[5] <= 256'h110060C0200060C8200060D0A00060D8200050E0A00050E8A00050F0200050F8;
			temp_mem[6] <= 256'h300080C0B00080C8B00080D0300080D8DD0070E0300070E8300070F0B00070F8;
			temp_mem[7] <= 256'h330080C0B00080C8B00080D0300080D8B00070E0300070E8300070F0B00070F8;
			temp_mem[8] <= 256'h11111111000000001111111100000000FF111111000000001111111100000000;
			temp_mem_addr[0] <= 31'h000_0008;
			temp_mem_addr[1] <= 31'h100_0008;
			temp_mem_addr[2] <= 31'h200_0030;
			temp_mem_addr[3] <= 31'h230_0030;
			temp_mem_addr[4] <= 31'h120_0008;
			temp_mem_addr[5] <= 31'h130_0000;
			temp_mem_addr[6] <= 31'h300_1030;
			temp_mem_addr[7] <= 31'h210_0030;
			temp_mem_addr[8] <= 31'h240_0030;
	
			 temp_mem_addr[9] <= 31'h000_0108;
			temp_mem_addr[10] <= 31'h100_0108;
			temp_mem_addr[11] <= 31'h200_0130;
			temp_mem_addr[12] <= 31'h230_0130;
			temp_mem_addr[13] <= 31'h120_0108;
			temp_mem_addr[14] <= 31'h130_0100;
			temp_mem_addr[15] <= 31'h300_1130;
			temp_mem_addr[16] <= 31'h210_0130;
			temp_mem_addr[17] <= 31'h240_0130;

			temp_mem_addr[18] <= 31'h000_1008;
			temp_mem_addr[19] <= 31'h100_1008;
			temp_mem_addr[20] <= 31'h200_1030;
			temp_mem_addr[21] <= 31'h230_1030;
			temp_mem_addr[22] <= 31'h120_1008;
			temp_mem_addr[23] <= 31'h130_1000;
			temp_mem_addr[24] <= 31'h300_1030;
			temp_mem_addr[25] <= 31'h210_1030;
			temp_mem_addr[26] <= 31'h240_1030;

			temp_mem_addr[27] <= 31'h001_1108;
			temp_mem_addr[28] <= 31'h101_1108;
			temp_mem_addr[29] <= 31'h201_1130;
			temp_mem_addr[30] <= 31'h231_1130;
			temp_mem_addr[31] <= 31'h121_1108;
			temp_mem_addr[32] <= 31'h131_1100;
			temp_mem_addr[33] <= 31'h301_1130;
			temp_mem_addr[34] <= 31'h211_1130;
			temp_mem_addr[35] <= 31'h241_1130;			
			
			mem_rw_data1 <= 1;
			mem_valid_data1 <= 1;   // Starting with write command
			cycle_count <= 0;
			enable_cycle <= 0;
		end
		else
		begin
			if(rom_addr == 6'd35 && (mem_ready_data1 | enable_cycle) )
				begin
				
				if(cycle_count == CYCLE_DELAY)
					begin
					mem_valid_data1 <= 1;
					cycle_count <= 0;
					enable_cycle <= 0;
					if(mem_ready_count == 1)  // Last Command was read, so now write
						begin
						mem_rw_data1 <= 1;
						rom_addr <= 6'd0;
						end
					else if(mem_ready_count == 2)
						begin
						mem_rw_data1 <= 0;
						rom_addr <= 6'd0;
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
