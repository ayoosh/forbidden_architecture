`timescale 1ns/100ps

module top_level();

reg clk, reset;
wire [31:0]input_data, config_data, output_data;

wire input_fifo_write_enable, config_fifo_write_enable, output_fifo_read_enable;
wire output_fifo_empty, input_fifo_full, config_fifo_full, output_ready;
wire [15:0]ram_address;
wire [63:0]ram_data; 
 
 
 
initial begin
	clk = 1;
	reset=1;	
	#60 reset=0;
end

always
	#5 clk = ~clk ;
	
//initial
//	#175000 $stop;

input_handling in(
	//inputs
	.clk(clk),
	.reset(reset),
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
    .CLK(clk),
    .RST(reset),
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
	
output_handling oh(
	//input
	.clk(clk),
	.reset(reset),
	.output_fifo_empty(output_fifo_empty),
	.output_data(output_data),     //31..0
	.ram_address(ram_address),      //15  ..0   
	
	//output
	.output_fifo_read_enable(output_fifo_read_enable),
	.ram_data(ram_data),   //63..0
	.output_ready(output_ready)
	);
	
	
endmodule 
	
	
	
	
	









