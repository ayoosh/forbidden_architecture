module input_handling(
	input clk,
	input reset,
	input config_fifo_full,
	input input_fifo_full,
	output [31:0]input_fifo_data,
	output [31:0]config_fifo_data,
	output config_fifo_write_enable,
	output input_fifo_write_enable
);

reg [9:0]row_index;
reg [8:0]column_index ;
reg [3:0]count;	
reg [18:0]addr;
wire [18:0]input_rom_address;
wire [18:0]present_address;
wire [63:0]image_data;
wire [31:0]input_fifo;

assign next_column = ( column_index == 638) ? (1'b1) : (column_index + 1);
assign next_row = ( row_index == 479 && column_index == 638) ? (1'b0) : (column_address == 638) ?(row_index + 1): row_index;

assign present_address = (row_index * 640) + column_index ;
assign input_rom_address = (count == 0) ? (present_address - 641 ) :
									(count == 1) ? (present_address - 1 ) :
									(count == 2) ? (present_address + 639 ) :
									(count == 3) ? (present_address - 640 ) :
									(count == 4) ? (present_address) :
									(count == 5) ? (present_address + 640 ) :
									(count == 6) ? (present_address - 639) :
									(count == 7) ? (present_address + 1 ) :
									(present_address + 641);

assign input_fifo = ((addr[2:0] == 0) ? {{24{1'b0}},image_data[7:0]}:
						((addr[2:0] == 1) ? {{24{1'b0}},image_data[15:8]}:
						((addr[2:0] == 2) ? {{24{1'b0}},image_data[23:16]}:
						((addr[2:0] == 3) ? {{24{1'b0}},image_data[31:24]}:
						((addr[2:0] == 4) ? {{24{1'b0}},image_data[39:32]}:
						((addr[2:0] == 5) ? {{24{1'b0}},image_data[47:40]}:
						((addr[2:0] == 6) ? {{24{1'b0}},image_data[55:48]}:
						(({{24{1'b0}},image_data[63:56]})))))))));

rom64x38400 rom(
  .clka(clk), // input clka
  .addra(input_rom_address[18:3]), // input [15 : 0] addra
  .douta(image_data) // output [63 : 0] douta
);
		 
always@(posedge clk)begin
	if(reset)begin
		row_index <= 1 ;
		column_index <= 1 ;
		count <= 0;
	end
	else if(~input_fifo_full) begin
		addr <= input_rom_address;
		if(count == 8) begin
			count <= 0;
			coulmn_index <= next_column;
			row_index <= next_row;
		end
		else begin
			count <= count + 1 ;
		end
	end
	else begin
	 // Nothing happens here
	end	
end
	
always@(posedge clk) begin
	if(reset) begin
	 input_fifo_data <= 0;
	 input_fifo_write_enable <= 1'b1;
	end
	else if(~input_fifo_full) begin
		input_fifo_data <= input_fifo;
		input_fifo_write_enable <= 1'b1;
	end
	else begin
		input_fifo_write_enable <= 1'b0;
	end
end
endmodule	