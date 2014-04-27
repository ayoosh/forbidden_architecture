`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:   	30 Jan 2014
// Design Name: 	SPART
// Module Name:    	brg
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
// Baud Rate Generator
//////////////////////////////////////////////////////////////////////////////////
module brg(
input [7:0] databus,
input 		clk,rst,
input [1:0] ioaddr,
output 		brg_en, 	//Signifies 1/16 of a baud .. Send to Rx
output 		brg_full	//Goes high every baud .. Send to Tx
);

reg [15:0] 	div_buffer, div_buffer_next;
reg [15:0] 	cnt, cnt_next;
reg [3:0] 	full_cnt;

wire [3:0] 	full_cnt_next;
wire 		zero; // If Zero true or not

always @(posedge clk) begin
	if(rst == 1'b1) begin
		// Default DB to 100 MHz and 9600 baud
		cnt 		<= 16'd650; 		// Gets DB
		full_cnt 	<= 4'hf; 			// Counts down from 15 to 0
		div_buffer 	<= 16'd650;        	// Rounded to 100M/9600 - 1
	end
	else begin
		cnt 		<= cnt_next;
		full_cnt 	<= full_cnt_next;	
		div_buffer 	<= div_buffer_next;
	
	end
end

always @(*) begin
	// Defaults
	div_buffer_next = div_buffer;
	cnt_next 		= cnt - 1;

	// Load DivisionBuffer(high)
	if(ioaddr == 2'b11)
		div_buffer_next = {databus, div_buffer[7:0]};
		
	// Load DivisionBuffer(low)
	if(ioaddr == 2'b10)
		div_buffer_next = {div_buffer[15:8], databus};
	

	// Reset/Roll cnt to the contents of the DivisionBuffer
	if(zero == 1'b1)
		cnt_next = div_buffer;
end

assign zero = (cnt == 16'h0000) ? 1'b1 : 1'b0;
assign full_cnt_next = full_cnt - zero; // Only decrements when cnt is 0

assign brg_en = zero;
assign brg_full = (full_cnt == 4'h0 && brg_en == 1'b1) ? 1'b1 : 1'b0;

endmodule