`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:28 03/19/2014 
// Design Name: 
// Module Name:    npu_output_interface 
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
module npu_output_interface(
    input CLK,
    input npu_rst,
    input [15:0] npu_output_interface_din,
    input npu_output_fifo_write_en,
    input npu_output_fifo_read_en,
    input [15:0] npu_config_data_bus,
    input npu_ouput_format_write_en,
	 output [31:0] npu_output_interface_dout,
    output npu_output_fifo_full,
    output npu_output_fifo_empty
    );

  reg [15:0] npu_output_convert_format;  
  
  wire [15:0] npu_output_fifo_dout;
  wire [31:0] npu_fixed2float_data;
  wire [31:0] npu_fixed2float_scaled_data;
  wire [31:0] npu_fixed2signed;

  assign npu_fixed2float_scaled_data = {npu_fixed2float_data[31], npu_fixed2float_data[30:23] + npu_output_convert_format[7:0], npu_fixed2float_data[22:0]};
  assign npu_output_interface_dout = npu_output_convert_format[15] ? npu_fixed2float_scaled_data : npu_fixed2signed; // 0:signed int; 1:single precision floating

  assign npu_fixed2signed = ((npu_output_convert_format[14:0] ==  0) ? {{23{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:7]} :
                            ((npu_output_convert_format[14:0] ==  1) ? {{22{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:6]} :
                            ((npu_output_convert_format[14:0] ==  2) ? {{21{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:5]} :
                            ((npu_output_convert_format[14:0] ==  3) ? {{20{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:4]} :
                            ((npu_output_convert_format[14:0] ==  4) ? {{19{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:3]} :
                            ((npu_output_convert_format[14:0] ==  5) ? {{18{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:2]} :
                            ((npu_output_convert_format[14:0] ==  6) ? {{17{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:1]} :
                            ((npu_output_convert_format[14:0] ==  7) ? {{16{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0]} :
                            ((npu_output_convert_format[14:0] ==  8) ? {{15{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 1'h0} :
                            ((npu_output_convert_format[14:0] ==  9) ? {{14{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 2'h0} :
                            ((npu_output_convert_format[14:0] == 10) ? {{13{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 3'h0} :
                            ((npu_output_convert_format[14:0] == 11) ? {{12{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 4'h0} :
                            ((npu_output_convert_format[14:0] == 12) ? {{11{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 5'h0} :
                            ((npu_output_convert_format[14:0] == 13) ? {{10{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 6'h0} :
                            ((npu_output_convert_format[14:0] == 14) ? {{ 9{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 7'h0} :
                            ((npu_output_convert_format[14:0] == 15) ? {{ 8{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 8'h0} :
                            ((npu_output_convert_format[14:0] == 16) ? {{ 7{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 9'h0} :
                            ((npu_output_convert_format[14:0] == 17) ? {{ 6{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 10'h0} :
                            ((npu_output_convert_format[14:0] == 18) ? {{ 5{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 11'h0} :
                            ((npu_output_convert_format[14:0] == 19) ? {{ 4{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 12'h0} :
                            ((npu_output_convert_format[14:0] == 20) ? {{ 3{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 13'h0} :
                            ((npu_output_convert_format[14:0] == 21) ? {{ 2{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 14'h0} :
                            ((npu_output_convert_format[14:0] == 22) ? {{ 1{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 15'h0} :
									 ((npu_output_convert_format[14:0] == 22) ? {{ 1{npu_output_fifo_dout[15]}}, npu_output_fifo_dout[15:0], 15'h0} :
									 ((npu_output_convert_format[14:0] == 23) ? {    npu_output_fifo_dout[15:0], 16'h0} : 0 )))))))))))))))))))))))));
                            
                              
										 
										 
  npu_io_fifo npu_ouput_fifo (
  .clk(CLK), // input clk
  .rst(npu_rst), // input rst
  .din(npu_output_interface_din), // input [15 : 0] din
  .wr_en(npu_output_fifo_write_en), // input wr_en
  .rd_en(npu_output_fifo_read_en), // input rd_en
  .dout(npu_output_fifo_dout), // output [15 : 0] dout
  .full(npu_output_fifo_full), // output full
  .empty(npu_output_fifo_empty) // output empty
  );

  npu_fixed2float npu_fixed2float (
	.a(npu_output_fifo_dout), // input [15 : 0] a
	.result(npu_fixed2float_data)); // ouput [31 : 0] result
	
always @(posedge CLK) begin
  if (npu_rst) begin
    npu_output_convert_format <= 0;
  end // npu_rst
  else begin // ~npu_rst
    if (npu_ouput_format_write_en) begin // Writing config data
	   npu_output_convert_format <= npu_config_data_bus;
	 end // npu_input_interface_conf_data_en
  end // ~npu_rst
end // always


endmodule
