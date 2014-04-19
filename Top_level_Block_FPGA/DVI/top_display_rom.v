`timescale 1ns/1ps

module display (
input clk, rst, fifo_full, done,
// Arbiter interface
input [255:0]  data_rd,
input mem_ready_data,
output [255:0] data_wr,
output  [27:0] mem_data_addr,
output  mem_rw_data,
output reg mem_valid_data,
output reg last_addr_update,
// Output to FIFO
output reg [23:0] data_out,
output  WEN
);


assign data_wr = 256'd0;  // Will never write always read
assign mem_rw_data = 0;  // Will never issue write command


// Max is 38400 [ 640*480/8 ]
reg [18:0] addr_count;
reg [3:0] write_counter;
// count 8 times
reg write_enabled;
reg write_finish;
reg wait_for_read;
reg [255:0] temp_data;
reg WEN_I;

// WEN is asynchronous
assign WEN =  (WEN_I) & ~fifo_full;

assign mem_data_addr = {9'b0,addr_count[18:0]};

// Addr Counter always block
always @(posedge clk)
	begin
	if(rst)
		begin
		mem_valid_data <= 0;  
		last_addr_update <= 0;
		addr_count <= 0;
		temp_data <= 0;
		write_enabled <= 0;
		wait_for_read <= 0;
		end
		
	else	if(write_finish & ~wait_for_read)  // Issue new read command
		begin
		mem_valid_data <= 1;
		wait_for_read <= 1;
		end
		
	else if(wait_for_read & mem_ready_data) // received data
		begin
		mem_valid_data <= 0;
		write_enabled <= 1;
		temp_data <= data_rd;
			if( addr_count == 19'd307192 )
				begin
				addr_count <= 19'd0;
				last_addr_update <= 1;
				end
			else
				begin
				addr_count <= addr_count + 8;
				last_addr_update <= 0;
				end
		end
	
	else if(~write_finish)
		begin
		wait_for_read <= 0;
		write_enabled <= 0; // Since write has started now, enable can go low
		end
	
	end
	
// Write to FIFO logic
always @(posedge clk)
	begin
	if(rst)
		begin
		write_finish <= 1;  // No pending write initially
		write_counter <= 0;
		WEN_I <= 0;
		data_out <= 24'd0;
		end
		
	else if(write_enabled & write_finish)  // 1 read received, need to send out
		begin
		write_finish <= 0;
		write_counter <= 0;
		WEN_I <= 0;
		//data_out <= 24'd0;
		end
	// After counter reach 7 write_finish will become 1 indicate writes are finished
	
	else if( ~write_finish &(write_counter < 8) & ~fifo_full)  // Fifo is not full
		begin
		// Send data 8 times
		if(write_counter == 7)
			begin
			case(write_counter)
			3'd0 :  data_out <= {temp_data[7:0], temp_data[7:0], temp_data[7:0]}; 
			3'd1 :  data_out <= {temp_data[39:32], temp_data[39:32], temp_data[39:32]}; 
			3'd2 :  data_out <= {temp_data[71:64], temp_data[71:64], temp_data[71:64]}; 
			3'd3 :  data_out <= {temp_data[103:96], temp_data[103:96], temp_data[103:96]}; 
			3'd4 :  data_out <= {temp_data[135:128], temp_data[135:128], temp_data[135:128]}; 
			3'd5 :  data_out <= {temp_data[167:160], temp_data[167:160], temp_data[167:160]}; 
			3'd6 :  data_out <= {temp_data[199:192], temp_data[199:192], temp_data[199:192]}; 
			3'd7 :  data_out <= {temp_data[231:224], temp_data[231:224], temp_data[231:224]}; 
			endcase
			write_counter <= write_counter + 1;
			WEN_I <= 1;
		   //write_finish <= 1;  		
			end
			
			else // Write counter is not 7
			begin
			WEN_I <= 1;
			
			case(write_counter)
			3'd0 :  data_out <= {temp_data[7:0], temp_data[7:0], temp_data[7:0]}; 
			3'd1 :  data_out <= {temp_data[39:32], temp_data[39:32], temp_data[39:32]}; 
			3'd2 :  data_out <= {temp_data[71:64], temp_data[71:64], temp_data[71:64]}; 
			3'd3 :  data_out <= {temp_data[103:96], temp_data[103:96], temp_data[103:96]}; 
			3'd4 :  data_out <= {temp_data[135:128], temp_data[135:128], temp_data[135:128]}; 
			3'd5 :  data_out <= {temp_data[167:160], temp_data[167:160], temp_data[167:160]}; 
			3'd6 :  data_out <= {temp_data[199:192], temp_data[199:192], temp_data[199:192]}; 
			3'd7 :  data_out <= {temp_data[231:224], temp_data[231:224], temp_data[231:224]}; 
			endcase
			write_counter <= write_counter + 1;
			
			end
		
		end
	
	   else if(~fifo_full)
			begin
			WEN_I <= 0;
			write_finish <= 1;
		//	data_out <= 24'd0;
			end
			
	
	end	// end of second always block

endmodule
