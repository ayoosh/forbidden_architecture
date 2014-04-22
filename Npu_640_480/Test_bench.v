



reg clk, reset;
reg [18:0]addr_output_side;
wire [18:0]next_addr ;
wire [31:0]input_data, config_data, output_data ;

reg [18:0]addr_output_side;
reg 


wire input_fifo_write_enable, config_fifo_write_enable, output_fifo_read_enable, output_fifo_empty, input_fifo_full, config_fifo_full;
wire output_rom_write_enable;

assign next_addr = (addr_output_side % 638) ? (addr_output_side + 1'b1) : (addr_output_side + 3 );	
assign output_fifo_read_enable = ~output_fifo_empty ;


module npu(
	//inputs
    .CLK(),
    .RST(),
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
	
	
always@(posedge clk) begin
	if(reset) begin
		output_rom_write_enable <=0 ;
	end
	else if(~output_fifo_empty) begin
		output_rom_write_enable <= 1'b1 ;
	end
	else begin
		output_rom_write_enable <=0 ;
	end
end

always@(posedge clk) begin
	if(reset) begin
		addr_output_side <= 0;
	end
	else if(output_rom_write_enable) begin
		addr_output_side <= next_addr;
	end
	else begin
		addr_output_side <= addr_output_side ;	
	end
end








