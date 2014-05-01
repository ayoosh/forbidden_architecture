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

reg [9:0]config_addr;
reg [8:0]row_index;
reg [9:0]column_index ;
reg [3:0]count;	
reg [18:0]addr;
wire [18:0]input_rom_address, rom_addr;
wire [18:0]present_address;
wire [63:0]image_data;
wire [31:0]input_fifo;
wire [9:0]next_config_addr;
wire [8:0]next_row;
wire [9:0]next_column;
reg input_state, config_state, fifo_enable, latched_input;

assign next_column = (column_index == 10'd638) ? (1'b1) : (column_index+1'b1);
assign next_row = ( row_index == 478 && column_index == 638) ? (1'b1) : ((column_index == 638) ?(row_index + 1): row_index);
assign input_fifo_write_enable =  ~input_fifo_full && latched_input /*&& fifo_enable*/;
assign config_fifo_write_enable = ~reset && config_state;
assign next_config_addr = config_addr + 1;
assign present_address = (row_index * 640) + column_index ;
assign rom_addr = (input_fifo_full) ? addr[18:3] : input_rom_address[18:3] ;

assign input_rom_address = (count == 0) ? (present_address - 641 ) :
									(count == 1) ? (present_address - 1 ) :
									(count == 2) ? (present_address + 639 ) :
									(count == 3) ? (present_address - 640 ) :
									(count == 4) ? (present_address) :
									(count == 5) ? (present_address + 640 ) :
									(count == 6) ? (present_address - 639) :
									(count == 7) ? (present_address + 1 ) :
									(present_address + 641);

assign input_fifo_data = ((addr[2:0] == 0) ? {{24{1'b0}},image_data[7:0]}:
						((addr[2:0] == 1) ? {{24{1'b0}},image_data[15:8]}:
						((addr[2:0] == 2) ? {{24{1'b0}},image_data[23:16]}:
						((addr[2:0] == 3) ? {{24{1'b0}},image_data[31:24]}:
						((addr[2:0] == 4) ? {{24{1'b0}},image_data[39:32]}:
						((addr[2:0] == 5) ? {{24{1'b0}},image_data[47:40]}:
						((addr[2:0] == 6) ? {{24{1'b0}},image_data[55:48]}:
						(({{24{1'b0}},image_data[63:56]})))))))));

Config_fifo configu (
	.clka(clk),
	.addra(config_addr), // Bus [9 : 0] 
	.douta(config_fifo_data)); // Bus [31 : 0] 

rom64x38400 rom(
  .clka(clk), // input clka
  .addra(rom_addr), // input [15 : 0] addra
  .douta(image_data) // output [63 : 0] douta
);
		 
always@(posedge clk)begin
	if(reset)begin
		row_index <= 241 ;
		column_index <= 1 ;
		count <= 0 ;
		addr <= 0 ;
		config_addr <= 0 ;
		config_state <= 1 ;
		input_state <= 0;
		//fifo_enable <= 0;
	end
	else if(config_state) begin
		latched_input <= input_state;
		if(config_addr == 501) begin
			input_state <= 1;
			config_state <= 0;
		end
		else begin
			config_addr <= next_config_addr ;
			
		end
	end	
	else if(input_state) begin
		latched_input <= input_state;
		//fifo_enable <= ~input_fifo_full;
		if(~input_fifo_full ) begin
			addr <= input_rom_address;
			if(count == 8) begin
				count <= 0;
				column_index <= next_column;
				row_index <= next_row;
			end
			else begin
				count <= count + 1  ;
			end
		end
		else begin
	 // Nothing happens here
		end	
	end
end

endmodule
	
