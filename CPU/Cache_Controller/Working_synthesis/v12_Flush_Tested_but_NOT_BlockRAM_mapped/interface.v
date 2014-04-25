`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:00:28 03/26/2014 
// Design Name: 
// Module Name:    interface 
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
module interface #
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
		output 									  mc_wr_rdy,
		output 									  mc_rd_rdy,
		output 									  mc_rd_valid,
		input 									  data_wren,
		input 									  data_rden,
		input  [(2*APPDATA_WIDTH)-1:0] 	  data_wr,
		output [(2*APPDATA_WIDTH)-1:0] 	  data_rd,
		input  [INPUT_ADDR_WIDTH-1:0] 	  data_addr,
		
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
		output [CLK_WIDTH-1:0]             ddr2_ck_n,
		
		output							   clk0_tb
    );
	 
//	wire app_wdf_afull = 1'b0;
//	wire app_af_afull = 1'b0;
//	wire read_data_valid = 1'b0;
	
	wire app_wdf_wren;
	wire app_af_wren;
	wire [(INPUT_ADDR_WIDTH-1):0] app_af_addr;
	wire [2:0] app_af_cmd;
	wire [127:0] rd_data_fifo_out;
	wire [127:0] app_wdf_data;
	wire [15:0] app_wdf_mask_data;
	
	wire rst_interface = rst && phy_init_done;
	
	wire clk200_out;
	
	wire [35:0] control;
	wire [835:0] dataport;
	wire [7:0] trigger;
	
	wire data_wren_1 = data_wren && phy_init_done;
	wire data_rden_1 = data_rden && phy_init_done;
	
	//wire [(INPUT_ADDR_WIDTH-1):0] app_af_addr_1;
	
	//assign app_af_addr_1 = {6'd0, app_af_addr};
	 
	data_rd_wr #
	(
		.APPDATA_WIDTH(APPDATA_WIDTH),     
		.BANK_WIDTH(BANK_WIDTH),       
		.COL_WIDTH(COL_WIDTH),       
		.ROW_WIDTH(ROW_WIDTH),
		.INPUT_ADDR_WIDTH(INPUT_ADDR_WIDTH)
	)
	data_mig_interface
	(
	   .app_wdf_afull(app_wdf_afull),          // output from MIG
								// Indicates that the write data FIFO is currently full inside
								// MIG module.
	   .app_af_afull(app_af_afull),			// output from MIG
									// Indicates that the address FIFO is currently full inside
									// MIG module.
	   .rd_data_valid(rd_data_valid),			// output from MIG
									// Indicates that the data being read from MIG is currently valid.
	   .app_wdf_wren(app_wdf_wren),			// input to MIG
									// Interface is writing data in the MIG for DDR2.
	   .app_af_wren(app_af_wren),			// input to MIG
									// Interface is writing address in the MIG for DDR2.
		// Get the truncated data from top module.
	   .app_af_addr(app_af_addr),			// input to MIG
	   .app_af_cmd(app_af_cmd),				// input to MIG
	   .rd_data_fifo_out(rd_data_fifo_out),		// output from MIG
	   .app_wdf_data(app_wdf_data),			// input to MIG
	   .app_wdf_mask_data(app_wdf_mask_data),	    // input to MIG
	   
	   .clk(clk), 		// input from top module
	   .rst(rst),			// input from top module
	   .mc_wr_rdy(mc_wr_rdy),				
									// Output to cache controller to indicate whether memory controller
									// is ready to write the data into MIG or not.
	   .mc_rd_rdy(mc_rd_rdy),
									// Output to cache controller to indicate whether memory controller
									// is ready to read the data from MIG or not.
	   .mc_rd_valid(mc_rd_valid),
									// Output to cache controller to indicate whether memory controller
									// is ready to read the data from MIG or not.
	   .data_wren(data_wren_1),
									// Input from cache to indicate that cache is ready to write the data.
	   .data_rden(data_rden_1),
									// Input from cache to indicate that cache is ready to read the data.
	   .data_wr(data_wr),
									// Input data from cache.
	   .data_rd(data_rd),
									// Output the data to cache
	   .data_addr(data_addr)
									// DDR2 address to read/write the data from/to.
	);
	 
	 
/*	
	mig_top_module #
	(
	.BANK_WIDTH(BANK_WIDTH),
    .COL_WIDTH(COL_WIDTH),
    .ROW_WIDTH(ROW_WIDTH),

    .CKE_WIDTH(CKE_WIDTH),
    .CLK_WIDTH(CLK_WIDTH),
    .CS_NUM(CS_NUM),
    .CS_WIDTH(CS_WIDTH),
    .CS_BITS(CS_BITS),
    .DM_WIDTH(DM_WIDTH),
    .DQ_WIDTH(DQ_WIDTH),
    .DQ_PER_DQS(DQ_PER_DQS),
    .DQ_BITS(DQ_BITS),
    .DQS_WIDTH(DQS_WIDTH),
    .DQS_BITS(DQS_BITS),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
    .ODT_WIDTH(ODT_WIDTH),

    .APPDATA_WIDTH(APPDATA_WIDTH),

    .ADDITIVE_LAT(ADDITIVE_LAT),
    .CAS_LAT(CAS_LAT),

    .BURST_LEN(BURST_LEN),
    .BURST_TYPE(BURST_LEN),
    .ECC_ENABLE(ECC_ENABLE),
    .MULTI_BANK_EN(MULTI_BANK_EN),
    .ODT_TYPE(ODT_TYPE),
    .REDUCE_DRV(REDUCE_DRV),
    .REG_ENABLE(REG_ENABLE),
    .TREFI_NS(TREFI_NS),
    .TRAS(TRAS),
    .TRCD(TRCD),
    .TRFC(TRFC),
    .TRP(TRP),
    .TRTP(TRTP),
    .TWR(TWR),
    .TWTR(TWTR),
    .SIM_ONLY(SIM_ONLY),
    .RST_ACT_LOW(RST_ACT_LOW),
    .CLK_TYPE(CLK_TYPE),
    .DLL_FREQ_MODE(DLL_FREQ_MODE),
    .CLK_PERIOD(CLK_PERIOD)
	)
	mig_top
	(
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
   .sys_clk_in(clk),
   .clk200_p(clk200_p),
   .clk200_n(clk200_n),
   .sys_rst_n(~rst),
   .phy_init_done(phy_init_done),
   .rst0_tb(rst0_tb),
   .clk0_tb(clk0_tb),
   .app_wdf_afull(app_wdf_afull),
   .app_af_afull(app_af_afull),
   .rd_data_valid(rd_data_valid),
   .app_wdf_wren(app_wdf_wren),
   .app_af_wren(app_af_wren),
   .app_af_addr(app_af_addr),
   .app_af_cmd(app_af_cmd),
   .rd_data_fifo_out(rd_data_fifo_out),
   .app_wdf_data(app_wdf_data),
   .app_wdf_mask_data(app_wdf_mask_data),
   .ddr2_dqs(ddr2_dqs),
   .ddr2_dqs_n(ddr2_dqs_n),
   .ddr2_ck(ddr2_ck),
   .ddr2_ck_n(ddr2_ck_n),
   
   .clk200_out(clk200_out)
	);
	*/
	
	
	mig_ddr2_model #
	(
	.BANK_WIDTH(BANK_WIDTH),
    .COL_WIDTH(COL_WIDTH),
    .ROW_WIDTH(ROW_WIDTH),

    .CKE_WIDTH(CKE_WIDTH),
    .CLK_WIDTH(CLK_WIDTH),
    .CS_NUM(CS_NUM),
    .CS_WIDTH(CS_WIDTH),
    .CS_BITS(CS_BITS),
    .DM_WIDTH(DM_WIDTH),
    .DQ_WIDTH(DQ_WIDTH),
    .DQ_PER_DQS(DQ_PER_DQS),
    .DQ_BITS(DQ_BITS),
    .DQS_WIDTH(DQS_WIDTH),
    .DQS_BITS(DQS_BITS),
    .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
    .ODT_WIDTH(ODT_WIDTH),

    .APPDATA_WIDTH(APPDATA_WIDTH),

    .ADDITIVE_LAT(ADDITIVE_LAT),
    .CAS_LAT(CAS_LAT),

    .BURST_LEN(BURST_LEN),
    .BURST_TYPE(BURST_LEN),
    .ECC_ENABLE(ECC_ENABLE),
    .MULTI_BANK_EN(MULTI_BANK_EN),
    .ODT_TYPE(ODT_TYPE),
    .REDUCE_DRV(REDUCE_DRV),
    .REG_ENABLE(REG_ENABLE),
    .TREFI_NS(TREFI_NS),
    .TRAS(TRAS),
    .TRCD(TRCD),
    .TRFC(TRFC),
    .TRP(TRP),
    .TRTP(TRTP),
    .TWR(TWR),
    .TWTR(TWTR),
    .SIM_ONLY(SIM_ONLY),
    .RST_ACT_LOW(RST_ACT_LOW),
    .CLK_TYPE(CLK_TYPE),
    .DLL_FREQ_MODE(DLL_FREQ_MODE),
    .CLK_PERIOD(CLK_PERIOD)
	)
	mig_top
	(
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
   .sys_clk_p(clk),
   .sys_clk_n(clk),
   .clk200_p(clk200_p),
   .clk200_n(clk200_n),
   .sys_rst_n(~rst),
   .phy_init_done(phy_init_done),
   .rst0_tb(rst0_tb),
   .clk0_tb(clk0_tb),
   .app_wdf_afull(app_wdf_afull),
   .app_af_afull(app_af_afull),
   .rd_data_valid(rd_data_valid),
   .app_wdf_wren(app_wdf_wren),
   .app_af_wren(app_af_wren),
   .app_af_addr(app_af_addr),
   .app_af_cmd(app_af_cmd),
   .rd_data_fifo_out(rd_data_fifo_out),
   .app_wdf_data(app_wdf_data),
   .app_wdf_mask_data(app_wdf_mask_data),
   .ddr2_dqs(ddr2_dqs),
   .ddr2_dqs_n(ddr2_dqs_n),
   .ddr2_ck(ddr2_ck),
   .ddr2_ck_n(ddr2_ck_n)
	);
	

endmodule
