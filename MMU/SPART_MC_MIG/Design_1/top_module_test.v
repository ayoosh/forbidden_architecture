`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:06:42 03/28/2014
// Design Name:   top_module
// Module Name:   C:/Users/Rohit/Dropbox/Xilinx_901/Memory_Controller_MIG/Design_1/top_module_test.v
// Project Name:  memory_controller_mig
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

module top_module_test;

	// Inputs
	reg clk;
	reg rst;
	reg data_wren;
	reg data_rden;
	reg clk200_p;
	reg clk200_n;

	// Outputs
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

	// Bidirs
	wire [63:0] ddr2_dq;
	wire [7:0] ddr2_dqs;
	wire [7:0] ddr2_dqs_n;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.rst(rst), 
		.data_wren(data_wren), 
		.data_rden(data_rden), 
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
		.ddr2_ck_n(ddr2_ck_n)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		data_wren = 0;
		data_rden = 0;
		clk200_p = 0;
		clk200_n = 0;

		// Wait 100 ns for global reset to finish
		#100;
        rst = 0;
		
		#20
		data_wren = 1;
		#100
		data_wren = 0;
		#60
		data_wren = 1;
		#500
		data_wren = 0;
		data_rden = 0;
		#100
		data_rden = 1;
		#1700
		data_rden = 0;
		// Add stimulus here

	end
	
	always begin
		#10 clk = !clk;
	end
      
endmodule

