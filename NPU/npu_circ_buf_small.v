`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    npu_circ_buf_large 
// Description:    Circular buffer for Weights and Scheduling, Depth 512 * 16. While writing config
// write_en is high. While reading the read_en is high. The value being read also get written at the tail end of the FIFO.
// Hence the circular nature.
//
// Dependencies: full and empty signals for FIFO are not checked. Make sure that violations do not occur
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module npu_circ_buf_small(
	 input CLK,  // Global 100 Mhz clock
    input npu_rst,  // npu level active high synchronous reset. global reset || npu config change
	 input npu_circ_buf_read_en,  // Active high, read enable for this circular buffer. Cannot be high when write enable is also high.
    input npu_circ_buf_write_en,  // Active high, write enable for this circular buffer. Cannot be high when read enable is also high.
    input [15:0] npu_circ_buf_data_input,  // Input data from the Config FIFO writing interface
    output [15:0] npu_circ_buf_data_output  // Output of this circular buffer
    );

wire npu_cbuf_wre;
wire [15:0]npu_write_data;
reg npu_circ_buf_read_en_delayed;

npu_circ_buf_fifo_small npu_circ_buf_fifo (
  .clk(CLK), // input clk
  .rst(npu_rst), // input rst
  .din(npu_write_data), // input [15 : 0] din
  .wr_en(npu_cbuf_wre), // input wr_en
  .rd_en(npu_circ_buf_read_en), // input rd_en
  .dout(npu_circ_buf_data_output), // output [15 : 0] dout
  // full and empty signals not connected. The violations of full and empty should never occur for these buffers.
  .full(), // output full     
  .empty(), // output empty
  .data_count() // output [9 : 0] data_count
);

assign npu_write_data = (npu_circ_buf_write_en) ? npu_circ_buf_data_input : npu_circ_buf_data_output;
assign npu_cbuf_wre = (npu_circ_buf_write_en) ? npu_circ_buf_write_en : npu_circ_buf_read_en_delayed;

always @(posedge CLK) begin
	npu_circ_buf_read_en_delayed <= npu_circ_buf_read_en;
end

endmodule
