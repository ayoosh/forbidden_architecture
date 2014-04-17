`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:   	30 Jan 2014
// Design Name: 	SPART
// Module Name:    	top_level 
// Project Name: 	
// Target Devices: 	Xilinx Virtex 5
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// No Change in this module. Default code.
//////////////////////////////////////////////////////////////////////////////////
module spart_top_level(
    input clk,         // 100mhz clock
    input rst,         // Asynchronous reset, tied to dip switch 0
    output txd,        // RS232 Transmit Data
    input rxd,         // RS232 Receive Data
	
	// Clocks from DDR2 for ChipScope
//	input clk0_tb,    
//	input clk200_out,
	
	// Signals from/to SPART Cache interface
	input io_rw_data,
	input io_valid_data,
	output io_ready_data,
	input [27:0] mem_addr,
	output [31:0] io_rd_data,
	input [31:0] io_wr_data
    );
	
	wire iocs;
	wire iorw;
	wire rda;
	wire tbr;
	wire [1:0] ioaddr;
	wire [7:0] databus;
	wire [8:0] piso_out;
	
	wire spart_data_rden;
	wire spart_data_wren;
	wire data_rdy;
	wire [31:0] data_tx;
	wire [31:0] data_rx;
	wire [31:0] status_register;
	
	
	assign spart_data_rden = (~io_rw_data && io_valid_data);
	assign spart_data_wren = (io_rw_data && io_valid_data);
	
	assign io_rd_data = (mem_addr == 28'h800_0000) ? data_rx : ((mem_addr == 28'h800_0001) ? status_register : data_rx);
	assign data_tx = io_wr_data;
	
	assign io_ready_data = (spart_data_rden) ? data_rdy : ( (spart_data_wren) ? data_rdy : 1'b0 );
	
	// Instantiate your SPART here
	spart spart0(	.clk(clk),
					.rst(rst),
					.iocs(iocs),
					.iorw(iorw),
					.rda(rda),
					.tbr(tbr),
					.ioaddr(ioaddr),
					.databus(databus),
					.txd(txd),
					.rxd(rxd),
					.piso_out(piso_out)
					);

	// Instantiate your driver here
	driver driver0( .clk(clk),
	                .rst(rst),
					.iocs(iocs),
					.iorw(iorw),
					.rda(rda),
					.tbr(tbr),
					.ioaddr(ioaddr),
					.databus(databus),
					
//					.clk0_tb(clk0_tb),
//					.clk200_out(clk200_out)
					
					.data_rx(data_rx),
					.data_tx(data_tx),
					.status_register(status_register),
					.spart_data_wren(spart_data_wren),
					.spart_data_rden(spart_data_rden),
					.data_rdy(data_rdy),
					.piso_out(piso_out)
					 );
					 
endmodule
