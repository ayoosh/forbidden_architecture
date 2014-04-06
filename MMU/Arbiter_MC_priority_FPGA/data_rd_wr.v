`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:22:16 03/26/2014 
// Design Name: 
// Module Name:    data_rd_wr 
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
module data_rd_wr  # (
	parameter APPDATA_WIDTH           = 128,     
	parameter BANK_WIDTH              = 2,       
	parameter COL_WIDTH               = 10,       
	parameter ROW_WIDTH               = 13,
	parameter INPUT_ADDR_WIDTH			 = 31,
	parameter WRITE_CYCLE_DELAY		 = 3
    )
	(
   input                             	app_wdf_afull,          // output from MIG
								// Indicates that the write data FIFO is currently full inside
								// MIG module.
   input                             	app_af_afull,			// output from MIG
								// Indicates that the address FIFO is currently full inside
								// MIG module.
   input                             	rd_data_valid,			// output from MIG
								// Indicates that the data being read from MIG is currently valid.
   output  reg                       	app_wdf_wren,			// input to MIG
								// Interface is writing data in the MIG for DDR2.
   output  reg                       	app_af_wren,			// input to MIG
								// Interface is writing address in the MIG for DDR2.
	// Get the truncated data from top module.
   output  [INPUT_ADDR_WIDTH-1:0]   	app_af_addr,			// input to MIG
   output  reg [2:0]                 	app_af_cmd,				// input to MIG
   input       [(APPDATA_WIDTH)-1:0]  	rd_data_fifo_out,		// output from MIG
   output  reg [(APPDATA_WIDTH)-1:0] 	app_wdf_data,			// input to MIG
   output  		[(APPDATA_WIDTH/8)-1:0]	app_wdf_mask_data,	    // input to MIG
   
   input							 			   clk, 		// input from top module
   input							 			   rst,			// input from top module
   output 									   mc_wr_rdy,				
								// Output to cache controller to indicate whether memory controller
								// is ready to write the data into MIG or not.
	output 									   mc_rd_rdy,
								// Output to cache controller to indicate whether memory controller
								// is ready to read the data from MIG or not.
	output reg								   mc_rd_valid,
								// Output to cache controller indicating that valid data is ready to be read.
	input 									   data_wren,
								// Input from cache to indicate that cache is ready to write the data.
	input 									   data_rden,
								// Input from cache to indicate that cache is ready to read the data.
	input  	   [(2*APPDATA_WIDTH)-1:0] data_wr,
								// Input data from cache.
	output reg  [(2*APPDATA_WIDTH)-1:0] data_rd,
								// Output the data to cache
	input       [INPUT_ADDR_WIDTH-1:0]  data_addr
								// DDR2 address to read/write the data from/to.
	);

    reg [(APPDATA_WIDTH)-1:0] cache_data_out[0:1];
	reg [(APPDATA_WIDTH)-1:0] mig_data_out[0:1];
	reg new_data_wr;
	reg new_data_rd;
	reg addr_change_wr;
	reg addr_change_rd;
	reg read_data_end;
	reg data_stored;
	reg data_rdy;
	reg [4:0] counter_wait;
	reg data_sent;
	
	wire mig_data_wr;
	wire mig_data_rd;
	
	assign mig_data_wr = ((~app_wdf_afull) && (~app_af_afull));
	assign mig_data_rd = (~app_af_afull);
	assign mc_wr_rdy = (mig_data_wr) && (data_sent);	
	assign mc_rd_rdy = (mig_data_rd) && (~new_data_rd);	
	
	assign app_wdf_mask_data = 16'd0;
	assign app_af_addr = data_addr;
	
/////////////////////////////////////////////////////////////////////////////
//// Writing the data into the DDR2. Data will be coming  from arbiter. ////
////////////////////////////////////////////////////////////////////////////
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			data_stored <= 1'b0;
			cache_data_out[0] <= 128'd0;
			cache_data_out[1] <= 128'd0;
		end
		else
		begin
			if(mig_data_wr && data_wren)
			begin
				data_stored <= 1'b1;
				cache_data_out[0] <= data_wr[127:0];
				cache_data_out[1] <= data_wr[255:128];
			end
			else
			begin
				cache_data_out[0] <= cache_data_out[0];
				cache_data_out[1] <= cache_data_out[1];
			end
			if(new_data_wr)
			begin
				data_stored <= 1'b0;
			end
			else
			begin
				data_stored <= data_stored;
			end			
		end
	end

//////////////////////////////////////////////////////////////
/// Controlling whether data is to be written in the    //////
/// DDR2 or read from DDR2.                             //////
//////////////////////////////////////////////////////////////
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			// cmd value equal to 000 indicates that
			// we are planning to write data and 001
			// indicates that we will be reading the 
			// data.
			app_af_cmd <= 3'd0;					
		end
		else
		begin
			if(mig_data_wr && data_wren)
			begin
				// If the cache wants to write the data then the value
				// of cmd should be 0. This should be 0 for at least
				// two clock cycles.
				app_af_cmd <= 3'd0;
			end
			else if(mig_data_rd && data_rden)
			begin
				app_af_cmd <= 3'd1;
			end
			else
			begin
				app_af_cmd <= app_af_cmd;
			end
		end
	end
	
	always @(posedge clk)
   begin
		if(rst)
		begin
			app_af_wren <= 1'd0;
			addr_change_wr <= 1'b0;
			addr_change_rd <= 1'b0;
		end
		else
		begin
			app_af_wren <= 1'b0;
			if(mig_data_wr && data_wren && !addr_change_wr && !data_rden)
			begin
				app_af_wren <= 1'b1;				
				addr_change_wr <= 1'b1;
			end
			else if(mig_data_wr && data_wren && addr_change_wr && app_af_wren)
			begin
				app_af_wren	<= 1'b0;
			end
			else if(mc_wr_rdy)
			begin
				addr_change_wr <= 1'b0;
			end
			else if(mig_data_rd && data_rden && !addr_change_rd && !data_wren)
			begin
				app_af_wren <= 1'b1;				
				addr_change_rd <= 1'b1;
			end
			else if(mig_data_rd && data_rden && addr_change_rd && app_af_wren)
			begin
				app_af_wren <= 1'b0;
			end
			else if(mc_rd_valid)
			begin
				addr_change_rd <= 1'b0;
			end
			else
			begin
				app_af_wren	<= 1'b0;
			end
		end
	end	
	
	
	always @(posedge clk)
   begin
		if(rst)
		begin
			app_wdf_data <= 128'd0;
			new_data_wr <= 1'b0;
			app_wdf_wren <= 1'b0;
			data_rdy <= 1'b0;
		end
		else
		begin
			if((mig_data_wr)&&(data_wren)&&(!new_data_wr)&&(!app_wdf_wren)&&(!data_rden)&&(!addr_change_wr))
			begin
				app_wdf_data <= data_wr[127:0];
				new_data_wr	 <= 1'b1;
				app_wdf_wren <= 1'b1;
			end
			else if((mig_data_wr)&&(data_wren)&&(new_data_wr)&&(app_wdf_wren)&&(!data_rdy))
			begin
				app_wdf_data <= data_wr[255:128];
				app_wdf_wren <= 1'b1;
				data_rdy <= 1'b1;
			end
			else if(data_rdy && app_wdf_wren)
			begin
				app_wdf_wren <= 1'b0;
			end
			else if(counter_wait == WRITE_CYCLE_DELAY)
			begin
				data_rdy <= 1'b0;
				new_data_wr	 <= 1'b0;
			end
			else
			begin
				app_wdf_wren <= 1'b0;
			end
		end
	end	
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			data_sent <= 1'b0;
			counter_wait <= 5'd0;
		end
		else
		begin
			if(data_rdy)
			begin
				counter_wait <= counter_wait + 1'b1;
			end
			else
			begin
				counter_wait <= 5'd0;
			end
			
			if(counter_wait == WRITE_CYCLE_DELAY)
			begin
				data_sent <= 1'b1;
			end
			else
			begin
				data_sent <= 1'b0;
			end
				
		end
	end
	
	always @(posedge clk)
   begin
		if(rst)
		begin			
			new_data_rd <= 1'b0;
			read_data_end <= 1'b0;
		end
		else
		begin
			if((!new_data_rd)&&(rd_data_valid) &&(mig_data_rd))
			begin
				mig_data_out[0] <= rd_data_fifo_out;
				new_data_rd	 <= 1'b1;
				read_data_end <= 1'b0;
			end
			else if((new_data_rd) && (rd_data_valid) &&(mig_data_rd))
			begin
				mig_data_out[1] <= rd_data_fifo_out;
				new_data_rd	 <= 1'b0;
				read_data_end <= 1'b1;
			end
			else
			begin
				read_data_end <= 1'b0;
			end
		end
	end	
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			data_rd <= 256'd0;
			mc_rd_valid <= 1'b0;
		end
		else
		begin
			if(read_data_end)
			begin
				mc_rd_valid <= 1'b1;
			end
			else
			begin
				mc_rd_valid <= 1'b0;
			end
			
			if(read_data_end && data_rden)
			begin
				data_rd <= {mig_data_out[1], mig_data_out[0]};
			end
			else
			begin
				data_rd <= data_rd;
			end
		end
	end
	
//   always @(posedge clk)
//   begin
//		if(rst)
//		begin
//			app_af_addr <= 25'd0;
//		end
//		else
//		begin
//			app_af_addr <= data_addr;
			// Read the DDR2 address from cache controller.
			//if(new_data_wr && mig_data_wr && data_wren && !new_data_rd)
			//if((addr_change_wr)&&(mig_data_wr)&&(data_wren))
//			if(!app_af_wren)
//			begin				
//				app_af_addr <= data_addr;
//			end
//			else
//			begin
//				app_af_addr <= app_af_addr;
//			end
			/*
			else if((!addr_change_wr)&&(mig_data_wr)&&(data_wren))
			begin			    
				app_af_addr <= app_af_addr;
			end
			else if((addr_change_rd)&&(mig_data_wr)&&(data_rden))
			begin
				app_af_addr <= data_addr;
			end
			else
			begin
				app_af_addr <= app_af_addr;
			end
//			*/
//		end
//	end
endmodule
