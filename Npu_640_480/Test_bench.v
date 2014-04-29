`timescale 1ns/100ps

module top_level();

reg clk_in, gl_rst;
wire [31:0]input_data, config_data, output_data;

wire input_fifo_write_enable, config_fifo_write_enable, output_fifo_read_enable;
wire output_fifo_empty, input_fifo_full, config_fifo_full, output_ready;
reg [15:0]ram_address;
wire [63:0]ram_data; 
  
initial begin
	clk_in = 1;
	gl_rst=1;	
	#60 gl_rst=0;
end

always
	#5 clk_in = ~clk_in ;
	
//initial
//	#175000 $stop;

input_handling in(
	//inputs
	.clk(clk_in),
	.reset(gl_rst),
	.config_fifo_full(config_fifo_full),
	.input_fifo_full(input_fifo_full),
	
	//outputs
	.input_fifo_data(input_data),
	.config_fifo_data(config_data),
	.config_fifo_write_enable(config_fifo_write_enable),
	.input_fifo_write_enable(input_fifo_write_enable)
	);


npu np(
	//inputs
    .CLK(clk_in),
    .RST(gl_rst),
    .npu_input_data(input_data),      //31..0
    .npu_input_fifo_write_enable(input_fifo_write_enable),
    .npu_config_data(config_data[25:0]),      //25..0
    .npu_config_fifo_write_enable(config_fifo_write_enable),
    .npu_output_fifo_read_enable(output_fifo_read_enable),
	
    //outputs
	.npu_output_data(output_data),   //31..0
    .npu_output_fifo_empty(output_fifo_empty),
    .npu_input_fifo_full(input_fifo_full),
    .npu_config_fifo_full(config_fifo_full)
    );

/*fifo_for_npu fiforefifo (
  .clk(clk_in), // input clk
  .rst(gl_rst), // input rst
  .din(input_data), // input [15 : 0] din
  .wr_en(input_fifo_write_enable), // input wr_en
  .rd_en(output_fifo_read_enable), // input rd_en
  .dout(output_data), // output [15 : 0] dout
  .full(input_fifo_full), // output full
  .empty(output_fifo_empty) // output empty
);*/

	
output_handling oh(
	//input
	.clk(clk_in),
	.reset(gl_rst),
	.output_fifo_empty(output_fifo_empty),
	.output_data(output_data),     //31..0
	.ram_address(ram_address),      //15  ..0   
	
	//output
	.output_fifo_read_enable(output_fifo_read_enable),
	.ram_data(ram_data),   //63..0
	.output_ready(output_ready)
	);
	

always@(posedge clk_in) begin
	if(gl_rst)  begin
		ram_address <=0;
	end
	else if(output_ready) begin
		ram_address <= ram_address + 1 ;
	end
end

endmodule 
	
	
	
	
	









