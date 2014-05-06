`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:45 02/10/2014 
// Design Name: 
// Module Name:    vga_logic 
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
module vga_logic(clk, rst, blank, comp_sync, hsync, vsync, pixel_x, pixel_y, rd_fifo, fifo_empty, done);
    input clk;
    input rst;
	 input fifo_empty;
	 input done;
	 output blank;
	 output rd_fifo;
	 output comp_sync;
    output hsync;
    output vsync;
    output [9:0] pixel_x;
    output [9:0] pixel_y;
	 
	 reg [9:0] pixel_x;
	 reg [9:0] pixel_y;
	 
	 // pixel_count logic
	 wire [9:0] next_pixel_x;
	 wire [9:0] next_pixel_y;
	 assign next_pixel_x = (pixel_x == 10'd799)? 0 : pixel_x+1;
	 assign next_pixel_y = (pixel_x == 10'd799)?
	                             ((pixel_y == 10'd520) ? 0 : pixel_y+1)
										  : pixel_y;
	 
	 always@(posedge clk, posedge rst)
	   if(rst) begin
		  pixel_x <= 10'h0;
		  pixel_y <= 10'h0;
		end 
		else 
		begin
			if((!fifo_empty)&&(done))
			begin
				pixel_x <= next_pixel_x;
				pixel_y <= next_pixel_y;
			end
			else
			begin
				pixel_x <= pixel_x;
				pixel_y <= pixel_y;
			end
		end
		
		assign hsync = (pixel_x < 10'd656) || (pixel_x > 10'd751); // 96 cycle pulse
		assign vsync = (pixel_y < 10'd490) || (pixel_y > 10'd491); // 2 cycle pulse
		assign blank = ~((pixel_x > 10'd639) | (pixel_y > 10'd479));
	//	assign rd_fifo = blank;
	   // Read FIFO is enabled one clock cycle after blank is set. The simple way to do this is
		// using next_pixel_x and next_pixel_y values. Also, do not read from FIFO when it is empty.
		assign rd_fifo = ((next_pixel_x < 10'd640) && (next_pixel_y < 10'd480) && ~fifo_empty && done);
	//	assign rd_fifo = ~(((pixel_x < 10'd799) & (pixel_x > 10'd638)) | ((pixel_y < 10'd520) & (pixel_y > 10'd478)));
		assign comp_sync = 1'b0; // don't know, dont use
	 
endmodule