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
	input clk0_tb,    
	input clk200_out,
	
	// Signals from/to SPART Cache interface
	output [31:0] data_rx,
	input [31:0] data_tx,
	output [31:0] status_register,
	input spart_data_wren,
	input spart_data_rden,
	output data_rdy
    );
	
	wire iocs;
	wire iorw;
	wire rda;
	wire tbr;
	wire [1:0] ioaddr;
	wire [7:0] databus;
	wire [8:0] piso_out;
	
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
					.data_rx(data_rx),
					.data_tx(data_tx),
					.status_register(status_register),
					.spart_data_wren(spart_data_wren),
					.spart_data_rden(spart_data_rden),
					.data_rdy(data_rdy),
					.piso_out(piso_out),
					
					.clk0_tb(clk0_tb),
					.clk200_out(clk200_out)
					 );
					 
endmodule
