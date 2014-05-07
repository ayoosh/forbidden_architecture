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
      parameter CYCLE_DELAY = 1
		)
(
		input clk,
		input rst,
		
	// ROM interface
   
	input  [63:0]  rom_data,
	output reg [15:0] rom_addr,	
		
	output  	   [31:0] mem_data_wr1,
								// Input data from cache
								
	input   [31:0] mem_data_rd1,
								// Output the data to cache
								
   output       [27:0]  mem_data_addr1,
								// DDR2 address from cache to read/write the data from/to
								
	output reg               mem_rw_data1,
	                     // To indicate read/write command from cache
								
	output reg               mem_valid_data1,
	                     // To indicate from cache if command is valid
								
	input 				  mem_ready_data1,
	
	output   reg			error,
	
	output reg  flush
                        // To indicate to cache that response is ready	
    );


	reg [31:0] cycle_count;
   reg  enable_cycle;	

	reg [5:0] mem_ready_count;
	
	reg [3:0] increment_address; 
	
	reg update_write;
	reg last_address;
	reg last_command_done;
	
	assign mem_data_wr1 = rom_data[31:0];
	// This generates error
	// assign mem_data_wr1 = (rom_addr == 16'd20000 & mem_rw_data1) ? 32'hFFFFFFFF : rom_data[31:0];
 //  assign mem_data_addr1 = {8'd0,increment_address,rom_addr};
	 assign mem_data_addr1 = {12'd0,rom_addr};
		
	always @(posedge clk)
	begin
		if(rst)
		increment_address <= 4'd0;
		else if( ( (rom_addr == 16'd21000) & ~last_command_done ) && (mem_ready_data1) & (mem_ready_count == 1) )
		increment_address <= increment_address + 1;
		else
		increment_address <= increment_address;
	end
	
	//assign error = (mem_ready_data1 & mem_valid_data1 & ~mem_rw_data1) ? ( (mem_data_rd1 == temp_mem[rom_addr]) ? 0 : 1) : 1'b0;
	
	always @(posedge clk)
	begin
	if(rst)
	error <= 0;
	else
		begin
		if((mem_ready_data1 & mem_valid_data1 & ~mem_rw_data1 & ~flush) & (mem_data_rd1 != mem_data_wr1))
		error <= 1;
		else if(mem_ready_data1)
		error <= 0;
		end
	end
	
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			rom_addr <= 16'd0;
			mem_rw_data1 <= 1;
			mem_valid_data1 <= 1;   // Starting with write command
			cycle_count <= 32'd0;
			enable_cycle <= 0;
			update_write <= 0;
			last_address <= 0;
			last_command_done <= 0;
			flush <= 0;
		end
		else
		begin
			if( ( (rom_addr == 16'd21000 | last_address) & ~last_command_done ) && (mem_ready_data1 | enable_cycle) )
				begin
				
				if(mem_ready_data1)
				begin
				rom_addr <= 16'd0; 
				last_address <= 1;  // Updating so that it loops again
				end
				
				if(cycle_count == CYCLE_DELAY)
					begin


					if(mem_ready_count == 2 & ~flush & ~update_write)  // Last Command was read, so now write
						begin
						//mem_rw_data1 <= 1;
						//rom_addr <= 6'd0;

						mem_valid_data1 <= 1;
						flush <= 1;
						end
						
					else if(mem_ready_count == 2 & flush & mem_ready_data1 & ~update_write)  // Last Command was read, so now write
						begin
						mem_valid_data1 <= 0;
						flush <= 0;
						update_write <= 1;
						end
						
					else if(mem_ready_count == 1)
						begin
						mem_valid_data1 <= 1;
					   cycle_count <= 32'd0;
					   enable_cycle <= 0;
						
						mem_rw_data1 <= 1;
						//rom_addr <= 16'd0;

					   last_address <= 0;
						end
											
						
					else if(mem_ready_count == 2 & update_write)
						begin
						mem_valid_data1 <= 1;
					   cycle_count <= 32'd0;
					   enable_cycle <= 0;
						
						mem_rw_data1 <= 0;
						//rom_addr <= 16'd0;
					   last_address <= 0;	
						update_write <= 0; // Setting it back						
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

				if(mem_ready_data1)
				begin
				rom_addr <= rom_addr+1;  
				last_command_done <= 1; // Prevent above loop to execute last address immediately
				end
				
				if(cycle_count == CYCLE_DELAY)
					begin
					mem_valid_data1 <= 1;
					cycle_count <= 32'd0;
					enable_cycle <= 0;
				   last_command_done <= 0;
					if(mem_ready_count == 2)  // Write and then read
						begin
						mem_rw_data1 <= 1;
					//	rom_addr <= rom_addr+1;
						end
					else if(mem_ready_count == 1)
						begin
					//	rom_addr <= rom_addr+1;
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
	else if(mem_rw_data1 & mem_valid_data1 & ~flush) // For write increment by 2
	mem_ready_count <= 2;   // Write
	else if(~mem_rw_data1 & mem_valid_data1 & ~flush)
	mem_ready_count <= 1;  // Read
	
	end
	
	
	
endmodule