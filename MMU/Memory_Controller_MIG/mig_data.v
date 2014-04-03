`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:57:59 03/25/2014 
// Design Name: 
// Module Name:    mig_data 
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
module mig_data # (
	parameter APPDATA_WIDTH           = 128,     
	parameter BANK_WIDTH              = 2,       
	parameter COL_WIDTH               = 10,       
	parameter ROW_WIDTH               = 13       
    )
	(
   input                             	app_wdf_afull,       // output
   input                             	app_af_afull,			// output
   input                             	rd_data_valid,			// output
   output  reg                       	app_wdf_wren,			// input
   output  reg                       	app_af_wren,			// input
	// Get the truncated data from top module.
   output  reg [24:0]                	app_af_addr,			// input
   output  reg [2:0]                 	app_af_cmd,				// input
   input   [(APPDATA_WIDTH)-1:0]     	rd_data_fifo_out,		// output
   output  reg [(APPDATA_WIDTH)-1:0] 	app_wdf_data,			// input
   output  		[(APPDATA_WIDTH/8)-1:0]	app_wdf_mask_data,	// input
   
   input   [(2*APPDATA_WIDTH)-1:0]   cache_line,				// Correct input
   input							 			 clk,   					   // Correct input
   input							 			 rst							// Correct input
	);



   //wire                             app_wdf_afull;          		// output
   //wire                             app_af_afull;					// output
   //wire                             rd_data_valid;					// output
   //reg                              app_wdf_wren;					// input
   //reg                              app_af_wren;					// input
   //reg  [30:0]                      app_af_addr;					// input
   //reg  [2:0]                       app_af_cmd;						// input
   //wire [(APPDATA_WIDTH)-1:0]       rd_data_fifo_out;				// output
   //reg  [(APPDATA_WIDTH)-1:0]       app_wdf_data;					// input
   //reg  [(APPDATA_WIDTH/8)-1:0]     app_wdf_mask_data;				// input
   //reg 								rd_en;							// temp_rd_signal	
	
   reg [3:0] counter;
   reg addr_change;
	
	assign app_wdf_mask_data = 16'd0;
	
   always @(posedge clk)
   begin
		if(rst)
		begin
			counter <= 4'd0;
			addr_change <= 1'b0;
			app_af_addr <= 25'd0;
		end
		else
		begin
			// The value of addr will increment by 4 only 
			// after two clock cycles. The address change
			// will happen for the number of available 256
			// bits data.
			if(counter == 4'd9 && addr_change == 1'b0)
			begin
				counter <= 4'd0;
				app_af_addr <= 25'd0;
				addr_change <= ~addr_change;
			end
			else if(addr_change == 1'b0)
			begin
			   addr_change <= ~addr_change;
				counter <= counter + 1;
				app_af_addr <= app_af_addr + 3'd4;
			end
			else
			begin
				addr_change <= ~addr_change;
			end
		end
	end
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			// cmd value equal to 000 indicates that
			// we are planning to write data and 001
			// indicates that we will be reading the 
			// data.
			app_af_cmd <= 3'd0;			
			// When the memory controller unit restarts
			// be ready to write the data.
			app_wdf_wren <= 1'b0;			
		end
		else
		begin
			if(counter == 4'd8 && addr_change == 1'b0)
			begin
				// After all of the data has been written, then
				// update the cmd and wr_en value to select either 
				// read/write value.
				if(app_af_cmd[0] == 1'b0)
					app_af_cmd[0]	<= 1'b1;
				else
					app_af_cmd[0]	<= 1'b0;
					
				if(app_wdf_wren == 1'b0)
					app_wdf_wren  	<= 1'b1;
				else
					app_wdf_wren  	<= 1'b0;
			end
			else
			begin
				app_af_cmd[0]	<= app_af_cmd[0];
				app_wdf_wren  	<= app_wdf_wren;
			end
		end
	end
	
	
   always @(posedge clk)
   begin
		if(rst)
		begin
			app_af_wren <= 1'd0;
		end
		else
		begin
			app_af_wren <= ~app_af_wren;
		end
	end	
	
	always @(posedge clk)
   begin
		if(rst)
		begin
			app_wdf_data <= 128'd0;
		end
		else
		begin
			if(!addr_change)
				app_wdf_data <= cache_line[127:0];
			else
				app_wdf_data <= cache_line[255:128];
		end
	end	
	
	
	
endmodule
