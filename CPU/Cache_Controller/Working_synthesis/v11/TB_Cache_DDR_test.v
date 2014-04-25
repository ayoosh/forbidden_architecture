`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:53:43 04/17/2014
// Design Name:   top_module
// Module Name:   C:/Users/Kush/Desktop/spring_2014/901/Cache_Memory_Simulation/TB_Cache_DDR_test.v
// Project Name:  Cache_Memory_Simulation
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

module TB_Cache_DDR_test;

	// Inputs
	reg clk;
	reg rst;
	reg [27:0] cache_addr;
	reg [31:0] cache_wr;
	reg cache_rw;
	reg cache_valid;
	reg flush;
	reg clk200_p;
	reg clk200_n;

	// Outputs
	wire memory_read_error;
	wire [31:0] cache_rd;
	wire cache_ready;
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
	
	integer i;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.rst(rst), 
		.memory_read_error(memory_read_error), 
		.cache_addr(cache_addr), 
		.cache_wr(cache_wr), 
		.cache_rw(cache_rw), 
		.cache_valid(cache_valid), 
		.flush(flush), 
		.cache_rd(cache_rd), 
		.cache_ready(cache_ready), 
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
		cache_addr = 0;
		cache_wr = 0;
		cache_rw = 0;
		cache_valid = 0;
		flush = 0;
		clk200_p = 0;
		clk200_n = 0;

		// Wait 100 ns for global reset to finish
      #100;
      rst = 1;
      #100;
		rst = 0;
      #100;	
		
			for (i = 0; i < 1024; i = i + 1) begin
			uut.Dcache_inst.gen_way[0].memory.memory[i] = 273'h0;
			uut.Dcache_inst.gen_way[1].memory.memory[i] = 273'h0;
		   end
        
		// Add stimulus here

   # 1000; // Start after some delay, need for DDR functioning
	
	// TESTING DIFFERENT OFFSETS OF THE SAME LINE IN CACHE - DIFFERENT set
	// 1st
	@ (posedge clk) begin
	cache_valid = 1'b1;
	cache_rw = 1'b0;
	cache_addr = 28'd0;
	end
	
	
	@ (posedge cache_ready) 	
	@ (posedge clk) begin
	cache_addr = 28'h200_0000;
	end
	
	
	
	
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_0001;
	
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h200_0002;
	
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_0003;

	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h200_0004;

	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_0005;

	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h200_0006;
	
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_0007;

/*
//---------------------------------------------------------------
	#5000
	// TESTING WRITE CONDITION - SAME set
	
	@ (posedge clk) begin
	cache_addr = 28'h000_1018;
	cache_wr = 32'h6666_7777;
	cache_valid = 1'b1;
	cache_rw = 1'b1;
	
	end
	

	///2nd entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_1028;
	cache_wr = 32'hCD12_12CD;
	
	// READ BACk
	@ (posedge cache_ready) 
	@ (posedge clk) begin
	cache_valid = 1'b1;
	cache_rw = 1'b0;
	
	end
	
	// 1st entry
	@ (posedge cache_ready) 	
	@ (posedge clk) begin
	cache_addr = 28'h000_1018;
	end
	
	
	
	///2nd entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_1028;
	
*/



//---------------------------------------------------------------
	#5000
	// TESTING WRITE CONDITION - DIFFERENT SETS _ ASSOCIATIVITY
	
	@ (posedge clk) begin
	cache_addr = 28'h000_1018;
	cache_wr = 32'h6666_7777;
	cache_valid = 1'b1;
	cache_rw = 1'b1;
	end
	
	
	
	///2nd entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h200_1018;
	cache_wr = 32'hCD12_12CD;
	
	//3rd entry on the same index
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h100_1018;
	cache_wr = 32'hAB00_00BA;
	
	
	// PAUSE
	@ (posedge cache_ready) 
	@ (posedge clk) begin
	cache_valid = 1'b0;
	cache_rw = 1'b0;
	
	end
	
	#100
	
	// READ BACk
	
	@ (posedge clk) begin
	cache_valid = 1'b1;
	cache_rw = 1'b0;
	
	end
	
	// 1st entry
	@ (posedge cache_ready) 	
	@ (posedge clk) begin
	cache_addr = 28'h100_1018;
	end
	
	
	
	///2nd entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h200_1018;
	
	// READ OTHER ADDRESSES FROM I CACHE
	//3 entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h200_0000;

	
	//4 entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_1010;


	//5 entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_1018;


	//5 entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h000_1030;
	
	
	//6 entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h300_1038;

	
	//7 entry
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'h300_1040;
	
	@ (posedge cache_ready) 
	@ (posedge clk) begin
	cache_valid = 0; 
	end
	
	#500
	@ (posedge clk) begin
	flush = 1;
	cache_valid = 1; 
	end
	
	@ (posedge cache_ready) begin
	flush = 0;
	cache_valid = 0; 
	end
	
	
	//temp_mem_addr[0] <= 31'h000_0000;
	//temp_mem_addr[1] <= 31'h200_0000;
	//temp_mem_addr[2] <= 31'h000_1010;
	//temp_mem_addr[3] <= 31'h000_1018;
	//temp_mem_addr[4] <= 31'h100_1018;
	//temp_mem_addr[5] <= 31'h200_1018;
	//temp_mem_addr[6] <= 31'h000_1030;
	//temp_mem_addr[7] <= 31'h300_1038;
	//temp_mem_addr[8] <= 31'h300_1040;



	
	
	end //for initial
	
		always begin
    #5  clk =  ! clk;
  end
      
endmodule

