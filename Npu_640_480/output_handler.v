module output_handling(
	input clk,
	input reset,
	input output_fifo_empty,
	input [31:0]output_data,
	input [15:0]ram_address,
	output output_fifo_read_enable,
	output [63:0]ram_data, 
	output reg output_ready
	);
				
reg [63:0]ram_data_in;
wire [18:0]next_addr;
wire [63:0]ram_input_data;
reg output_ram_write_enable;
reg [18:0]addr_output_side; //16 bits for ram and 3 bits for lower handling

assign output_fifo_read_enable = ~output_fifo_empty ;
assign address = output_ready ? ram_address : addr_output_side[18:3] ;
assign next_addr = (addr_output_side % 638) ? (addr_output_side + 1) : (addr_output_side + 3) ;

assign ram_input_data = (addr_output_side[2:0] == 0)? {ram_data_in[63:8],output_data[7:0]}:
								(addr_output_side[2:0] == 1)? {ram_data_in[63:16],output_data[7:0],ram_data_in[7:0]}:
								(addr_output_side[2:0] == 2)? {ram_data_in[63:24],output_data[7:0],ram_data_in[15:0]}:
								(addr_output_side[2:0] == 3)? {ram_data_in[63:32],output_data[7:0],ram_data_in[23:0]}:
								(addr_output_side[2:0] == 4)? {ram_data_in[63:40],output_data[7:0],ram_data_in[31:0]}:
								(addr_output_side[2:0] == 5)? {ram_data_in[63:48],output_data[7:0],ram_data_in[39:0]}:
								(addr_output_side[2:0] == 6)? {ram_data_in[63:56],output_data[7:0],ram_data_in[47:0]}:
								{output_data[7:0],ram_data_in[55:0]} ;

always @(posedge clk) begin
	if(reset) begin
		output_ram_write_enable <=0 ;
	end
	else if(~(output_fifo_empty || output_ready)) begin
		output_ram_write_enable <= 1 ;
	end
	else begin
		output_ram_write_enable <=0 ;
	end
end

always@(posedge clk)begin
	if(reset) begin
		addr_output_side <= 641;
		ram_data_in <= 64'h0;
	end
	else if(output_ram_write_enable) begin
		addr_output_side <= next_addr;	
		ram_data_in <=ram_input_data ;
	end
	else begin
	// nothing to do here
	end
end

always@(posedge clk) begin
	if(reset) begin
			output_ready <=0;
	end
	else if(addr_output_side == 38398 || output_ready) begin
			output_ready <= 1;
	end
end
	
output_ram YourInstanceName (
	.clka(clk),
	.ena(1'b1),
	.wea(output_ram_write_enable), // Bus [0 : 0] 
	.addra(address), // Bus [15 : 0] 
	.dina(ram_input_data), // Bus [63 : 0] 
	.douta(ram_data)
);
	
endmodule	