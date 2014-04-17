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
//		output 									  mc_wr_rdy,
//		output 									  mc_rd_rdy,
		input 									  data_wren,
		input 									  data_rden,
//		input  [(2*APPDATA_WIDTH)-1:0] 	  data_wr,
//		output [(2*APPDATA_WIDTH)-1:0] 	  data_rd,
//		input  [INPUT_ADDR_WIDTH-1:0] 	  data_addr,
		
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
		
		output txd,        // RS232 Transmit Data
		input rxd         // RS232 Receive Data
    );
	
	wire [255:0] data_wr;
	wire [255:0] data_rd;
	wire [(INPUT_ADDR_WIDTH-1):0]  data_addr;
	wire [(INPUT_ADDR_WIDTH-1):0]  data_addr_wr;
	wire [(INPUT_ADDR_WIDTH-1):0]  data_addr_rd;
	wire         mc_wr_rdy;
	wire 		 clk0_tb;
	wire [255:0] stored_data;
	wire [3:0] rom_address;
	wire 		 clk200_out;
	wire wren;
	
	wire iocs;
	wire iorw;
	wire rda;
	wire tbr;
	wire [1:0] ioaddr;
	wire [7:0] databus;
	wire [8:0] piso_out;
	wire data_rdy;
	wire data_written;
	wire [31:0] data_rx;
	wire [31:0] data_tx;
	wire [31:0] status_reg;
	wire spart_data_wren;
	wire spart_data_rden;
	
	assign wren = data_wren && (~mc_wr_rdy);
	
	assign data_addr = (data_rden) ? data_addr_rd : data_addr_wr;

	interface example_interface
	(
		.clk(clk),
		.rst(rst),
		.mc_wr_rdy(mc_wr_rdy),
		.mc_rd_rdy(mc_rd_rdy),
		.mc_rd_valid(mc_rd_valid),
		.data_wren(wren),
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
	
	write_data_mem write_data_cache
	(
		.clk(clk),
		.rst(rst),
		.mc_wr_rdy(mc_wr_rdy),
		.data_wren(wren),
		.data(data_wr)
	);
	
	write_data_addr write_addr_cache
	(
		.clk(clk),
		.rst(rst),
		.mc_wr_rdy(mc_wr_rdy),
		.data_wren(wren),
		.data(data_addr_wr)
	);
	
	rd_data_mem rd_data_cache(
		.clk(clk),
		.rst(rst),
		.mc_rd_rdy(mc_rd_valid),
		.data_rden(data_rden),
		.data(data_rd),
		
		.stored_data(stored_data),
		.rom_address(rom_address)
    );
	
	rd_data_addr rd_addr_cache(
		.clk(clk),
		.rst(rst),
		.mc_rd_rdy(mc_rd_valid),
		.data_rden(data_rden),
		.data(data_addr_rd)
    );
		
/*		
		rd_spart_data_mem spart_data_mem(
					.clk(clk),
					.rst(rst),
					.mc_rd_rdy(data_rdy),
					.data(data_rx)
				);
				
		wr_spart_data_mem wr_spart_data_mem(
					.clk(clk),
					.rst(rst),
					.data_written(data_written),
					.data(data_tx)
					);
*/					
		spart_top_level top_level_spart(
			.clk(clk),         // 100mhz clock
			.rst(rst),         // Asynchronous reset, tied to dip switch 0
			.txd(txd),        // RS232 Transmit Data
			.rxd(rxd),         // RS232 Receive Data
			
			.clk0_tb(clk0_tb),
			.clk200_out(clk200_out),
	
			.data_rx(data_rx),
			.data_tx(data_tx),
			.spart_data_wren(spart_data_wren),
			.spart_data_rden(spart_data_rden),
			.data_rdy(data_rdy),
			.status_register(status_reg)
		);
		
		spart_cache_interface SCI (
			.clk(clk),
			.rst(rst),
	
			// Connections to/from cache controller.
			.io_rw_data(io_rw_data),
			.io_valid_data(io_valid_data),
			.io_ready_data(io_ready_data),
			.mem_addr(mem_addr),
			.io_rd_data(io_rd_data),
			.io_wr_data(io_wr_data),
	
			// Connections to/from SPART
			.spart_data_rden(spart_data_rden),
			.spart_data_wren(spart_data_wren),
			.data_rdy(data_rdy),
			.data_tx(data_tx),
			.data_rx(data_rx),
			.status_reg(status_reg)
		);
			
endmodule
