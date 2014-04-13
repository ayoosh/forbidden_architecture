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
module top_level(
    input clk,         // 100mhz clock
    input rst,         // Asynchronous reset, tied to dip switch 0
    output txd,        // RS232 Transmit Data
    input rxd,         // RS232 Receive Data
    input [1:0] br_cfg, // Baud Rate Configuration, Tied to dip switches 2 and 3
	output piso_led,
	output rda_out,
	output tbr_out,
	output tx_led,
	output rx_led,
	output iorw_out,
	output iocs_out,
	output reg data_wr_rdy_out
    );
	
	wire iocs;
	wire iorw;
	wire rda;
	wire tbr;
	wire [1:0] ioaddr;
	wire [7:0] databus;
	
	wire [31:0] data_ioaddr;
	wire data_wr_rdy;
	
	wire [8:0] piso_out;
	
	assign rda_out = rda;
	assign tbr_out = tbr;
	assign tx_led = txd;
	assign rx_led = rxd;
	assign iocs_out = iocs;
	assign iorw_out = iorw;
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			data_wr_rdy_out <= 1'b0;
		end
		else
		begin
			if(data_wr_rdy)
				data_wr_rdy_out <= 1'b1;
		end
	end
//	wire clk_buf;
//	wire clkin_ibufg;
//	wire clk_200;
//	wire locked_dcm;
	
	assign piso_led = piso_out[0];
	
	
	
	
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
					.br_cfg(br_cfg),
					.iocs(iocs),
					.iorw(iorw),
					.rda(rda),
					.tbr(tbr),
					.ioaddr(ioaddr),
					.databus(databus),
					.data_ioaddr(data_ioaddr),
					.data_wr_rdy(data_wr_rdy),
					.piso_out(piso_out)
					 );
					 
endmodule
