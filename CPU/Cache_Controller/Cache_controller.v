module cache_controller ();

// State Machine

	
	// cache_addr = [ Tag[27:13] | Index[12:3] | Block Offset[2:0] ]
	assign hit_1 = (cache_addr[27:13] == cache_mem_1[14:0]);
	assign hit_2 = (cache_addr[27:13] == cache_mem_2[14:0]);
	
	assign valid_1 = cache_mem_1[16];
	assign valid_2 = cache_mem_2[16];
	
	assign dirty_1 = cache_mem_1[15];
	assign dirty_2 = cache_mem_2[15]; 					//[ Data[273:18] | LRU[17] | V[16] | D[15] | TAG[14:0] ]
														// LRU in cache_mem_1 and cache_mem_2 must be exclusive. LRU = 1 means least recently used meaning Replace it!
	assign hit = ((hit_1 & valid_1) | (hit_2 & valid_2)); 	//GLOBAL
	assign dirty = dirty_1 & dirty_2;					//GLOBAL
	
	assign cache_intermediate_rd [255:0] = (hit_1 & valid_1) ? cache_mem_1[273:18] : ((hit_2 & valid_2) ? cache_mem_2[273:18] : 256'b0);

	assign counter = (flush_flag == 1) ? count : cache_addr[12:3];
	
	assign cache_ready = (cache_ready_COMPARE_TAG | cache_ready_WRITE_BACK);
	
	
	reg flush_flag; 
	reg count [9:0];
	reg cache_ready_COMPARE_TAG, cache_ready_WRITE_BACK;
	
	
always@(*) begin

	case (cache_addr[2:0]) begin
	
	3'b000: begin
			cache_intermediate_rd_32 [31:0] = cache_intermediate_rd[31:0];
			cache_intermediate_mem_256 [31:0] = cache_wr;
			end
			
	3'b001: begin
			cache_intermediate_rd_32 [31:0] = cache_intermediate_rd[63:32];
			cache_intermediate_mem_256 [63:32] = cache_wr;
			end
			
	3'b010: begin
			cache_intermediate_rd_32 [31:0] = cache_intermediate_rd[95:64];
			cache_intermediate_mem_256 [95:64] = cache_wr;
			end
			
	3'b011: begin
			cache_intermediate_rd_32 [31:0] = cache_intermediate_rd[127:96];
			cache_intermediate_mem_256 [127:96] = cache_wr;
			end
			
	3'b100: begin
			cache_intermediate_rd_32 [31:0] = cache_intermediate_rd[159:128];
			cache_intermediate_mem_256 [159:128] = cache_wr;
			end
			
	3'b101: begin
			cache_intermediate_rd_32 [31:0] = cache_intermediate_rd[191:160];
			cache_intermediate_mem_256 [191:160] = cache_wr;
			end
			
	3'b110: begin
			cache_intermediate_rd_32 [31:0] = cache_intermediate_rd[223:192];
			cache_intermediate_mem_256 [223:192] = cache_wr;
			end
			
	3'b111: begin
			cache_intermediate_rd_32 [31:0] = cache_intermediate_rd[255:224];
			cache_intermediate_mem_256 [255:224] = cache_wr;
			end
			
	
	endcase
end

always@(posedge clk) begin
	
State <= NextState;

end
	
always@ (*) begin
	case (State) begin
		
		IDLE: begin
		if (valid_CPU_request) begin
			if (flush) begin
				NextState = WRITE_BACK;
				flush_flag = 1'b1;
			end
			else begin
				NextState = COMPARE_TAG;
				flush_flag = 1'b0;
			end
		end
		else
			NextState = IDLE;
		end
		
		COMPARE_TAG: begin
		if (hit) begin 									// HIT - if match and valid
			NextState = IDLE;
			cache_ready_COMPARE_TAG = 1;
			if (cache_rw == 1'b0)
				cache_rd = cache_intermediate_rd_32;
			else begin
				if (hit_1 & valid_1) begin
					cache_mem_1[273:18] = cache_intermediate_mem_256;
					cache_mem_1[15] = 1'b1; // Set dirty_1
				end
				else begin
					cache_mem_2[273:18] = cache_intermediate_mem_256;
					cache_mem_2[15] = 1'b1; // Set dirty_2
				end
			end		
			
		end	
		else if (!hit & dirty) begin
			NextState = WRITE_BACK;
			cache_ready_COMPARE_TAG = 0;
			cache_rd = 32b'0;
		end
		else
			NextState = ALLOCATE;
			cache_ready_COMPARE_TAG = 0;
			cache_rd = 32'b0;
		end
		
		ALLOCATE: begin
			// Just bypass - READ
			mem_addr = {cache_addr[27:3], 3'b0};
			mem_rw = 1'b0; // READ flag  = 0
			mem_valid = 1;
			if (mem_ready) begin
				NextState = COMPARE_TAG;
				if (cache_mem_1[17] == 1) // LRU
					cache_mem_1[273:18] = mem_rd;
					cache_mem_1[16:15] = 2'b10; 					// Setting valid_1 = 1 and dirty_1 = 0
					cache_mem_1[14:0] = cache_addr[27:13];
				else begin
					cache_mem_2[273:18] = mem_rd;
					cache_mem_2[16:15] = 2'b10; 					// Setting valid_2 = 1 and dirty_2 = 0
					cache_mem_2[14:0] = cache_addr[27:13];
				end
			end
			else	
				NextState = ALLOCATE;
		end
		
		WRITE_BACK: begin
			mem_rw = 1'b1; // WRITE flag = 1
			mem_valid = 1'b1;
			
			if (mem_ready) begin
				if (flush_flag) begin
					count = count + 1;
					NextState = (count == 1023) ? IDLE : WRITE_BACK;
					cache_ready_WRITE_BACK = (count == 1023) ? 1'b1 : 1'b0;
				end
				else begin
					count = 10'b0;
					NextState = ALLOCATE;
					cache_ready_WRITE_BACK = 1'b0;
				end
			end
			else
				count = 10'b0;
				NextState = WRITE_BACK;
				cache_ready_WRITE_BACK = 1'b0;
				
						
			if (cache_mem_1[17] == 1) begin // LRU
				mem_addr = {cache_mem_1[14:0], counter, 3'b0};
				mem_wr = cache_mem_1[273:18];
			end
			else begin
				mem_addr = {cache_mem_2[14:0], counter, 3'b0};
				mem_wr = cache_mem_2[273:18];
			end
			
			
			
		end
	
	end