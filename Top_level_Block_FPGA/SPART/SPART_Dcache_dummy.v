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
module SPART_Dcache_dummy #(
      parameter NUMBER_OF_ACCESS = 2
		)
(
		input clk,
		input rst,
		
	output  	reg   [31:0] mem_data_wr1,
								// Input data from cache
								
	input   [31:0] mem_data_rd1,
								// Output the data to cache
								
   output   reg     [27:0]  mem_data_addr1,
								// DDR2 address from cache to read/write the data from/to
								
	output reg               mem_rw_data1,
	                     // To indicate read/write command from cache
								
	output reg               mem_valid_data1,
	                     // To indicate from cache if command is valid
								
	input 				  mem_ready_data1
		
    );

	reg [31:0] temp_mem [0:NUMBER_OF_ACCESS];
	reg [31:0] rom_addr_rd;
	reg [31:0] rom_addr_wr;	
	reg [31:0] temp_data;


	reg read_done;
	reg write_done;
	reg poll;
	reg wait_for_response;
	
	wire [31:0] temp_poll_rd;
	wire [31:0] temp_poll_wr;
	
	assign temp_poll_rd = (mem_data_rd1 & 32'h00000002);
	assign temp_poll_wr = (mem_data_rd1 & 32'h00000001);	

// Read Block	
	always @(posedge clk)
	begin
	if(rst)
		begin
		read_done <= 0;
		write_done <= 1; // Initial Write done 
		rom_addr_rd <= 0;
		rom_addr_wr <= 0;
		poll <= 0;  // If poll is 0 implies still poll
		wait_for_response <= 0;
		read_done <= 0;
		mem_valid_data1 <= 0;
		mem_rw_data1 <= 0;
		mem_data_addr1 <= 28'd0;
		mem_data_wr1 <= 28'd0;
		end
		
	else if (write_done && rom_addr_rd < NUMBER_OF_ACCESS)  // write is done, start read

		begin
		read_done <= 0; // Read started again
			if(poll == 0 && wait_for_response == 0 && ~mem_ready_data1) // Keep polling
				begin
				mem_valid_data1 <= 1;
				mem_rw_data1 <= 0;
				mem_data_addr1 <= 28'h8000001;
				wait_for_response <= 1;
				end
				
			else if(poll == 0 && wait_for_response == 1 && mem_ready_data1) // Poll response came
				begin
				mem_valid_data1 <= 0;
				mem_rw_data1 <= 0;
				mem_data_addr1 <= 28'd0;
				wait_for_response <= 0;
					if( temp_poll_rd == 32'h00000002 )
					poll <= 1; // Polling done
					else 
					poll <= 0;
					
				end
				
		   else if(poll == 1 && wait_for_response == 0 && ~mem_ready_data1) // Poll succesful Read register
				begin
				mem_valid_data1 <= 1;
				mem_rw_data1 <= 0;
				mem_data_addr1 <= 28'h8000000;
				wait_for_response <= 1;
				end
				
			else if(poll == 1 && wait_for_response == 1 && mem_ready_data1) // Poll response came
				begin
				mem_valid_data1 <= 0;
				mem_rw_data1 <= 0;
				mem_data_addr1 <= 28'd0;
				wait_for_response <= 0;
				poll <= 0;  // Again poll
            temp_mem[rom_addr_rd] <= mem_data_rd1; // Storing data in memory
				rom_addr_rd <= rom_addr_rd + 1;	
				
				if(rom_addr_rd == (NUMBER_OF_ACCESS - 1))
				begin
				read_done <= 1;
				rom_addr_wr <= 32'd0;
				end
				else
				read_done <= 0;
				
				end	
			
		end // end of read part
		


	else if (read_done && rom_addr_wr < NUMBER_OF_ACCESS)  // read is done, start write
		begin
		write_done <= 0; // Write started again
			if(poll == 0 && wait_for_response == 0 && ~mem_ready_data1) // Keep polling
				begin
				mem_valid_data1 <= 1;
				mem_rw_data1 <= 0;
				mem_data_addr1 <= 28'h8000001;
				wait_for_response <= 1;
				end
				
			else if(poll == 0 && wait_for_response == 1 && mem_ready_data1) // Poll response came
				begin
				mem_valid_data1 <= 0;
				mem_rw_data1 <= 0;
				mem_data_addr1 <= 28'd0;
				wait_for_response <= 0;
					if( temp_poll_wr == 32'h00000001 )
					poll <= 1; // Polling done
					else 
					poll <= 0;
					
				end
				
		   else if(poll == 1 && wait_for_response == 0 && ~mem_ready_data1) // Poll succesful Write register
				begin
				mem_valid_data1 <= 1;
				mem_rw_data1 <= 1;
				mem_data_addr1 <= 28'h8000000;
				mem_data_wr1 <= temp_mem[rom_addr_wr];
				wait_for_response <= 1;
				end
				
			else if(poll == 1 && wait_for_response == 1 && mem_ready_data1) // response came
				begin
				mem_valid_data1 <= 0;
				mem_rw_data1 <= 0;
				mem_data_addr1 <= 28'd0;
				wait_for_response <= 0;
				poll <= 0;  // Again poll
            rom_addr_wr <= rom_addr_wr + 1;	
				
				if(rom_addr_wr == (NUMBER_OF_ACCESS - 1))
				begin
				write_done <= 1;
				rom_addr_rd <= 32'd0;
				end
				else
				write_done <= 0;
				
				end	
			
		end // end of write part		
		
		
	end // end of always block
	
	
	
endmodule

