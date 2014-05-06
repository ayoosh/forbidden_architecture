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
module IO_map_address_block #(
      parameter NUMBER_OF_ACCESS = 1 
		)
(
		input clk,
		input rst,
	
	// Inputs from D-cache, IO interface
	input  	   [31:0] io_mem_data_wr,
						
								
	output   [31:0] io_mem_data_rd,
							
								
   input       [27:0]  io_mem_data_addr,
								
								
	input               io_mem_rw_data,
	                   
								
	input               io_mem_valid_data,
								
	output 		  io_mem_ready_data,
	
	// Outputs to DVI
	
	output reg [27:0]  mem_start,
	output reg display_on,
	
// Output to SPART bypassed	
	output  	   [31:0] spart_mem_data_wr,
									
	input       [31:0] spart_mem_data_rd,						
								
   output      [27:0]  spart_mem_data_addr,
														
	output              spart_mem_rw_data,
	                  							
	output               spart_mem_valid_data,
	                  						
	input 				  spart_mem_ready_data	
    );
   
	reg [31:0] tick_counter;
	
   wire dvi_addr;
	wire spart_addr;
	wire tick_addr;
	
   assign dvi_addr = ( io_mem_data_addr == 28'h8000004 | io_mem_data_addr == 28'h8000005 ) ? 1 : 0;
	assign spart_addr = ( io_mem_data_addr == 28'h8000000 | io_mem_data_addr == 28'h8000001 ) ? 1 : 0;
	assign tick_addr = ( io_mem_data_addr == 28'h8000006 ) ? 1 : 0;
	
	wire  	   [31:0] mem_data_wr;							
   reg  [31:0] mem_data_rd;							
   wire      [27:0]  mem_data_addr;						
	wire               mem_rw_data;                							
	wire               mem_valid_data;							
	reg		  mem_ready_data;
	
	assign io_mem_data_rd = (spart_addr) ? spart_mem_data_rd : mem_data_rd;
	assign io_mem_ready_data = (spart_addr) ? spart_mem_ready_data : mem_ready_data;
	
	// Spart
	assign spart_mem_data_wr = (spart_addr) ? io_mem_data_wr : 32'd0;
	assign spart_mem_data_addr = (spart_addr) ? io_mem_data_addr : 32'd0;
	assign spart_mem_rw_data = (spart_addr) ? io_mem_rw_data : 32'd0;
	assign spart_mem_valid_data = (spart_addr) ? io_mem_valid_data : 32'd0;
	
   // DVI
	assign mem_data_wr = io_mem_data_wr;
	assign mem_data_addr = io_mem_data_addr;
	assign mem_rw_data =   io_mem_rw_data;
	assign mem_valid_data =  io_mem_valid_data;

  // Tick Counter always block
  always @(posedge clk)
  begin
	if(rst)
		tick_counter <= 32'd0;
	else if(tick_counter == 32'd4294967295)  // Tick doesn't reset to zero on its own
		tick_counter <= tick_counter;
	else if(tick_addr & mem_valid_data & mem_rw_data)
      tick_counter <= 32'd0;	
	else
		tick_counter <= tick_counter + 1;
  end
  
  // VGA Addr block
    always @(posedge clk)
  begin
	if(rst)
		mem_start <= 28'd0;
	else if( (mem_data_addr == 28'h8000004) & mem_valid_data & mem_rw_data) // Write to the register
      mem_start <= mem_data_wr[27:0];	
	else
		mem_start <= mem_start;
  end
	
	
	  // Display ON block
    always @(posedge clk)
  begin
	if(rst)
		display_on <= 0;
	else if( (mem_data_addr == 28'h8000005) & mem_valid_data & mem_rw_data) // Write to the register
      display_on <= mem_data_wr[0];	
	else
		display_on <= display_on;
  end
	
	// Block which gives responses ready signal
	
	   always @(posedge clk)
  begin
	if(rst)
		begin
		mem_ready_data <= 0;
		mem_data_rd <= 32'd0;
		end
	else if( mem_valid_data & ~mem_ready_data )  // For any address give response
		begin
		
		mem_ready_data <= 1;
		
		if(~mem_rw_data & tick_addr)  // Read command for tick counter
		mem_data_rd <= tick_counter;
		
		else if(~mem_rw_data & (mem_data_addr == 28'h8000005)) // Read for DVI_ON
		mem_data_rd <= {27'd0,display_on};
		
		else if(~mem_rw_data & (mem_data_addr == 28'h8000004)) // Read for DVI_ON
		mem_data_rd <= {4'd0,mem_start};
		
		end
		
	else if( mem_valid_data & mem_ready_data )  // For any address give response
		begin
		
		mem_ready_data <= 0;
		mem_data_rd <= 32'd0;
	
		end
  end
	
	
	
endmodule

