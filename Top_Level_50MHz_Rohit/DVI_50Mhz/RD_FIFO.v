`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:49:16 02/12/2014 
// Design Name: 
// Module Name:    RD_FIFO 
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
module RD_FIFO(
	fifo_data_rd,
	pixel_r,
	pixel_b,
	pixel_g
    );

  input [23:0] fifo_data_rd;
  output [7:0] pixel_r;
  output [7:0] pixel_g;
  output [7:0] pixel_b;
  
  assign pixel_r = fifo_data_rd[23:16];
  assign pixel_g = fifo_data_rd[15:8];
  assign pixel_b = fifo_data_rd[7:0];

endmodule
