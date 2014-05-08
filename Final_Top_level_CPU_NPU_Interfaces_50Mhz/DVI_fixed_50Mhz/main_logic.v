`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:06 02/10/2014 
// Design Name: 
// Module Name:    main_logic 
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
module main_logic(clk_25mhz, clk_100mhz, rst, pixel_r, pixel_g, pixel_b, rd_fifo, fifo_empty, done, data_rd, mem_ready_data, data_wr, mem_data_addr, mem_rw_data, mem_valid_data, ram_wr_done);
    input clk_25mhz;
	 input clk_100mhz;
    input rst;
	 input rd_fifo;
	 input done;
    output [7:0] pixel_r;
    output [7:0] pixel_g;
    output [7:0] pixel_b;
	 output fifo_empty;
	
	
	input [255:0]  data_rd;
	input mem_ready_data;
	output [255:0] data_wr;
	output [27:0] mem_data_addr;
	output  mem_rw_data;
	output  mem_valid_data;
	output  ram_wr_done;  // Use as reset for other modules
	 
	 wire [23:0] fifo_data;	 
	 wire [23:0] rom_data;
	 wire fifo_empty;
	 wire wr_en_fifo;
	 wire rd_en_fifo;
	 wire full_fifo;
	 
	 wire WEN;
	 
	 wire [15:0] rom_addr;
	 	 wire [15:0] rom_addr_rd;
		 	 wire [15:0] rom_addr_wr;
	 wire [63:0] rom_rd;
	 wire [63:0] rom_write;
	 wire rom_wen;
	// wire ram_wr_done;  
	
		assign rom_addr = rom_wen ? rom_addr_wr : rom_addr_rd;
	 
	write_rom write_rom(
		.clk(clk_100mhz), 
		.rst(rst), 
		.data_out(rom_write),
		.data_rd(data_rd),
	   .mem_ready_data(mem_ready_data),
	   .data_wr(data_wr),
	   .mem_data_addr(mem_data_addr),
	   .mem_rw_data(mem_rw_data),
	   .mem_valid_data(mem_valid_data),
		.WEN(rom_wen),
		.rom_addr_wr(rom_addr_wr),
		.ram_wr_done(ram_wr_done)
	);	
	 
	 this_is_sparta RAM_DVI (
  .clka(clk_100mhz), // input clka
  .wea(rom_wen), // input [0 : 0] wea
  .addra(rom_addr), // input [15 : 0] addra
  .dina(rom_write), // input [63 : 0] dina
  .douta(rom_rd) // output [63 : 0] douta
    );
	 
	// Write the data into FIFO only when FIFO is not full and reset is not set. 
	//assign wr_en_fifo = (~full_fifo)&(~rst);
	
	display display_inst(
		.clk(clk_100mhz), 
		.rst(rst | ~ram_wr_done), 
		.fifo_full(full_fifo),
		.data_out(rom_data),
		
		.data_rd(rom_rd),
	   .mem_data_addr(rom_addr_rd),
	   .last_addr_update(last_addr_update),

		.WEN(WEN),
		.done(done)
	);	

	// We get this read FIFO signal from VGA_logic module
	// and attach it to XFIFO to read the values of FIFO
	// data at 25MHz.
	 assign rd_en_fifo = rd_fifo;
	 
	 xfifo_1 xclk_fifo(
		.rst(rst | ~ram_wr_done),
		.wr_clk(clk_100mhz),
		.rd_clk(clk_25mhz),
		.din(rom_data),
		.wr_en(WEN),
		.rd_en(rd_en_fifo),
		.dout(fifo_data),
		.full(full_fifo),
		.empty(fifo_empty)
	 );
	 
	 // The 24-bit data that is read from FIFO is slipt up into 
	 // 3 8-bit values in this module.
	 
	 RD_FIFO read_fifo(
		.fifo_data_rd(fifo_data),
		.pixel_r (pixel_r),
		.pixel_g (pixel_g),
		.pixel_b (pixel_b)
	 );

endmodule
