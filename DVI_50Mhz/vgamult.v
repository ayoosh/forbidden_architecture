`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:56 02/10/2014 
// Design Name: 
// Module Name:    vgamult 
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
module vgamult(clk_100mhz,  ext_rst, pixel_r, pixel_g, pixel_b, hsync, vsync, blank, clk, clk_n, D, dvi_rst, scl_tri, sda_tri, data_rd, mem_ready_data, data_wr, mem_data_addr, mem_rw_data, mem_valid_data, last_addr_update, mem_start, display_on, locked_dcm, fifo_empty, rd_fifo, done);
    input clk_100mhz;
    input ext_rst;
	 
	 output hsync;
    output vsync;
	 output blank;
	 output dvi_rst;
	 
	 output [7:0] pixel_r;
    output [7:0] pixel_g;
    output [7:0] pixel_b;
	 
	 output [11:0] D;
	 
	 output clk;
	 output clk_n;
	 
	input [255:0]  data_rd;
	input mem_ready_data;
	output [255:0] data_wr;
	output [27:0] mem_data_addr;
	output  mem_rw_data;
	output  mem_valid_data;
	output  last_addr_update;
	
	// IO interface
	input [27:0] mem_start;
	input display_on;
	
	 inout scl_tri, sda_tri;
	 
	 	 // Signals to be taken one level above
	 output locked_dcm;
	 output fifo_empty;
	 output rd_fifo;
	 output done;
	 
	 wire [9:0] pixel_x;
	 wire [9:0] pixel_y;
	 wire [23:0] pixel_gbrg;
	 
    assign pixel_gbrg = {pixel_g[3:0], pixel_b, pixel_r, pixel_g[7:4]};
	 
	 wire clkin_ibufg_out;
	 wire clk_100mhz_buf;
	 wire locked_dcm;
	 
	 wire clk_25mhz;
	 wire clkn_25mhz;
	 wire comp_sync;
	 
	 wire clk_100 = clk_100mhz;
    
	 //wire shutdown;
	 
	 assign clk = clk_25mhz;
	 assign clk_n = ~clk_25mhz;
		
	 wire sda_tri;
	 wire scl_tri;
	 wire sda;
	 wire scl;
	 wire fifo_empty;
	 
	 // VGA logic indicates when to read the data (24-bit pixel values) from xfifo.
	 wire rd_fifo;
	 
	 // Module reset based on display on
	 wire rst;
	 assign rst = ext_rst | ~display_on;
	 // If display is off, module will be reseted, active high reset
	 
	 // Addressing base + offset logic
	 wire  [27:0] mem_data_original_address; 
	 assign mem_data_addr = mem_start + mem_data_original_address;
	 
	 //DVI Interface
	 assign dvi_rst = ~(rst|~locked_dcm);
	 assign D = (clk)? pixel_gbrg[23:12] : pixel_gbrg[11:0];
	 assign sda_tri = (sda)? 1'bz: 1'b0;
	 assign scl_tri = (scl)? 1'bz: 1'b0;
	 
	 dvi_ifc dvi1(.Clk(clk_25mhz),                     // Clock input
						.Reset_n(dvi_rst),       // Reset input
						.SDA(sda),                          // I2C data
						.SCL(scl),                          // I2C clock
						.Done(done),                        // I2C configuration done
						.IIC_xfer_done(iic_tx_done),        // IIC configuration done
						.init_IIC_xfer(1'b0)                // IIC configuration request
						);
		

	// diff_clk clk_diff1(clkn_100mhz,  rst, clkn_25mhz, clknin_ibufg_out, clkn_100mhz_buf, lockedn_dcm);
	 vga_clk vga_clk_gen1(clk_100mhz, rst, clk_25mhz, clkin_ibufg_out, clk_100mhz_buf, locked_dcm);
    vga_logic  vgal1(clk_25mhz, rst|~locked_dcm, blank, comp_sync, hsync, vsync, pixel_x, pixel_y, rd_fifo, fifo_empty, done);
	 
	 // Note that instead of using clk_100mhz as input, I am using clk_100mhz_buf as input. This is the output 
	 // received from clk divider.
	 main_logic main1(clk_25mhz, clk_100mhz, rst|~locked_dcm, pixel_r, pixel_g, pixel_b, rd_fifo, fifo_empty, done, data_rd, mem_ready_data, data_wr, mem_data_original_address, mem_rw_data, mem_valid_data, last_addr_update);
	 
endmodule
