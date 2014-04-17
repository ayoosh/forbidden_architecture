`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:46 03/26/2014 
// Design Name: 
// Module Name:    write_data_addr 
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
module write_data_addr(
		input clk,
		input rst,
		input mc_wr_rdy,
		input data_wren,
		output [30:0] data
    );
	 
	reg [30:0] temp_mem [0:8];
	reg [3:0] rom_addr;
	assign data = temp_mem[rom_addr];
	//assign addr_wren = 1'b1;
	always @(posedge clk)
	begin
		if(rst)
		begin
			rom_addr <= 4'd0;
//			temp_mem[0] <= 31'h8000_20C0;
//			temp_mem[1] <= 31'h8000_20C8;
//			temp_mem[2] <= 31'h0000_20D0;
//			temp_mem[3] <= 31'h0000_20D8;
//			temp_mem[4] <= 31'h0000_10E0;
//			temp_mem[5] <= 31'h0000_10E8;
//			temp_mem[6] <= 31'h8000_10F0;
//			temp_mem[7] <= 31'h8000_10F8;
//			temp_mem[8] <= 31'hA000_60C0;
			temp_mem[0] <= 31'h000_1000;
			temp_mem[1] <= 31'h000_1004;
			temp_mem[2] <= 31'h000_1008;
			temp_mem[3] <= 31'h000_100C;
			temp_mem[4] <= 31'h000_1010;
			temp_mem[5] <= 31'h000_1014;
			temp_mem[6] <= 31'h000_1018;
			temp_mem[7] <= 31'h000_101C;
			temp_mem[8] <= 31'h000_1020;

		end
		else
		begin
			if(rom_addr == 4'd8 && mc_wr_rdy)
				rom_addr <= 4'd0;
			else if(mc_wr_rdy)
				rom_addr <= rom_addr + 1;
			else
				rom_addr <= rom_addr;
		end
	end


endmodule
