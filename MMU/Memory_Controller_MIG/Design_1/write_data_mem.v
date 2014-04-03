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
module write_data_mem(
		input clk,
		input rst,
		input mc_wr_rdy,
		input data_wren,
		output [255:0] data
    );

	reg [255:0] temp_mem [0:8];
	reg [3:0] rom_addr;
	assign data = temp_mem[rom_addr];
	//assign data_wren = 1'b1;
	always @(posedge clk)
	begin
		if(rst)
		begin
			rom_addr <= 4'd0;
			temp_mem[0] <= 256'h800020C0800020C8000020D0000020D8990010E0000010E8800010F0800010F8;
			temp_mem[1] <= 256'hFF0020C0800020C8000020D0000020DDD00010E0000010E8800010F0800010F8;
			temp_mem[2] <= 256'h100040C0100040C8900040D0900040D8440030E0900030E8100030F0100030F8;
			temp_mem[3] <= 256'h660040C0100040C8900040D0900040D8980030E0900030E8100030F0100030F8;
			temp_mem[4] <= 256'hA00060C0200060C8200060D0A00060D8660050E0A00050E8A00050F0200050F8;
			temp_mem[5] <= 256'h110060C0200060C8200060D0A00060D8200050E0A00050E8A00050F0200050F8;
			temp_mem[6] <= 256'h300080C0B00080C8B00080D0300080D8DD0070E0300070E8300070F0B00070F8;
			temp_mem[7] <= 256'h330080C0B00080C8B00080D0300080D8B00070E0300070E8300070F0B00070F8;
			temp_mem[8] <= 256'h11111111000000001111111100000000FF111111000000001111111100000000;
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
