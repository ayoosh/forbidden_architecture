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
module top_module_nochipscope #
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
		
		// DVI
	 output hsync,
    output vsync,
	 output blank,
	 output dvi_rst,
	 
	 output [7:0] pixel_r,
    output [7:0] pixel_g,
    output [7:0] pixel_b,
	 
	 output [11:0] D,
	 
	 output clk_dvi,
	 output clk_dvi_n,
	 output txd,        // RS232 Transmit Data
    input rxd,         // RS232 Receive Data
	 inout scl_tri, sda_tri
    );
	
	// Global reset
	wire LOCKED_OUT;
	wire gl_rst = rst | ~LOCKED_OUT;
	wire clk_in;
	
	
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
	wire [27:0] mem_start_temp;
		
	// Error monitor
	wire memory_read_error1;
	wire memory_read_error2;
	wire memory_read_error3;
	
	
	reg memory_error;
	
	always @(posedge clk_in)
	if(gl_rst)
	memory_error <= 0;
	else if(memory_read_error1)
	memory_error <= 1;
	
	assign memory_read_error = memory_error;
	// End of error monitor
	
	// Chipscope wires
	wire app_wdf_wren;
	wire app_af_wren;
	wire clk200_out;
   wire [35:0] control;
	wire [999:0] dataport;
	wire [7:0] trigger;
	 wire locked_dcm;
	 wire fifo_empty;
	 wire rd_fifo;
	 wire done;
	
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
		
			
		// DVI related 
		wire last_addr_update;
		wire [27:0] mem_start;
		wire display_on;
		
		// IO instructions wires
		wire [31:0]  io_mem_data_wr;
		wire [31:0]  io_mem_data_rd;
		wire [27:0]   io_mem_data_addr;
		wire io_mem_rw_data; 
		wire io_mem_valid_data;
		wire io_mem_ready_data;
		
		// IO to SPART wires 
			wire	   [31:0] spart_mem_data_wr;				
	      wire      [31:0] spart_mem_data_rd;											
         wire     [27:0]  spart_mem_data_addr;											
	       wire              spart_mem_rw_data;             							
	     wire               spart_mem_valid_data;				
	    wire 				  spart_mem_ready_data;	
		 
		 // Cache CPU wires
		 	// Cache wires
		wire	[31:0]	cache_addr;
		wire		[31:0]	cache_wr;
		wire				cache_rw;
		wire				cache_valid;
		wire				flush;


		wire		[31:0]	cache_rd;
		wire				cache_ready;
		
		wire   state_output;
	

		Arbiter arbiter_module (
		.clk(clk_in), 
		.reset(gl_rst), 
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
		.mem_valid_data1(low_tie),  // Disabling I-cache 
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
		.mem_valid_data3(mem_valid_data3), 
		.mem_ready_data3(mem_ready_data3)
	);
	
	// DDR instantiation
	interface example_interface
	(
		.clk(clk_in),
		.rst(gl_rst),
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
		.clk0_tb(clk0_tb),
	   .clk200_out(clk200_out),
		.app_af_wren(app_af_wren),
		.app_wdf_wren(app_wdf_wren)
	);
	
     // DVI INTERFACE
		vgamult DVI_interface (
		.clk_100mhz(clk_in), 
		.ext_rst(gl_rst), 
		.pixel_r(pixel_r), 
		.pixel_g(pixel_g), 
		.pixel_b(pixel_b), 
		.hsync(hsync), 
		.vsync(vsync), 
		.blank(blank), 
		.clk(clk_dvi), 
		.clk_n(clk_dvi_n), 
		.D(D), 
		.dvi_rst(dvi_rst), 
		.scl_tri(scl_tri), 
		.sda_tri(sda_tri), 
		.data_rd(mem_data_rd3), 
		.mem_ready_data(mem_ready_data3), 
		.data_wr(mem_data_wr3), 
		.mem_data_addr(mem_data_addr3), 
		.mem_rw_data(mem_rw_data3), 
		.mem_valid_data(mem_valid_data3), 
		.last_addr_update(last_addr_update),
		.locked_dcm(locked_dcm),
	   .fifo_empty(fifo_empty),
	   .rd_fifo(rd_fifo),
	   .done(done),
		.mem_start(mem_start),
		.display_on(display_on)
	);
	
	// IO Map address blocks
		IO_map_address_block IO_map_block (
		.clk(clk_in), 
		.rst(gl_rst), 
		.io_mem_data_wr(io_mem_data_wr), 
		.io_mem_data_rd(io_mem_data_rd), 
		.io_mem_data_addr(io_mem_data_addr), 
		.io_mem_rw_data(io_mem_rw_data), 
		.io_mem_valid_data(io_mem_valid_data), 
		.io_mem_ready_data(io_mem_ready_data), 
		.mem_start(mem_start), 
		.display_on(display_on), 
		.spart_mem_data_wr(spart_mem_data_wr), 
		.spart_mem_data_rd(spart_mem_data_rd), 
		.spart_mem_data_addr(spart_mem_data_addr), 
		.spart_mem_rw_data(spart_mem_rw_data), 
		.spart_mem_valid_data(spart_mem_valid_data), 
		.spart_mem_ready_data(spart_mem_ready_data)
	);
	
	
	// Dummy models, DON'T REMOVE ---- Kept temporarily to tie off signals since I cache is not used .. 
	Icache_dummy Icache_dummy (
		.clk(clk_in), 
		.rst(gl_rst), 
		.mem_data_wr1(mem_data_wr1), 
		.mem_data_rd1(mem_data_rd1), 
		.mem_data_addr1(mem_data_addr1), 
		.mem_rw_data1(mem_rw_data1), 
		.mem_valid_data1(mem_valid_data1), 
		.mem_ready_data1(mem_ready_data1),
		.error(memory_read_error1)
	);


	
		cache_controller Dcache_inst (
		.clk 			(clk_in),
		.rst_n 			(~gl_rst),
		.cache_addr		(cache_addr[27:0]),
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
		.mem_valid_out	(mem_valid_data2),
		
		.IO_rd(io_mem_data_rd),
	   .IO_ready(io_mem_ready_data),
	
	   .IO_addr(io_mem_data_addr),
	   .IO_wr(io_mem_data_wr),
	   .IO_rw(io_mem_rw_data),
	   .IO_valid(io_mem_valid_data)
	);	

	
	// NPU Processor Wires
	
	wire [31:0] npu_output_data;
   wire npu_output_fifo_empty;
   wire npu_input_fifo_full;
   wire npu_config_fifo_full;
	
	wire	[31:0]	npu_input_fifo;
	wire			npu_input_fifo_we;
	wire	[31:0]	npu_config_fifo;
	
	wire npu_config_fifo_we;
	wire npu_output_fifo_re;
	wire halt;
	
	wire [31:0]cache_rd_instr;
	wire [31:0] cache_addr_instr;

  Processor Processor(
	// Outputs
	.cache_addr_instr(cache_addr_instr),
	.cache_addr_data(cache_addr),
	.cache_wr_data(cache_wr),
	.cache_rw_data(cache_rw),
//	,//output			cache_valid_instr,
	.cache_valid_data(cache_valid),
	.cache_flush_data(flush),
	.npu_input_fifo(npu_input_fifo),
	.npu_input_fifo_we(npu_input_fifo_we),
	.npu_config_fifo(npu_config_fifo),
	.npu_config_fifo_we(npu_config_fifo_we),
	.npu_output_fifo_re(npu_output_fifo_re),
//	,//output			halt,
	// Inputs
	.cache_rd_instr(cache_rd_instr),
	.cache_rd_data(cache_rd),
	.cache_ready_instr(1),   // Tied to 1
   .cache_ready_data(cache_ready),
	.npu_output_fifo(npu_output_data),
	.npu_output_fifo_empty(npu_output_fifo_empty),
	.npu_input_fifo_full(npu_input_fifo_full),
	.npu_config_fifo_full(npu_config_fifo_full),
	.clk(clk_in),
	.clk_x2(CLK2X_OUT),
	.rst_n(~gl_rst)
);



npu npu(
    .CLK(clk_in),
    .RST(gl_rst),
    .npu_input_data(npu_input_fifo),
    .npu_input_fifo_write_enable(npu_input_fifo_we),
    .npu_config_data(npu_config_fifo[25:0]),
    .npu_config_fifo_write_enable(npu_config_fifo_we),
    .npu_output_fifo_read_enable(npu_output_fifo_re),
	 //Outputs
    .npu_output_data(npu_output_data),
    .npu_output_fifo_empty(npu_output_fifo_empty),
    .npu_input_fifo_full(npu_input_fifo_full),
    .npu_config_fifo_full(npu_config_fifo_full)
    );	
	 
I_cache InstructionROM (
  .clka(clk_in), // input clka
  .addra(cache_addr_instr[15:0]), // input [8 : 0] addra
  .douta(cache_rd_instr[31:0]) // output [31 : 0] douta
);


	spart_top_level spart_interface
	(
		.clk(clk_in),         // 100mhz clock
		.rst(gl_rst),         // Asynchronous reset, tied to dip switch 0
		.txd(txd),        // RS232 Transmit Data
		.rxd(rxd),         // RS232 Receive Data
	
	// Signals from/to SPART Cache interface
		.io_rw_data(spart_mem_rw_data),
		.io_valid_data(spart_mem_valid_data),
		.io_ready_data(spart_mem_ready_data),
		.mem_addr(spart_mem_data_addr),
		.io_rd_data(spart_mem_data_rd),
		.io_wr_data(spart_mem_data_wr)
    );


   // Clock generator for register file
	Reg_clk_Gen Register_clock (
    .CLKIN_IN(clk), 
    .RST_IN(rst), 
    .CLKIN_IBUFG_OUT(CLKIN_IBUFG_OUT), 
    .CLK0_OUT(clk_in), 
    .CLK2X_OUT(CLK2X_OUT), 
    .LOCKED_OUT(LOCKED_OUT)
    );

// Chipscope related items
/*		icon icon_1
	(
		.CONTROL0(control)
	);
	
	ila ila_1
	(
		.CLK(clk200_out),
		.CONTROL(control),
		.DATA(dataport),
		.TRIG0(trigger)
	);
*/
	//assign dataport[0] = clk_in;
	assign dataport[256:1] = mem_data_wr2;
	assign dataport[512:257] = mem_data_rd2;
	assign dataport[540:513] = mem_data_addr2;
	assign dataport[541] = mem_rw_data2;
	
	assign dataport[542] = cache_rw;
		assign dataport[543] = cache_ready;
			assign dataport[544] = cache_valid;
			
			assign dataport[572:545] = cache_addr[27:0];
			assign dataport[604:573] = cache_wr;
			
			

	// Arbiter signals
	assign dataport[633:606] = mem_data_addr3;
	
	assign dataport[665:634] = cache_addr_instr;
	assign dataport[697:666] = cache_rd_instr;  

	assign dataport[824] = mem_ready_data3;
	assign dataport[825] = mem_valid_data3;
	assign dataport[826] = mem_ready_data2;
	assign dataport[827] = memory_read_error2;
	assign dataport[828] = mem_valid_data1;
	assign dataport[829] = mem_valid_data2;
	
	
	assign dataport[830] = mc_rd_valid;
	assign dataport[831] = data_wren;
	assign dataport[832] = data_rden;
	assign dataport[833] = mc_wr_rdy;
	assign dataport[881:850] = cache_rd;
			

   assign dataport[927:900]  = mem_start; 
	assign dataport[952] = scl_tri;
	assign dataport[953] = sda_tri;
	assign dataport[965:954] = D;
	assign dataport[966] = dvi_rst;
	assign dataport[967] = hsync;
	assign dataport[968] = vsync;
	assign dataport[969] = blank;
	
	assign dataport[970] = locked_dcm;
	assign dataport[971] = fifo_empty;
	assign dataport[972] = rd_fifo;
	assign dataport[973] = done;
	assign dataport[974] = rst;
	assign dataport[975] = gl_rst;
	
	assign dataport[976] = app_af_wren;
	assign dataport[977] = app_wdf_wren;
	

	//  assign dataport[978] = state_output;
	
//	assign trigger[0] = clk0_tb;
	assign trigger[1] = mc_rd_valid;
	assign trigger[2] = app_wdf_wren;
	assign trigger[3] = app_af_wren;
	assign trigger[4] = data_wren;
	assign trigger[5] = data_rden;
	assign trigger[6] = mc_wr_rdy;
	assign trigger[7] = memory_read_error;
	
	endmodule
