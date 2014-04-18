`timescale 1ns/1ps

module cache_controller #(
	parameter	NUM_WAYS	= 2,
	parameter	ADDR_WIDTH	= 28,
	parameter	DATA_WIDTH	= 32,
	parameter	BLOCK_SIZE	= 256,
	parameter	CACHE_SIZE	= 65536
)
(
	input				clk,
	input				rst_n,
	input		[27:0]	cache_addr,
	input		[31:0]	cache_wr,
	input				cache_rw,
	input				cache_valid,
	input				flush,
	input		[255:0]	mem_rd,
	input				mem_ready,

	output	reg	[31:0]	cache_rd,
	output	reg			cache_ready,
	output		[27:0]	mem_addr,
	output		[255:0]	mem_wr,
	output				mem_rw,
	output				mem_valid_out
);

	function integer log2(input integer value);
		begin
			value = value - 1;
			for (log2 = 0; value > 0; log2 = log2 + 1) begin
				value = value >> 1;
			end
		end
	endfunction // :)

	function integer convert (input [NUM_WAYS-1:0] grey_num);
		integer i;	//, sum;
		
		begin	
			//sum = 0;
			convert = 0;
			for (i = 0; i < NUM_WAYS; i = i + 1) begin
				//sum = sum + grey_num[i];
				//if (sum > 1) $display("<%m> ERROR: %b is not grey code", grey_num);
				if (grey_num[i]) convert = i;
			end
		end
	endfunction

	//---------------------------------------------------------------------------------
	localparam	IDLE		= 2'b00;
	localparam	COMPARE_TAG	= 2'b01;
	localparam	WRITE_BACK	= 2'b10;
	localparam	ALLOCATE	= 2'b11;
	//----------------------------------------------------------------------------------
	localparam	DATA_BLOCKS	= BLOCK_SIZE / DATA_WIDTH;
	localparam	NUM_BLOCKS	= (CACHE_SIZE * 8) / (BLOCK_SIZE * NUM_WAYS);

	//---------------------------------------------------------------------------------
	reg							flush_flag; 
	reg		[9:0]				count;
	wire						tag_matched, cache_flushed;
	reg		[31:0]				data;
	reg		[255:0]				write_block_data[NUM_WAYS-1:0];
	//---------------------------------------------------------------------------------
	reg		[1:0]				State, NextState;
	//---------------------------------------------------------------------------------

	//---------------------------------------------------------------------------------
	wire						hit;
	wire						dirty;
	wire	[NUM_WAYS-1:0]		way;
	wire	[BLOCK_SIZE-1:0]	data_read[NUM_WAYS-1:0];
	wire	[NUM_WAYS-1:0]		dirty_read;
	wire	[BLOCK_SIZE-1:0]	data_write[NUM_WAYS-1:0];
	wire	[NUM_WAYS-1:0]		dirty_write;
	wire	[NUM_WAYS-1:0]		write_en;
	reg		[NUM_WAYS-1:0]		lru;
	
	wire	[255:0]				read_block_data;
	wire	[9:0]				counter;
	wire	[14:0]				addr_tag;
	wire	[9:0]				addr_index;
	wire	[2:0]				addr_offset;
	//---------------------------------------------------------------------------------

	// FORMAT cache_addr = [Tag[27:13] | Index[12:3] | Block Offset[2:0]]
	assign addr_tag		= cache_addr[27:13];
	assign addr_index	= cache_addr[12:3];
	assign addr_offset	= cache_addr[2:0];

	// cache memory = [Data[273:18] | LRU[17] | V[16] | D[15] | TAG[14:0]]
	genvar i, j;

	generate
		for (i = 0; i < NUM_WAYS; i = i + 1) begin : gen_way
			cache_memory #(
				.ADDR_WIDTH(ADDR_WIDTH),
				.DATA_WIDTH(DATA_WIDTH),
				.BLOCK_SIZE(BLOCK_SIZE),
				.CACHE_SIZE(CACHE_SIZE/NUM_WAYS)
			)
			memory (
				// Outputs
				.data_read(data_read[i]),
				.dirty_read(dirty_read[i]),
				.hit(way[i]),
				
				// Inputs
				.addr(cache_addr),
				.data_write(data_write[i]),
				.dirty_write(dirty_write[i]),
				.write_en(write_en[i]),
				.clk(clk),
				.rst_n(rst_n)
			);

			always @ (data_read[i], cache_wr, addr_offset) begin
				case (addr_offset)
					3'b000: write_block_data[i] <= {data_read[i][255:32], cache_wr};
					3'b001: write_block_data[i] <= {data_read[i][255:64], cache_wr, data_read[i][31:0]};
					3'b010: write_block_data[i] <= {data_read[i][255:96], cache_wr, data_read[i][63:0]};
					3'b011: write_block_data[i] <= {data_read[i][255:128], cache_wr, data_read[i][95:0]};
					3'b100: write_block_data[i] <= {data_read[i][255:160], cache_wr, data_read[i][127:0]};
					3'b101: write_block_data[i] <= {data_read[i][255:192], cache_wr, data_read[i][159:0]};
					3'b110: write_block_data[i] <= {data_read[i][255:224], cache_wr, data_read[i][191:0]};
					3'b111: write_block_data[i] <= {cache_wr, data_read[i][223:0]};
				endcase
			end
			
			assign write_en[i] = (tag_matched & cache_rw & way[i]) | ((State == ALLOCATE) & mem_ready & lru[i]);
			assign data_write[i] = (State == ALLOCATE) ? mem_rd : write_block_data[i];
			assign dirty_write[i] = tag_matched & cache_rw;
		end
	endgenerate

	assign dirty	= &dirty_read;		//GLOBAL
	assign hit		= |way;				//GLOBAL
	
	always @ (read_block_data, addr_offset) begin
		case (addr_offset)
			3'b000: data = read_block_data[31:0];
			3'b001: data = read_block_data[63:32];
			3'b010: data = read_block_data[95:64];
			3'b011: data = read_block_data[127:96];
			3'b100: data = read_block_data[159:128];
			3'b101: data = read_block_data[191:160];
			3'b110: data = read_block_data[223:192];
			3'b111: data = read_block_data[255:224];
		endcase
	end
	
	always @ (State, cache_valid, flush, hit, dirty, mem_ready, flush_flag, count) begin
		case (State)
			IDLE: begin
					NextState = flush ? WRITE_BACK : COMPARE_TAG;
			end
			COMPARE_TAG: begin
				if (hit)											// HIT - if match and valid
					NextState = IDLE;
				else if (!hit & dirty)
					NextState = WRITE_BACK;
				else
					NextState = ALLOCATE;
			end
			ALLOCATE: begin
				NextState = mem_ready ? COMPARE_TAG : ALLOCATE;
			end
			WRITE_BACK: begin
				if (mem_ready) begin
					if (flush_flag)
						NextState = (count == 1023) ? IDLE : WRITE_BACK;
					else
						NextState = ALLOCATE;
				end
				else
					NextState = WRITE_BACK;
			end
		endcase
	end

	always @ (posedge clk, negedge rst_n) begin
		if (!rst_n) begin
			State		<= IDLE;
			flush_flag	<= 1'b0;
			lru			<= 2'b10;
		end
		else begin
			State <= cache_valid ? NextState : IDLE;
			flush_flag <= cache_valid & (State == IDLE) & flush;
			lru <= tag_matched ? way[0] ? 2'b10 : 2'b01 : lru;  // LRU must be exclusive. LRU = 1 means least recently used meaning Replace it!
		end
	end		

	always @ (posedge clk, negedge rst_n) begin
		if (!rst_n)
			count <= 10'h0;
		else begin
			if ((State == WRITE_BACK) && mem_ready) begin
				if (flush_flag)
					count <= count + 10'h1;
				else
					count <= 10'h0;
			end
			else
				count <= count;
		end
	end
	
	assign counter = flush_flag ? count : addr_index;
	
	always @ (posedge clk, negedge rst_n) begin
		if (!rst_n) begin
			cache_rd	<= 32'h0000_0000;
			cache_ready	<= 1'b0;
		end
		else begin
			if (tag_matched && !cache_rw)
				cache_rd <= data;
			else
				cache_rd <= 32'h0000_0000;
			cache_ready <= (tag_matched | cache_flushed);
		end
	end
	
	assign mem_wr = (State == WRITE_BACK) ? data_read[convert(lru)] : 256'h0;
	assign mem_addr = (State == WRITE_BACK) ? {addr_tag, counter, 3'b0} : (State == ALLOCATE) ? {addr_tag, addr_index, 3'b0} : 28'h0;
	assign mem_rw = (State == WRITE_BACK);
	assign mem_valid_out = (State == ALLOCATE) | (State == WRITE_BACK);
	
	assign tag_matched = (State == COMPARE_TAG) & hit;
	assign cache_flushed = (State == WRITE_BACK) & mem_ready & flush_flag & (count == 1023);

	assign read_block_data = hit ? data_read[convert(lru)] : 256'h0;
endmodule
