`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:24:40 04/04/2014
// Design Name:   top_module
// Module Name:   C:/Users/Kush/Desktop/spring_2014/901/Arbiter_MC_checker/TB_top.v
// Project Name:  Arbiter_MC_checker
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

module TB_top;

	// Inputs
	reg clk;
	reg rst;
	reg [255:0] mem_data_wr2;
	reg [27:0] mem_data_addr2;
	reg mem_rw_data2;
	reg mem_valid_data2;
	reg [255:0] mem_data_wr3;
	reg [27:0] mem_data_addr3;
	reg mem_rw_data3;
	reg mem_valid_data3;
	reg clk200_p;
	reg clk200_n;

	// Outputs
	wire memory_read_error;
	wire [255:0] mem_data_rd2;
	wire mem_ready_data2;
	wire [255:0] mem_data_rd3;
	wire mem_ready_data3;
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
		.memory_read_error(memory_read_error), 
		.mem_data_wr2(mem_data_wr2), 
		.mem_data_rd2(mem_data_rd2), 
		.mem_data_addr2(mem_data_addr2), 
		.mem_rw_data2(mem_rw_data2), 
		.mem_valid_data2(mem_valid_data2), 
		.mem_ready_data2(mem_ready_data2), 
		.mem_data_wr3(mem_data_wr3), 
		.mem_data_rd3(mem_data_rd3), 
		.mem_data_addr3(mem_data_addr3), 
		.mem_rw_data3(mem_rw_data3), 
		.mem_valid_data3(mem_valid_data3), 
		.mem_ready_data3(mem_ready_data3), 
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
		rst = 0;
		mem_data_wr2 = 0;
		mem_data_addr2 = 0;
		mem_rw_data2 = 0;
		mem_valid_data2 = 0;
		mem_data_wr3 = 0;
		mem_data_addr3 = 0;
		mem_rw_data3 = 0;
		mem_valid_data3 = 0;
		clk200_p = 0;
		clk200_n = 0;

		// Wait 100 ns for global reset to finish
	   #100;
      rst = 1;
      #100;
		rst = 0;
      #100;	
        
		// Add stimulus here

	end
	
	always begin
    #5  clk =  ! clk;
  end
      
endmodule

