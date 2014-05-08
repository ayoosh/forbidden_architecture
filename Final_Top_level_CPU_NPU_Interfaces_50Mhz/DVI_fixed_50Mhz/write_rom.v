`timescale 1ns/1ps

module write_rom (
input clk, rst, 
// Arbiter interface
input [255:0]  data_rd,
input mem_ready_data,
output [255:0] data_wr,
output  [27:0] mem_data_addr,
output  mem_rw_data,
output reg mem_valid_data,
output reg ram_wr_done,
// Output to FIFO
output reg [63:0] data_out,
output reg [15:0] rom_addr_wr,
output  WEN
);


assign data_wr = 256'd0;  // Will never write always read
assign mem_rw_data = 0;  // Will never issue write command


// Max is 307200 [ 640*480/8 ]
reg [18:0] addr_count;
reg [3:0] write_counter;
// count 8 times
reg write_enabled;
reg write_finish;
reg wait_for_read;
wire [255:0] temp_data;
reg WEN_I;

// WEN is asynchronous
assign WEN =  WEN_I;
assign temp_data = data_rd;
assign mem_data_addr = {9'b0,addr_count[18:0]};

// Addr Counter always block
always @(posedge clk)
	begin
	if(rst)
		begin
		mem_valid_data <= 0;  
		addr_count <= 0;
		write_enabled <= 0;
		wait_for_read <= 0;
		WEN_I <= 0;
		ram_wr_done <= 0;
		rom_addr_wr <= 0;
		end
		
	  else if(~wait_for_read)
	//else	if(write_finish & ~wait_for_read)  // Issue new read command
		begin
		mem_valid_data <= 1;
		wait_for_read <= 1;
		end
		
	else if(wait_for_read & mem_ready_data) // received data
		begin
		mem_valid_data <= 0;
		write_enabled <= 1;
	
		data_out <= {temp_data[231:224],temp_data[199:192],temp_data[167:160],temp_data[135:128],
		             temp_data[103:96],temp_data[71:64],temp_data[39:32],temp_data[7:0]};	
		WEN_I <= 1;
		
		end
	
	else if(write_enabled)
		begin
		
		 addr_count <= addr_count + 8;
		 rom_addr_wr <=  rom_addr_wr + 1;
		 
			if( addr_count == 19'd307192 )
				begin
				wait_for_read <= 1; // Stop permanently
				ram_wr_done <= 1;
				end	
			else			
		   wait_for_read <= 0;  // Send command immediately
			
		write_enabled <= 0;		// Since write is done now, enable can go low
		WEN_I <= 0;
		data_out <= 256'd0;
		end
	
	end


endmodule
