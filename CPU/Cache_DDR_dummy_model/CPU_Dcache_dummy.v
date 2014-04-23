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
module CPU_Dcache_dummy #(
      parameter CYCLE_DELAY = 3
		)
(
		input clk,
		input rst,
		
	output  	   [31:0] mem_data_wr1,
								// Input data from cache
								
	input   [31:0] mem_data_rd1,
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

	reg [255:0] temp_mem [0:15];
	reg [255:0] temp_mem_addr [0:15];
	reg [31:0] cycle_count;
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
			temp_mem[0] <= 32'h010000FF;   // Start Address, that's where its written
			temp_mem[1] <= 32'h000AAAAA;
			temp_mem[2] <= 32'h010BBBBB;  // Display on
			temp_mem[3] <= 32'h12345678;
			temp_mem[4] <= 32'h88887777;  // Display on
			temp_mem[5] <= 32'h01112222;  // Writing wrong address
			temp_mem[6] <= 32'h22223333;   // Display on
			temp_mem[7] <= 32'h55556666;
			temp_mem[8] <= 32'h77778888;  // Display on
			temp_mem[9] <= 32'h010AB0FF;   // Start Address, that's where its written
			temp_mem[10] <= 32'h111AAAAA;
			temp_mem[11] <= 32'h010CCCCC;  // Display on
			temp_mem[12] <= 32'h1DEDEDED;
			temp_mem[13] <= 32'h00001234;  // Display on
			temp_mem[14] <= 32'h34563456;  // Writing wrong address
			temp_mem[15] <= 32'h34569876;   // Display on			
			
			
			temp_mem_addr[0] <= 28'h000_0008;
			temp_mem_addr[1] <= 28'h100_0008; // Same index, different tag write then read
			temp_mem_addr[2] <= 28'h100_0009;
			temp_mem_addr[3] <= 28'h100_000B;
			temp_mem_addr[4] <= 28'h100_000F;
			temp_mem_addr[5] <= 28'h000_000C; 
			temp_mem_addr[6] <= 28'h000_000D;
			temp_mem_addr[7] <= 28'h200_0030;  // Same index, different tag write then read
			temp_mem_addr[8] <= 28'h230_0030;
			temp_mem_addr[9] <= 28'h000_0009;  // Eviction
			temp_mem_addr[10] <= 28'h120_0008; // Same index, different tag write then read
			temp_mem_addr[11] <= 28'h120_0009;
			temp_mem_addr[12] <= 28'h130_000B;
			temp_mem_addr[13] <= 28'h130_000F;
			temp_mem_addr[14] <= 28'h210_0031; 
			temp_mem_addr[15] <= 28'h240_0032;
			
			mem_rw_data1 <= 1;
			mem_valid_data1 <= 1;   // Starting with write command
			cycle_count <= 32'd0;
			enable_cycle <= 0;
		end
		else
		begin
			if(rom_addr == 6'd15 && (mem_ready_data1 | enable_cycle) )
				begin
				
				if(cycle_count == CYCLE_DELAY)
					begin
					mem_valid_data1 <= 1;
					cycle_count <= 32'd0;
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
					cycle_count <= 32'd0;
					enable_cycle <= 0;
					if(mem_ready_count == 2)  // Write and then read
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
