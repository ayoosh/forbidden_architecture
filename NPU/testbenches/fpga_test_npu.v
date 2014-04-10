//`timescale 1ns / 10ps

module fpga_test_top_level(
	input CLK,
	input RST,
	output reg [7:0]LEDs_8Bit
	);
	
	reg [31:0] npu_input_data;
	reg npu_input_fifo_write_enable;
	wire [31:0] npu_config_data;
	reg npu_config_fifo_write_enable;
	reg npu_output_fifo_read_enable;
	reg [10:0] addr;
	reg led_flag;

	wire [31:0] npu_output_data;
	wire npu_output_fifo_empty;
	wire npu_input_fifo_full;
	wire npu_config_fifo_full;


	npu uut (
		.CLK(CLK), 
		.RST(RST), 
		.npu_input_data(npu_input_data), 
		.npu_input_fifo_write_enable(npu_input_fifo_write_enable), 
		.npu_config_data(npu_config_data[25:0]), 
		.npu_config_fifo_write_enable(npu_config_fifo_write_enable), 
		.npu_output_fifo_read_enable(npu_output_fifo_read_enable), 
		.npu_output_data(npu_output_data), 
		.npu_output_fifo_empty(npu_output_fifo_empty), 
		.npu_input_fifo_full(npu_input_fifo_full), 
		.npu_config_fifo_full(npu_config_fifo_full)
	);

testbench_rom testy_rom (
  .clka(CLK), // input clka
  .addra(addr), // input [9 : 0] addra
  .douta(npu_config_data) // output [31 : 0] douta
);

always@(posedge CLK)begin
	if(RST)begin
		npu_output_fifo_read_enable <= 0;
		addr <= 0;
		npu_input_data <= 0;
		npu_input_data <= 0;
		npu_input_fifo_write_enable <= 0;
		npu_config_fifo_write_enable <= 0;
		npu_output_fifo_read_enable <= 0;
		LEDs_8Bit <= 8'b00001111;
		led_flag <= 0;
	end
	else begin
		// Update this number based on testy block rom's number of values
		if (addr == 312) begin
			npu_config_fifo_write_enable <= 0;
			case (npu_input_data)
				0: begin
						npu_input_fifo_write_enable <= 1;
						npu_input_data <= 1;
					end
				1: npu_input_data <= 4;
				4: npu_input_data <= 2;
				2: npu_input_data <= 3;
				3: npu_input_fifo_write_enable <= 0;
				default: npu_input_data <= 0;
			endcase
		end else begin
			addr <= addr + 1;
		end
	end
end
endmodule
