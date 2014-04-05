`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:45:03 03/18/2014 
// Design Name: 
// Module Name:    npu_input_interface 
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
module npu_input_interface(
    input CLK,
    input npu_rst,
    input npu_input_fifo_write_en,
    input npu_input_fifo_read_en,
    input [31:0] npu_input_data,
    input npu_input_interface_conf_data_en,
    input [15:0] npu_input_interface_conf_data,
    output [15:0] npu_input_interface_data_out,
    output npu_input_fifo_full,
    output npu_input_fifo_empty
    );

wire signed [15:0] npu_signed2fixed;
wire signed [15:0] npu_float2fixed_data;
wire signed [15:0] npu_input_fifo_din;

reg signed [15:0] npu_input_convert_format;
assign npu_input_fifo_din = npu_input_convert_format[15] ? npu_float2fixed_data : npu_signed2fixed; // 0:signed int; 1:single precision floating

npu_io_fifo npu_input_fifo (
  .clk(CLK), // input clk
  .rst(npu_rst), // input rst
  .din(npu_input_fifo_din), // input [15 : 0] din
  .wr_en(npu_input_fifo_write_en), // input wr_en
  .rd_en(npu_input_fifo_read_en), // input rd_en
  .dout(npu_input_interface_data_out), // output [15 : 0] dout
  .full(npu_input_fifo_full), // output full
  .empty(npu_input_fifo_empty) // output empty
);

npu_float2fixed npu_float2fixed (
	.a({npu_input_data[31], npu_input_data[30:23] + npu_input_convert_format[7:0], npu_input_data[22:0]}), // input [31 : 0] a
	.result(npu_float2fixed_data)); // ouput [15 : 0] result

  assign npu_signed2fixed = ((npu_input_convert_format[14:0] ==  0) ? {npu_input_data[ 8:0], 7'h0} :
									 ((npu_input_convert_format[14:0] ==  1) ? {npu_input_data[ 9:0], 6'h0} :
									 ((npu_input_convert_format[14:0] ==  2) ? {npu_input_data[10:0], 5'h0} :
									 ((npu_input_convert_format[14:0] ==  3) ? {npu_input_data[11:0], 4'h0} :
									 ((npu_input_convert_format[14:0] ==  4) ? {npu_input_data[12:0], 3'h0} :
									 ((npu_input_convert_format[14:0] ==  5) ? {npu_input_data[13:0], 2'h0} :
									 ((npu_input_convert_format[14:0] ==  6) ? {npu_input_data[14:0], 1'h0} :
									 ((npu_input_convert_format[14:0] ==  7) ? npu_input_data[15:0] :
									 ((npu_input_convert_format[14:0] ==  8) ? npu_input_data[16:1] :
									 ((npu_input_convert_format[14:0] ==  9) ? npu_input_data[17:2] :
									 ((npu_input_convert_format[14:0] == 10) ? npu_input_data[18:3] :
									 ((npu_input_convert_format[14:0] == 11) ? npu_input_data[19:4] :
									 ((npu_input_convert_format[14:0] == 12) ? npu_input_data[20:5] :
									 ((npu_input_convert_format[14:0] == 13) ? npu_input_data[21:6] :
									 ((npu_input_convert_format[14:0] == 14) ? npu_input_data[22:7] :
									 ((npu_input_convert_format[14:0] == 15) ? npu_input_data[23:8] :
									 ((npu_input_convert_format[14:0] == 16) ? npu_input_data[24:9] :
									 ((npu_input_convert_format[14:0] == 17) ? npu_input_data[25:10] :
									 ((npu_input_convert_format[14:0] == 18) ? npu_input_data[26:11] :
									 ((npu_input_convert_format[14:0] == 19) ? npu_input_data[27:12] :
									 ((npu_input_convert_format[14:0] == 20) ? npu_input_data[28:13] :
									 ((npu_input_convert_format[14:0] == 21) ? npu_input_data[29:14] :
									 ((npu_input_convert_format[14:0] == 22) ? npu_input_data[30:15] :
									 ((npu_input_convert_format[14:0] == 23) ? npu_input_data[31:16] : 0 ))))))))))))))))))))))));

always @(posedge CLK) begin
  if (npu_rst) begin
    npu_input_convert_format <= 0;
  end // npu_rst
  else begin // ~npu_rst
    if (npu_input_interface_conf_data_en) begin // Writing config data
	   npu_input_convert_format <= npu_input_interface_conf_data;
	 end // npu_input_interface_conf_data_en
  end // ~npu_rst
end // always

endmodule
