`timescale 1ns/1ps

module cache_memory #(
	parameter	ADDR_WIDTH	= 28,
	parameter	DATA_WIDTH	= 32,
	parameter	BLOCK_SIZE	= 256,
	parameter	CACHE_SIZE	= 65536
)
(
	// Outputs
	output		[BLOCK_SIZE-1:0]	data_read,
	output							dirty_read,
	output							hit,
	output		[14:0]				replace_tag,
	output							valid,
	
	// Inputs
	input		[ADDR_WIDTH-1:0]	addr,
	input		[BLOCK_SIZE-1:0]	data_write,
	input							dirty_write,
	input							write_en,
	input							clk,
	input							rst_n,
	input 							valid_bit_flush
	);

	function integer log2(input integer value);
		begin
			value = value - 1;
			for (log2 = 0; value > 0; log2 = log2 + 1) begin
				value = value >> 1;
			end
		end
	endfunction

	localparam	NUM_BLOCKS		= (CACHE_SIZE * 8) / BLOCK_SIZE;
	localparam	DATA_BLOCKS		= BLOCK_SIZE / DATA_WIDTH;
	localparam	OFFSET_WIDTH	= log2(DATA_BLOCKS);
	localparam	INDEX_WIDTH		= log2(NUM_BLOCKS);
	localparam	TAG_WIDTH		= ADDR_WIDTH - INDEX_WIDTH - OFFSET_WIDTH;
	localparam	MEMORY_SIZE		= BLOCK_SIZE + TAG_WIDTH + 1 + 1; // 1 for valid and 1 for dirty
	
	//(* RAM_STYLE="BLOCK" *)
	reg		[MEMORY_SIZE-1:0]	memory[NUM_BLOCKS-1:0];
	
	wire	[TAG_WIDTH-1:0]		addr_tag;
	wire	[INDEX_WIDTH-1:0]	addr_index;
	wire	[OFFSET_WIDTH-1:0]	addr_offset;
	
	reg		[BLOCK_SIZE-1:0]	data;
	reg	    [TAG_WIDTH-1:0]		tag;
	reg							dirty;
	reg		[NUM_BLOCKS-1:0]	valid_bit;
	
	//wire						valid;
	
	integer						i;
	
	assign addr_tag		= addr[ADDR_WIDTH-1:ADDR_WIDTH-TAG_WIDTH];
	assign replace_tag	= tag;
	assign addr_index	= addr[ADDR_WIDTH-TAG_WIDTH-1:ADDR_WIDTH-TAG_WIDTH-INDEX_WIDTH];
	assign addr_offset	= addr[OFFSET_WIDTH-1:0];
	
	assign data_read	= data;
	assign dirty_read	= dirty;
	assign valid		= valid_bit[addr_index];
	assign hit			= valid & (addr_tag == tag);
	
	//assign 	data		= memory[addr_index][MEMORY_SIZE-1:MEMORY_SIZE-BLOCK_SIZE];
	//assign 	tag			= memory[addr_index][MEMORY_SIZE-BLOCK_SIZE-1:2];
	//assign	dirty		= memory[addr_index][1]; 
	
	
	always @ (negedge clk) begin
	//always @ (posedge clk) begin // Changed to posedge from negedge - Problem write_en is high for just 1 cycle - NOT fixed
		if(!rst_n) begin
			//for (i = 0; i < NUM_BLOCKS; i = i + 1)
				//memory[i][0] <= 1'b0;		
			data		<= 0;
			tag			<= 0;
			dirty		<= 0;
			valid_bit	<= 0;
		end
		else begin
			data		<= memory[addr_index][MEMORY_SIZE-1:MEMORY_SIZE-BLOCK_SIZE];
			tag			<= memory[addr_index][MEMORY_SIZE-BLOCK_SIZE-1:2];
			dirty		<= memory[addr_index][1]; 
			if (write_en) begin
				memory[addr_index] <= {data_write, addr_tag, dirty_write, 1'b1}; // Since we don't care about the last bit anymore we needn't look at this
				//memory[addr_index][MEMORY_SIZE-1:1] <= {data_write, addr_tag, dirty_write};
				valid_bit[addr_index] <= 1'b1;
			end
			/*
			else if (!valid_bit_flush) begin
				//memory[addr_index][MEMORY_SIZE-1:1] <= memory[addr_index][MEMORY_SIZE-1:1];
				valid_bit[addr_index] <= valid_bit_flush;
			end
			*/
		end
	end
	
	
endmodule