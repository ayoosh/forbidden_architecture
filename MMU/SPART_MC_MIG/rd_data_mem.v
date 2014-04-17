`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:15:04 03/26/2014 
// Design Name: 
// Module Name:    rd_data_mem 
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
 module rd_data_mem(
		input clk,
		input rst,
		input mc_rd_rdy,
		input data_rden,
		input [255:0] data,
		
		output [255:0] stored_data,
		output [3:0] rom_address
    );
	 
	reg [255:0] temp_mem [0:8];
	reg [3:0] rom_addr;
	
	assign stored_data = temp_mem[rom_addr];
	assign rom_address = rom_addr;
	//assign data_rden = 1'b1;
	always @(posedge clk)
	begin
		if(rst)
		begin
			rom_addr <= 4'd0;
		end
		else
		begin
			temp_mem[rom_addr] <= data;
			if(rom_addr == 4'd8 && mc_rd_rdy)
				rom_addr <= 4'd0;
			else if(mc_rd_rdy)
				rom_addr <= rom_addr + 1;
			else
				rom_addr <= rom_addr;
		end
	end


endmodule
