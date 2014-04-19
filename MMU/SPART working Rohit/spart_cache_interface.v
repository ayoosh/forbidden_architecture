`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:11 04/16/2014 
// Design Name: 
// Module Name:    spart_cache_interface 
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
module spart_cache_interface(
	input clk,
	input rst,
	
	// Connections to/from cache controller.
	input io_rw_data,
	input io_valid_data,
	output io_ready_data,
	input [27:0] mem_addr,
	output [31:0] io_rd_data,
	input [31:0] io_wr_data,
	
	// Connections to/from SPART
	output spart_data_rden,
	output spart_data_wren,
	input data_rdy,
	output [31:0] data_tx,
	input [31:0] data_rx,
	input [31:0] status_reg
    );
	
	
	assign spart_data_rden = (~io_rw_data && io_valid_data);
	assign spart_data_wren = (io_rw_data && io_valid_data);
	
	assign io_rd_data = (mem_addr == 28'h800_0000) ? data_rx : ((mem_addr == 28'h800_0001) ? status_reg : data_rx);
	assign data_tx = io_wr_data;
	
	assign io_ready_data = (spart_data_rden) ? data_rdy : ( (spart_data_wren) ? data_rdy : 1'b0 );
	
endmodule





//	wire rden = (~io_rw_data && io_valid_data);
//	wire wren = (io_rw_data && io_valid_data);
	
//	assign spart_data_rden = (count_rd == 2'd0) ? rden : 1'b0;
//	assign spart_data_wren = (count_wr == 2'd0) ? wren : 1'b0;

//	always @(posedge clk)
//	begin
//		if(rst)
//		begin
//			count_rd <= 2'd0;
//		end
//		else
//		begin
//			if(data_rdy)
//			begin
//				count_rd <= count_rd + 1'b1;
//			end
//			else if(count_rd != 2'd0)
//			begin
//				count_rd <= count_rd + 1'b1;
//			end
//			else
//			begin
//				count_rd <= count_rd;
//			end
//		end
//	end
//	
//	always @(posedge clk)
//	begin
//		if(rst)
//		begin
//			count_wr <= 2'd0;
//		end
//		else
//		begin
//			if(data_written)
//			begin
//				count_wr <= count_wr + 1'b1;
//			end
//			else if(count_wr != 2'd0)
//			begin
//				count_wr <= count_wr + 1'b1;
//			end
//			else
//			begin
//				count_wr <= count_wr;
//			end
//		end
//	end
//	
//endmodule
