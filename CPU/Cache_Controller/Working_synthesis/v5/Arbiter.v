`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:54 04/01/2014 
// Design Name: 
// Module Name:    Arbiter 
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
module Arbiter(
   input clk,
   input reset,

   // Memory controller Interface
	
	output  [255:0]  data_wr,
	output  [30:0]   data_addr,
	input      [255:0]  data_rd,
	
	output reg          data_rden,
	output reg          data_wren,
	input               mc_rd_valid,
	input               mc_wr_rdy,
	input               mc_rd_rdy,  // Not used
   
  
								
	// Cache Interface
	// I-cache1
	input  	   [255:0] mem_data_wr1,
								// Input data from cache
								
	output reg  [255:0] mem_data_rd1,
								// Output the data to cache
								
   input       [27:0]  mem_data_addr1,
								// DDR2 address from cache to read/write the data from/to
								
	input               mem_rw_data1,
	                     // To indicate read/write command from cache
								
	input               mem_valid_data1,
	                     // To indicate from cache if command is valid
								
	output 	reg			  mem_ready_data1,
                        // To indicate to cache that response is ready	
	
	// D-cache
	
	input  	   [255:0] mem_data_wr2,
								// Input data from cache
								
	output reg  [255:0] mem_data_rd2,
								// Output the data to cache
								
   input       [27:0]  mem_data_addr2,
								// DDR2 address from cache to read/write the data from/to
								
	input               mem_rw_data2,
	                     // To indicate read/write command from cache
								
	input               mem_valid_data2,
	                     // To indicate from cache if command is valid
								
	output 	reg			  mem_ready_data2,
                        // To indicate to cache that response is ready
	
	// VGA 
	
	input  	   [255:0] mem_data_wr3,
								// Input data from cache
								
	output  reg [255:0] mem_data_rd3,
								// Output the data to cache
								
   input       [27:0]  mem_data_addr3,
								// DDR2 address from cache to read/write the data from/to
								
	input               mem_rw_data3,
	                     // To indicate read/write command from cache
								
	input               mem_valid_data3,
	                     // To indicate from cache if command is valid
								
	output   reg				  mem_ready_data3
                        // To indicate to cache that response is ready
	
    );



wire [27:0] temp_addr;
reg enable1_active;
reg enable2_active;
reg enable3_active;


// Muxing block
reg [1:0] sel;
reg mc_wr_rdy_accept;
reg mem_wr_rdy_tmp;
// 11  -- 3 Interface
// 10  -- 2 Interface
//	01  -- 1 Interface
// 00  -- send out zero	

assign data_wr = (sel[1]) ? (sel[0] ? mem_data_wr3 : mem_data_wr2) : (sel[0] ? mem_data_wr1 : 256'd0);
assign temp_addr = (sel[1]) ? (sel[0] ? mem_data_addr3 : mem_data_addr2) : (sel[0] ? mem_data_addr1 : 256'd0);

// Concatinate from 28 to 25 bits & interpolate to 31 bits
// Remove last bit & first 2 MSB
assign data_addr = {6'b0,temp_addr[25:1]};

// Assigning reg to wire

always @(posedge clk)
	begin
	if(reset)
	mc_wr_rdy_accept <= 1;
	else
	if(mc_wr_rdy_accept == 0)  // Once it becomes 0 start following mc_wr_rdy 
	// Once it become 1 it won't follow
	mc_wr_rdy_accept <= (mc_wr_rdy | mc_rd_valid);
	else
	mc_wr_rdy_accept <= mem_wr_rdy_tmp;
	
   end

always @ (posedge clk)
begin
	if(reset)
	begin
	data_rden <= 0;
	data_wren <= 0;
	sel <= 2'd0;
	enable1_active <= 0;
	enable2_active <= 0;
	enable3_active <= 0;
	
	mem_data_rd1 <= 256'd0;
	mem_data_rd2 <= 256'd0;
   mem_data_rd3 <= 256'd0;
	
	mem_ready_data1 <= 0;
	mem_ready_data2 <= 0;
	mem_ready_data3 <= 0;
	mem_wr_rdy_tmp <= 1;
	
	end
	
	else
	begin

		if(mem_valid_data1 == 1 & ~enable2_active & ~enable3_active) // Its either read or write command
		// Other two blocks are not operating
			begin
				
				if(mc_wr_rdy_accept | enable1_active)  // If memory controller ready or the process is active
		      begin
				
				// Enable active logic
				if( (mem_rw_data1 == 1)  & mc_wr_rdy  & enable1_active) // First time won't be executed
					begin
					mem_ready_data1 <= 1;
					data_wren <= 0;
					sel <= 2'b00;
					mem_wr_rdy_tmp <= 1;
					end
					
				else if(mem_ready_data1 & (mem_rw_data1 == 1))
					begin
					mem_ready_data1 <= 0;
					enable1_active <= 0;
					end
					
				else if(mem_rw_data1 == 0 & mc_rd_valid) //read command is completed, so de-assert enable
					begin
					mem_ready_data1 <= 1;
					mem_data_rd1 <= data_rd;
					data_rden <= 0;
					sel <= 2'b00;
		         mem_wr_rdy_tmp <= 1;
               end   
				else if(mem_rw_data1 == 0 & mem_ready_data1 )  // For read command it is set high
				   begin
					enable1_active <= 0;
					mem_data_rd1 <= 256'd0;
					mem_ready_data1 <= 0;
					end
					
					
				else // For write/read command, set high
					begin
					enable1_active <= 1;
					mem_wr_rdy_tmp <= 0;
					sel <= 2'b01;
					if(mem_rw_data1)
					data_wren <= 1;  
					else
					data_rden <= 1;
					end		
		
			   end  // end of mc_rd_rdy	
				
			end  // end of priority 1
			
		else if(mem_valid_data2 == 1 & ~enable1_active & ~enable3_active) 
		
			begin
				if(mc_wr_rdy_accept | enable2_active)  // If memory controller ready or the process is active
		      begin
				
				// Enable active logic
				if( (mem_rw_data2 == 1)  & mc_wr_rdy  & enable2_active) // First time won't be executed
					begin
					mem_ready_data2 <= 1;
					data_wren <= 0;
					sel <= 2'b00;
					mem_wr_rdy_tmp <= 1;
					end
					
				else if(mem_ready_data2 & (mem_rw_data2 == 1))
					begin
					mem_ready_data2 <= 0;
					enable2_active <= 0;
					end
					
				else if(mem_rw_data2 == 0 & mc_rd_valid) //read command is completed, so de-assert enable
					begin
					mem_ready_data2 <= 1;
					mem_data_rd2 <= data_rd;
					data_rden <= 0;
					sel <= 2'b00;
		         mem_wr_rdy_tmp <= 1;
               end   
				else if(mem_rw_data2 == 0 & mem_ready_data2 )  // For read command it is set high
				   begin
					enable2_active <= 0;
					mem_data_rd2 <= 256'd0;
					mem_ready_data2 <= 0;
					end
					
					
				else // For write/read command, set high
					begin
					enable2_active <= 1;
					mem_wr_rdy_tmp <= 0;
					sel <= 2'b10;
					if(mem_rw_data2)
					data_wren <= 1;  
					else
					data_rden <= 1;
					end		
		
			   end  // end of mc_rd_rdy
				
			end  // end of priority 2
			
		else if(mem_valid_data3 == 1 & ~enable1_active & ~enable2_active)
			begin
			
				if(mc_wr_rdy_accept | enable3_active)  // If memory controller ready or the process is active
		      begin
				
				// Enable active logic
				if( (mem_rw_data3 == 1)  & mc_wr_rdy  & enable3_active) // First time won't be executed
					begin
					mem_ready_data3 <= 1;
					data_wren <= 0;
					sel <= 2'b00;
					mem_wr_rdy_tmp <= 1;
					end
					
				else if(mem_ready_data3 & (mem_rw_data3 == 1))
					begin
					mem_ready_data3 <= 0;
					enable3_active <= 0;
					end
					
				else if(mem_rw_data3 == 0 & mc_rd_valid) //read command is completed, so de-assert enable
					begin
					mem_ready_data3 <= 1;
					mem_data_rd3 <= data_rd;
					data_rden <= 0;
					sel <= 2'b00;
		         mem_wr_rdy_tmp <= 1;
               end   
				else if(mem_rw_data3 == 0 & mem_ready_data3 )  // For read command it is set high
				   begin
					enable3_active <= 0;
					mem_data_rd3 <= 256'd0;
					mem_ready_data3 <= 0;
					end
					
					
				else // For write/read command, set high
					begin
					enable3_active <= 1;
					mem_wr_rdy_tmp <= 0;
					sel <= 2'b11;
					if(mem_rw_data3)
					data_wren <= 1;  
					else
					data_rden <= 1;
					end		
		
			   end  // end of mc_rd_rdy			
			end   // end of priority 2
		
	
	end // end of else

end // end of always

endmodule
