`timescale 1ns/1ps

module display (
input clk, rst, fifo_full, done,
// Arbiter interface
input [63:0]  data_rd,
output  [15:0] mem_data_addr,
output reg last_addr_update,
// Output to FIFO
output reg [23:0] data_out,
output  WEN
);


// Max is 38400 [ 640*480/8 ]
reg [15:0] addr_count;
reg [3:0] write_counter;
// count 8 times
reg write_enabled;
reg write_finish;
reg wait_for_read;
reg [63:0] temp_data;
reg WEN_I;

// WEN is asynchronous
assign WEN =  (WEN_I) & ~fifo_full;

assign mem_data_addr = addr_count;

// Addr Counter always block
always @(posedge clk)
	begin
	if(rst)
		begin
		last_addr_update <= 0;
		addr_count <= 0;
		temp_data <= 0;
		write_enabled <= 0;
		wait_for_read <= 0;
		end
		
	else if(write_finish & ~wait_for_read)  // Issue new read command
		begin
		wait_for_read <= 1;
		end
		
	else if(wait_for_read & ~write_enabled & write_finish) // received data
		begin
		write_enabled <= 1;
		temp_data <= data_rd;
			if( addr_count == 16'd38399 )
				begin
				last_addr_update <= 1;
				addr_count <= 16'd0;
				end
			else
				begin
				addr_count <= addr_count + 1;
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
			3'd1 :  data_out <= {temp_data[15:8], temp_data[15:8], temp_data[15:8]}; 
			3'd2 :  data_out <= {temp_data[23:16], temp_data[23:16], temp_data[23:16]}; 
			3'd3 :  data_out <= {temp_data[31:24], temp_data[31:24], temp_data[31:24]}; 
			3'd4 :  data_out <= {temp_data[39:32], temp_data[39:32], temp_data[39:32]}; 
			3'd5 :  data_out <= {temp_data[47:40], temp_data[47:40], temp_data[47:40]}; 
			3'd6 :  data_out <= {temp_data[55:48], temp_data[55:48], temp_data[55:48]}; 
			3'd7 :  data_out <= {temp_data[63:56], temp_data[63:56], temp_data[63:56]};  
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
			3'd1 :  data_out <= {temp_data[15:8], temp_data[15:8], temp_data[15:8]}; 
			3'd2 :  data_out <= {temp_data[23:16], temp_data[23:16], temp_data[23:16]}; 
			3'd3 :  data_out <= {temp_data[31:24], temp_data[31:24], temp_data[31:24]}; 
			3'd4 :  data_out <= {temp_data[39:32], temp_data[39:32], temp_data[39:32]}; 
			3'd5 :  data_out <= {temp_data[47:40], temp_data[47:40], temp_data[47:40]}; 
			3'd6 :  data_out <= {temp_data[55:48], temp_data[55:48], temp_data[55:48]}; 
			3'd7 :  data_out <= {temp_data[63:56], temp_data[63:56], temp_data[63:56]}; 
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
