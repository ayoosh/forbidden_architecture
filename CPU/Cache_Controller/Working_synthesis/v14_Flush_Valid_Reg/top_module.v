`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:51 03/27/2014 
// Design Name: 
// Module Name:    top_module 
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
module top_module #
	(
		parameter BANK_WIDTH              = 2,       
														// # of memory bank addr bits.
		parameter CKE_WIDTH               = 1,       
														// # of memory clock enable outputs.
		parameter CLK_WIDTH               = 2,       
														// # of clock outputs.
		parameter COL_WIDTH               = 10,       
														// # of memory column bits.
		parameter CS_NUM                  = 1,       
														// # of separate memory chip selects.
		parameter CS_WIDTH                = 1,       
														// # of total memory chip selects.
		parameter CS_BITS                 = 0,       
														// set to log2(CS_NUM) (rounded up).
		parameter DM_WIDTH                = 8,       
														// # of data mask bits.
		parameter DQ_WIDTH                = 64,       
														// # of data width.
		parameter DQ_PER_DQS              = 8,       
														// # of DQ data bits per strobe.
		parameter DQS_WIDTH               = 8,       
														// # of DQS strobes.
		parameter DQ_BITS                 = 6,       
														// set to log2(DQS_WIDTH*DQ_PER_DQS).
		parameter DQS_BITS                = 3,       
														// set to log2(DQS_WIDTH).
		parameter ODT_WIDTH               = 1,       
														// # of memory on-die term enables.
		parameter ROW_WIDTH               = 13,       
														// # of memory row and # of addr bits.
		parameter ADDITIVE_LAT            = 0,       
														// additive write latency.
		parameter BURST_LEN               = 4,       
														// burst length (in double words).
		parameter BURST_TYPE              = 0,       
														// burst type (=0 seq; =1 interleaved).
		parameter CAS_LAT                 = 4,       
														// CAS latency.
		parameter ECC_ENABLE              = 0,       
														// enable ECC (=1 enable).
		parameter APPDATA_WIDTH           = 128,       
														// # of usr read/write data bus bits.
		parameter MULTI_BANK_EN           = 1,       
														// Keeps multiple banks open. (= 1 enable).
		parameter TWO_T_TIME_EN           = 1,       
														// 2t timing for unbuffered dimms.
		parameter ODT_TYPE                = 1,       
														// ODT (=0(none),=1(75),=2(150),=3(50)).
		parameter REDUCE_DRV              = 0,       
														// reduced strength mem I/O (=1 yes).
		parameter REG_ENABLE              = 0,       
														// registered addr/ctrl (=1 yes).
		parameter TREFI_NS                = 7800,       
														// auto refresh interval (ns).
		parameter TRAS                    = 40000,       
														// active->precharge delay.
		parameter TRCD                    = 15000,       
														// active->read/write delay.
		parameter TRFC                    = 105000,       
														// refresh->refresh, refresh->active delay.
		parameter TRP                     = 15000,       
														// precharge->command delay.
		parameter TRTP                    = 7500,       
														// read->precharge delay.
		parameter TWR                     = 15000,       
														// used to determine write->precharge.
		parameter TWTR                    = 7500,       
														// write->read delay.
		parameter HIGH_PERFORMANCE_MODE   = "TRUE",       
											// # = TRUE, the IODELAY performance mode is set
											// to high.
											// # = FALSE, the IODELAY performance mode is set
											// to low.
		parameter SIM_ONLY                = 0,       
														// = 1 to skip SDRAM power up delay.
		parameter DEBUG_EN                = 0,       
														// Enable debug signals/controls.
														// When this parameter is changed from 0 to 1,
														// make sure to uncomment the coregen commands
														// in ise_flow.bat or create_ise.bat files in
														// par folder.
		parameter CLK_PERIOD              = 3750,       
														// Core/Memory clock period (in ps).
		parameter DLL_FREQ_MODE           = "HIGH",       
														// DCM Frequency range.
		parameter CLK_TYPE                = "SINGLE_ENDED",       
														// # = "DIFFERENTIAL " ->; Differential input clocks ,
														// # = "SINGLE_ENDED" -> Single ended input clocks.
		parameter NOCLK200                = 0,       
														// clk200 enable and disable.
		parameter RST_ACT_LOW             = 1,        
														// =1 for active low reset, =0 for active high.
		parameter INPUT_ADDR_WIDTH 		 = 31 												
	)
	 (
		input 									  clk,
		input 									  rst,
		output memory_read_error,
		
		
	input		[27:0]	cache_addr,
	input		[31:0]	cache_wr,
	input				cache_rw,
	input				cache_valid,
	input				flush,


	output		[31:0]	cache_rd,
	output				cache_ready,
		
		inout  [DQ_WIDTH-1:0]              ddr2_dq,
		output [ROW_WIDTH-1:0]             ddr2_a,
		output [BANK_WIDTH-1:0]            ddr2_ba,
		output                             ddr2_ras_n,
		output                             ddr2_cas_n,
		output                             ddr2_we_n,
		output [CS_WIDTH-1:0]              ddr2_cs_n,
		output [ODT_WIDTH-1:0]             ddr2_odt,
		output [CKE_WIDTH-1:0]             ddr2_cke,
		output [DM_WIDTH-1:0]              ddr2_dm,
		input                              clk200_p,
		input                              clk200_n,
		output                             phy_init_done,
		inout  [DQS_WIDTH-1:0]             ddr2_dqs,
		inout  [DQS_WIDTH-1:0]             ddr2_dqs_n,
		output [CLK_WIDTH-1:0]             ddr2_ck,
		output [CLK_WIDTH-1:0]             ddr2_ck_n
    );
	
	wire [255:0] data_wr;
	wire [255:0] data_rd;
	wire [(INPUT_ADDR_WIDTH-1):0]  data_addr;
	wire      mc_wr_rdy;
	wire 		 clk0_tb;
	wire mc_rd_valid;
	wire data_wren;
	wire data_rden;
	
	wire high_tie = 1;
	wire low_tie = 0;
	
	// Error monitor
	wire memory_read_error1;
	//wire memory_read_error2;
	wire memory_read_error3;
	
	assign memory_read_error = (memory_read_error1 | memory_read_error3);
	
	// I-cache wires
		wire [255:0]  mem_data_wr1;
		wire [255:0]  mem_data_rd1;
		wire [27:0]   mem_data_addr1;
		wire mem_rw_data1; 
		wire mem_valid_data1;
		wire mem_ready_data1;
		
			// D-cache wires
		wire [255:0]  mem_data_wr2;
		wire [255:0]  mem_data_rd2;
		wire [27:0]   mem_data_addr2;
		wire mem_rw_data2; 
		wire mem_valid_data2;
		wire mem_ready_data2;
		
			// DVI wires
		wire [255:0]  mem_data_wr3;
		wire [255:0]  mem_data_rd3;
		wire [27:0]   mem_data_addr3;
		wire mem_rw_data3; 
		wire mem_valid_data3;
		wire mem_ready_data3;
	
		Arbiter arbiter_module (
		.clk(clk), 
		.reset(rst), 
		.data_wr(data_wr), 
		.data_addr(data_addr), 
		.data_rd(data_rd), 
		.data_rden(data_rden), 
		.data_wren(data_wren), 
		.mc_rd_valid(mc_rd_valid), 
		.mc_wr_rdy(mc_wr_rdy), 
		.mc_rd_rdy(mc_rd_rdy),  // Not used
		.mem_data_wr1(mem_data_wr1), 
		.mem_data_rd1(mem_data_rd1), 
		.mem_data_addr1(mem_data_addr1), 
		.mem_rw_data1(mem_rw_data1), 
		.mem_valid_data1(mem_valid_data1), 
		.mem_ready_data1(mem_ready_data1), 
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
		.mem_valid_data3(low_tie),  // Disabling DVI 
		.mem_ready_data3(mem_ready_data3)
	);
	
	interface example_interface
	(
		.clk(clk),
		.rst(rst),
		.mc_wr_rdy(mc_wr_rdy),
		.mc_rd_rdy(mc_rd_rdy),
		.mc_rd_valid(mc_rd_valid),
		.data_wren(data_wren),
		.data_rden(data_rden),
		.data_wr(data_wr),
		.data_rd(data_rd),
		.data_addr(data_addr),
		
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
		.clk0_tb(clk0_tb)
	);
	

	Icache_dummy Icache_dummy (
		.clk(clk), 
		.rst(rst), 
		.mem_data_wr1(mem_data_wr1), 
		.mem_data_rd1(mem_data_rd1), 
		.mem_data_addr1(mem_data_addr1), 
		.mem_rw_data1(mem_rw_data1), 
		.mem_valid_data1(mem_valid_data1), 
		.mem_ready_data1(mem_ready_data1),
		.error(memory_read_error1)
	);
	
	
	cache_controller Dcache_inst (
		.clk 			(clk),
		.rst_n 			(~rst),
		.cache_addr		(cache_addr),
		.cache_wr		(cache_wr),
		.cache_rw		(cache_rw),
		.cache_valid	(cache_valid),
		.flush			(flush),
		.mem_rd			(mem_data_rd2),
		.mem_ready		(mem_ready_data2),

		.cache_rd		(cache_rd),
		.cache_ready	(cache_ready),
		.mem_addr		(mem_data_addr2),
		.mem_wr			(mem_data_wr2),
		.mem_rw			(mem_rw_data2),
		.mem_valid_out	(mem_valid_data2)
	);
	
		DVI_dummy DVI_dummy (
		.clk(clk), 
		.rst(rst), 
		.mem_data_wr1(mem_data_wr3), 
		.mem_data_rd1(mem_data_rd3), 
		.mem_data_addr1(mem_data_addr3), 
		.mem_rw_data1(mem_rw_data3), 
		.mem_valid_data1(mem_valid_data3), 
		.mem_ready_data1(mem_ready_data3),
		.error(memory_read_error3)
	);
	

	/*
	npu npu_module(
		.CLK(clk),
		.RST(rst)
	);
	*/
endmodule
