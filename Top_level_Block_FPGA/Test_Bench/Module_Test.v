`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:54:51 04/19/2014
// Design Name:   top_module
// Module Name:   I:/Xilinx_Projects/Complete_Module_Test/Module_Test.v
// Project Name:  top_level
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Module_Test;

	// Inputs
	reg clk;
	reg rst;
	reg clk200_p;
	reg clk200_n;
	reg rxd;

	// Outputs
	wire memory_read_error;
	wire [12:0] ddr2_a;
	wire [1:0] ddr2_ba;
	wire ddr2_ras_n;
	wire ddr2_cas_n;
	wire ddr2_we_n;
	wire [0:0] ddr2_cs_n;
	wire [0:0] ddr2_odt;
	wire [0:0] ddr2_cke;
	wire [7:0] ddr2_dm;
	wire phy_init_done;
	wire [1:0] ddr2_ck;
	wire [1:0] ddr2_ck_n;
	wire hsync;
	wire vsync;
	wire blank;
	wire dvi_rst;
	wire [7:0] pixel_r;
	wire [7:0] pixel_g;
	wire [7:0] pixel_b;
	wire [11:0] D;
	wire clk_dvi;
	wire clk_dvi_n;
	wire txd;

	// Bidirs
	wire [63:0] ddr2_dq;
	wire [7:0] ddr2_dqs;
	wire [7:0] ddr2_dqs_n;
	wire scl_tri;
	wire sda_tri;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.rst(rst), 
		.memory_read_error(memory_read_error), 
		.ddr2_dq(ddr2_dq), 
		.ddr2_a(ddr2_a), 
		.ddr2_ba(ddr2_ba), 
		.ddr2_ras_n(ddr2_ras_n), 
		.ddr2_cas_n(ddr2_cas_n), 
		.ddr2_we_n(ddr2_we_n), 
		.ddr2_cs_n(ddr2_cs_n), 
		.ddr2_odt(ddr2_odt), 
		.ddr2_cke(ddr2_cke), 
		.ddr2_dm(ddr2_dm), 
		.clk200_p(clk200_p), 
		.clk200_n(clk200_n), 
		.phy_init_done(phy_init_done), 
		.ddr2_dqs(ddr2_dqs), 
		.ddr2_dqs_n(ddr2_dqs_n), 
		.ddr2_ck(ddr2_ck), 
		.ddr2_ck_n(ddr2_ck_n), 
		.hsync(hsync), 
		.vsync(vsync), 
		.blank(blank), 
		.dvi_rst(dvi_rst), 
		.pixel_r(pixel_r), 
		.pixel_g(pixel_g), 
		.pixel_b(pixel_b), 
		.D(D), 
		.clk_dvi(clk_dvi), 
		.clk_dvi_n(clk_dvi_n), 
		.txd(txd), 
		.rxd(rxd), 
		.scl_tri(scl_tri), 
		.sda_tri(sda_tri)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		clk200_p = 0;
		clk200_n = 1;
		rxd = 1;

		// Wait 100 ns for global reset to finish
		#100;
       rst = 0;
		// Add stimulus here

	end
	
	always begin
	#10 clk = !clk;
	end
	
	always begin
	#5 clk200_p = !clk200_p;
	end
	
	always begin
	#5 clk200_n = !clk200_n;
	end
      
endmodule

