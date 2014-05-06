`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:04:54 03/04/2014 
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
module mig_top_module #
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
   parameter RST_ACT_LOW             = 1        
                                       // =1 for active low reset, =0 for active high.
   )
  (
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
   input                              sys_clk_in,
   input                              clk200_p,
	input                              clk200_n,
   input                              sys_rst_n,
   output                             phy_init_done,
   output                             rst0_tb,
   output                             clk0_tb,
   output                             app_wdf_afull,
   output                             app_af_afull,
   output                             rd_data_valid,
   input                              app_wdf_wren,
   input                              app_af_wren,
   input  [30:0]                      app_af_addr,
   input  [2:0]                       app_af_cmd,
   output [(APPDATA_WIDTH)-1:0]                rd_data_fifo_out,
   input  [(APPDATA_WIDTH)-1:0]                app_wdf_data,
   input  [(APPDATA_WIDTH/8)-1:0]              app_wdf_mask_data,
   inout  [DQS_WIDTH-1:0]             ddr2_dqs,
   inout  [DQS_WIDTH-1:0]             ddr2_dqs_n,
   output [CLK_WIDTH-1:0]             ddr2_ck,
   output [CLK_WIDTH-1:0]             ddr2_ck_n,
   
   output							  clk200_out
   );
	
	
	wire clk200;
	/*
   wire locked;	
	wire CLK0_OUT;
	wire CLKIN_IBUFG_OUT;
   clk_gen clk_gen_instance (
    .CLKIN_IN(sys_clk_in), 
    .RST_IN(sys_rst_n), 
    .CLK0_OUT(CLK0_OUT), 
    .CLK2X_OUT(clk200), 
    .LOCKED_OUT(locked)
    );
	*/
  /*
   IBUFDS #(
   .DIFF_TERM("FALSE"),       // Differential Termination
   .IOSTANDARD("DEFAULT")     // Specify the input I/O standard
   ) IBUFDS_inst (
   .O(clk200),  // Buffer output
   .I(clk200_p),  // Diff_p buffer input (connect directly to top-level port)
   .IB(clk200_n) // Diff_n buffer input (connect directly to top-level port)
   );
	*/
	IBUFDS #(
	.CAPACITANCE("DONT_CARE"), // "LOW", "NORMAL", "DONT_CARE" (Virtex-4 only)
	.DIFF_TERM("FALSE"), // Differential Termination (Virtex-4/5, Spartan-3E/3A)
	.IBUF_DELAY_VALUE("0"), // Specify the amount of added input delay for
	// the buffer, "0"-"16" (Spartan-3E only)
	.IFD_DELAY_VALUE("AUTO"), // Specify the amount of added delay for input
	// register, "AUTO", "0"-"8" (Spartan-3E/3A only)
	.IOSTANDARD("DEFAULT") // Specify the input I/O standard
	) IBUFDS_inst (
	.O(clk200), // Buffer output
	.I(clk200_p), // Diff_p buffer input (connect directly to top-level port)
	.IB(clk200_n) // Diff_n buffer input (connect directly to top-level port)
	);
  
   mig_user mig(
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
   .sys_clk(sys_clk_in),
   .idly_clk_200(clk200),
   .sys_rst_n(sys_rst_n),
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
endmodule
