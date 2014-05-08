`timescale	1ns/1ps

//`include	"../src/cache_memory.v"

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

	
	output		[31:0]	cache_rd,
	output				cache_ready,
	output		[27:0]	mem_addr,
	output		[255:0]	mem_wr,
	output				mem_rw,
	output				mem_valid_out,
	
	output      [10:0] flush_count,
	// IO Ports
	
	input		[31:0]	IO_rd,
	input 				IO_ready,
	
	output		[27:0]	IO_addr,
	output		[31:0]	IO_wr,
	output				IO_rw,
	output				IO_valid
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
	localparam	IDLE		= 3'b000;
	localparam	COMPARE_TAG	= 3'b001;
	localparam	WRITE_BACK	= 3'b010;
	localparam	ALLOCATE	= 3'b011;
	localparam  ALLOCATE_IDLE = 3'b100;
	//----------------------------------------------------------------------------------
	localparam	DATA_BLOCKS	= BLOCK_SIZE / DATA_WIDTH;
	localparam	NUM_BLOCKS	= (CACHE_SIZE * 8) / (BLOCK_SIZE * NUM_WAYS);

	//---------------------------------------------------------------------------------
	reg		[31:0]				cache_rd_reg;
	reg							cache_ready_reg;
	
	wire							flush_flag; 
	reg		[10:0]				count;
	wire						tag_matched, cache_flushed;
	wire	[DATA_WIDTH-1:0]	data;
	wire	[BLOCK_SIZE-1:0]	write_block_data[NUM_WAYS-1:0];
	//---------------------------------------------------------------------------------
	reg		[2:0]				State, NextState;
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
	
	wire	[BLOCK_SIZE-1:0]	read_block_data;
	wire	[DATA_WIDTH-1:0]	mux_read_block_data [DATA_BLOCKS-1:0];
	wire	[9:0]				counter;
	wire	[14:0]				addr_tag;
	wire	[9:0]				addr_index;
	wire	[2:0]				addr_offset;
	wire	[14:0]				replace_tag [NUM_WAYS-1:0];
	wire	[28:0]				cache_addr_with_flush;
	wire	[NUM_WAYS-1:0]		valid_cache_mem;
	// ---- FLUSH -----
	wire 	[NUM_WAYS-1:0]		valid_bit_flush;
	//---------------------------------------------------------------------------------
	
	wire flush_int;
	
	assign flush_count = count;

	// FORMAT cache_addr = [Tag[27:13] | Index[12:3] | Block Offset[2:0]]
	assign addr_tag						= cache_addr[27:13];
	assign addr_index					= cache_addr[12:3];
	assign addr_offset					= cache_addr[2:0];
	
	// FIX: Passing addr_index for flush condition into cache_memory.v
	assign cache_addr_with_flush		= flush_flag ? {15'b0,counter,3'b0} : cache_addr;
	
	assign flush_int = (  ((mem_ready & dirty_read[convert(lru)]) & valid_cache_mem[convert(lru)]) | (~dirty_read[convert(lru)] & valid_cache_mem[convert(lru)]) | ~valid_cache_mem[convert(lru)]);
	

	
	
		// Preventing valid to go to high when address is 8000000
	wire int_cache_valid;
   
	assign int_cache_valid = cache_addr[27] ? 0	: cache_valid;
	
		assign flush_flag = int_cache_valid & flush;
	
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
				.replace_tag(replace_tag[i]),
				.valid(valid_cache_mem[i]),
				
				// Inputs
				.addr(cache_addr_with_flush),
				.data_write(data_write[i]),
				.dirty_write(dirty_write[i]),
				.write_en(write_en[i]),
				.clk(clk),
				.rst_n(rst_n),
				.valid_bit_flush(valid_bit_flush[i])
			);

			for (j = 0; j < DATA_BLOCKS; j = j + 1) begin : gen_demux_data
				assign write_block_data[i][(j*DATA_WIDTH)+:DATA_WIDTH] = (addr_offset == j) ? cache_wr : data_read[i][(j*DATA_WIDTH)+:DATA_WIDTH];
			end
			
			assign write_en[i] = (tag_matched & cache_rw & way[i]) | ((State == ALLOCATE) & mem_ready & lru[i]);
			assign data_write[i] = (State == ALLOCATE) ? mem_rd : write_block_data[i];
			assign dirty_write[i] = tag_matched & cache_rw;
			assign valid_bit_flush[i] = flush_flag ? ~lru[i] : 1'b1;
		end
		
		for (i = 0; i < DATA_BLOCKS; i = i + 1) begin : gen_mux_data
			assign mux_read_block_data[i] = read_block_data[(i*DATA_WIDTH)+:DATA_WIDTH];
		end
	endgenerate

	assign data		= mux_read_block_data[addr_offset];		//GLOBAL
	assign dirty	= &dirty_read;							//GLOBAL
	assign hit		= |way;									//GLOBAL	

	
	always @ (State, int_cache_valid, flush, hit, dirty_read, lru, mem_ready, flush_flag, count) begin
		case (State)
			IDLE: begin
					NextState = flush ? WRITE_BACK : COMPARE_TAG;
			end
			COMPARE_TAG: begin
				if (hit)											// HIT - if match and valid
					NextState = IDLE;
				else if (!hit & (dirty_read[convert(lru)] & valid_cache_mem[convert(lru)]) )
					NextState = WRITE_BACK;
				else
					NextState = ALLOCATE;
			end
			ALLOCATE: begin
				NextState = mem_ready ? ALLOCATE_IDLE : ALLOCATE;
			end
			
			
			ALLOCATE_IDLE: begin
				NextState = COMPARE_TAG;
			end
			
			
			WRITE_BACK: begin
				if (mem_ready | flush_int) begin  // flush_int for flush case
					 if (flush_flag)
					//	NextState = ((count[9:0] == 10'd1023)) ? IDLE : WRITE_BACK;
					  NextState =  IDLE;
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
		//	flush_flag	<= 1'b0;
			lru			<= 2'b10;
		end
		else begin
			State <= int_cache_valid ? NextState : IDLE;
			//flush_flag <= cache_valid & (State == IDLE) & flush;
		//	flush_flag <= cache_valid & flush;
			lru <= ( (count[9:0] == 10'd1023) && flush_int && (State == WRITE_BACK) ) ? ~lru : tag_matched ? way[0] ? 2'b10 : 2'b01 : lru;  // LRU must be exclusive. LRU = 1 means least recently used meaning Replace it!
		end
	end		

	always @ (posedge clk, negedge rst_n) begin
		if (!rst_n)
			count <= 11'h0;
		else begin
			if ((State == WRITE_BACK) && ((mem_ready & dirty_read[convert(lru)]) & valid_cache_mem[convert(lru)] | (~dirty_read[convert(lru)] & valid_cache_mem[convert(lru)]) | ~valid_cache_mem[convert(lru)])) begin // Changed
			//if ((State == WRITE_BACK) && ((mem_ready & dirty_read[convert(lru)]) | ~dirty_read[convert(lru)])) begin
			//if ((State == WRITE_BACK) && mem_ready) begin
				if (flush_flag)
					count <= count + 11'h1;
				else
					count <= 11'h0;
			end
			else
				count <= count;
		end
	end
	
	assign counter = flush_flag ? count[9:0] : addr_index;
	
	always @ (rst_n, tag_matched, cache_rw, data, cache_flushed) begin
		if (!rst_n) begin
			cache_rd_reg	= 32'h0000_0000;
			cache_ready_reg	= 1'b0;
		end
		else begin
				if (tag_matched && !cache_rw)
					cache_rd_reg = data;
				else
					cache_rd_reg	= 32'h0000_0000;
				cache_ready_reg	= (tag_matched | cache_flushed);
		end
	end
	
	// Debug: Inverting convert lru
	assign mem_wr = (State == WRITE_BACK) ? data_read[convert(lru)] : 256'h0;
	assign mem_addr = (State == WRITE_BACK) ? {replace_tag[convert(lru)], counter, 3'b0} : (State == ALLOCATE) ? {addr_tag, addr_index, 3'b0} : 28'h0;
	assign mem_rw =  ( flush_flag && (State == WRITE_BACK) ) ? (dirty_read[convert(lru)] & valid_cache_mem[convert(lru)]) : (State == WRITE_BACK); // Changed
	assign mem_valid_out = ( flush_flag && (State == WRITE_BACK) ) ? (dirty_read[convert(lru)] & valid_cache_mem[convert(lru)]): (State == ALLOCATE) | (State == WRITE_BACK);
	
	assign tag_matched = (State == COMPARE_TAG) & hit;
	//assign cache_flushed = (State == WRITE_BACK) & mem_ready & flush_flag & (count[9:0] == 1023);
	//assign cache_flushed = (State == WRITE_BACK) & mem_ready & flush_flag & (count == 2047);
	assign cache_flushed = (State == WRITE_BACK) & flush_flag & ( (count == 11'd2047) & flush_int );

	assign read_block_data = hit ? data_read[convert(way)] : 256'h0;

	assign cache_rd 	= cache_addr[27] ? IO_rd		: cache_rd_reg;
	assign cache_ready	= cache_addr[27] ? IO_ready		: cache_ready_reg;

	assign IO_addr 		= cache_addr[27] ? cache_addr	: 0;
	assign IO_wr 		= cache_addr[27] ? cache_wr		: 0;
	assign IO_rw 		= cache_addr[27] ? cache_rw		: 0;
	assign IO_valid		= cache_addr[27] ? cache_valid 	: 0;
	
endmodule


// 4/30 : Anded dirty_read with valid_bit_flush
