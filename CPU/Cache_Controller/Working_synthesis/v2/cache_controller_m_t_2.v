`timescale 1ns/1ps

module cache_controller_t;
	reg					clk;
	reg					rst_n;
	reg		[27:0]		cache_addr;
	reg		[31:0]		cache_wr;
	reg					cache_rw;
	reg					cache_valid;
	reg					flush;
	reg		[255:0]		mem_rd;
	reg			 		mem_ready;

	reg		[31:0] 		ram	[0:4];
	reg		[11*8:0]	StateName;

	integer				ram_ptr, i;

	wire	[31:0]		cache_rd;
	wire				cache_ready;
	wire	[27:0]		mem_addr;
	wire	[255:0]		mem_wr;
	wire				mem_rw;
	wire				mem_valid;

	initial begin
		clk = 0;
		ram_ptr = 0;
		i=0;
		flush = 0;
		rst_n = 0;
		$monitor ("StateName : %s", StateName);
		for (i=0; i<5; i=i+1)
			ram[i] = 0;
	end

	cache_controller dut (
		.clk 			(clk),
		.rst_n 			(rst_n),
		.cache_addr		(cache_addr),
		.cache_wr		(cache_wr),
		.cache_rw		(cache_rw),
		.cache_valid	(cache_valid),
		.flush			(flush),
		.mem_rd			(mem_rd),
		.mem_ready		(mem_ready),

		.cache_rd		(cache_rd),
		.cache_ready	(cache_ready),
		.mem_addr		(mem_addr),
		.mem_wr			(mem_wr),
		.mem_rw			(mem_rw),
		.mem_valid_out	(mem_valid)
	);
	
	initial begin
		cache_addr = 1'b0;
		cache_wr = 32'h0000_0000;
		cache_rw = 1'b0;
		cache_valid = 1'b0;
		
		mem_ready = 1'b0;
		
		#20
		rst_n = 1;
		#5
		
		for (i = 0; i < 1024; i = i + 1) begin
			dut.gen_way[0].memory.memory[i] = 273'h0;
			dut.gen_way[1].memory.memory[i] = 273'h0;
		end
		#10

/*	
		// Make WRITE condition TRUE
		cache_valid = 1'b1;
		cache_rw = 1'b1;

		cache_addr = 28'd0;
		cache_wr = 32'hABCD_1234;
		ram[ram_ptr] = cache_wr;
		ram_ptr = ram_ptr + 1;

		#10
		cache_addr = 28'd8;
		cache_wr = 32'h1234_5678;
		ram[ram_ptr] = cache_wr;
		ram_ptr = ram_ptr + 1;

		#10
		cache_addr = 28'd16;
		cache_wr = 32'h5678_8765;
		ram[ram_ptr] = cache_wr;
		ram_ptr = ram_ptr + 1;

		#10
		cache_addr = 28'd24;
		cache_wr = 32'h8765_4321;
		ram[ram_ptr] = cache_wr;
		ram_ptr = ram_ptr + 1;

		#10
		cache_addr = 28'd32;
		cache_wr = 32'h4321_DCBA;
		ram[ram_ptr] = cache_wr;
		ram_ptr = ram_ptr + 1;
		
		#10
		cache_valid = 1'b0;

		#50
		// Make READ condition TRUE
		cache_valid = 1'b1;
		cache_rw = 1'b0;
		ram_ptr = 0;
		cache_addr = 28'd0;
		
		#10
		$display ("Data 1: %h", cache_rd);
		if (cache_rd == ram[ram_ptr])
			$display ("Data 1 is correct");
		else
			$display ("Data 1 is wrong. Expected value is ram: %h", ram[ram_ptr]);
		ram_ptr = ram_ptr + 1;

		cache_addr = 28'd8;
		#10
		$display ("Data 1: %h", cache_rd);
		if (cache_rd == ram[ram_ptr])
			$display ("Data 1 is correct");
		else
			$display ("Data 1 is wrong. Expected value is ram: %h", ram[ram_ptr]);
		ram_ptr = ram_ptr + 1;

		cache_addr = 28'd16;
		#10
		$display ("Data 1: %h", cache_rd);
		if (cache_rd == ram[ram_ptr])
			$display ("Data 1 is correct");
		else
			$display ("Data 1 is wrong. Expected value is ram: %h", ram[ram_ptr]);
		ram_ptr = ram_ptr + 1;

		cache_addr = 28'd24;
		#10
		$display ("Data 1: %h", cache_rd);
		if (cache_rd == ram[ram_ptr])
			$display ("Data 1 is correct");
		else
			$display ("Data 1 is wrong. Expected value is ram: %h", ram[ram_ptr]);
		ram_ptr = ram_ptr + 1;

		cache_addr = 28'd32;
		#10
		$display ("Data 1: %h", cache_rd);
		if (cache_rd == ram[ram_ptr])
			$display ("Data 1 is correct");
		else
			$display ("Data 1 is wrong. Expected value is ram: %h", ram[ram_ptr]);
		ram_ptr = ram_ptr + 1;
		/*
		#10
		$stop();
	end

*/
	
	/*
	/* Test for Memory */
	#10
	#10
	// 1st
	@ (posedge clk) begin
	cache_valid = 1'b1;
	cache_rw = 1'b0;
	cache_addr = 28'd0;
	end
	
	@ (posedge clk)
	@ (posedge clk) begin
	mem_ready = 1'b1;
	mem_rd = 256'h0A0A_0B0B__ABCD_EF12__6666_5555__BDC1_4444__1234_5678__ADAD_BABA__5885_0990__3FBA_BAF1; 
	end
	
	
	@ (posedge clk)
	mem_ready = 1'b0;
	
	
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'd1;
	
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'd2;
	
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'd3;

	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'd4;

	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'd5;

	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'd6;
	
	@ (posedge cache_ready) 
	@ (posedge clk)
	cache_addr = 28'd7;


// Test for WRITE

#100

@ (posedge clk) begin
	cache_valid = 1'b1;
	cache_rw = 1'b1;
	cache_addr = 28'd0;
	end
	
	@ (posedge cache_ready)
	@ (posedge clk) begin
	mem_ready = 1'b1;
	end

	
	/*
	// 2nd
	@ (posedge cache_ready) 
	@ (posedge clk) begin
	//mem_ready = 1'b0;
	cache_addr = 28'd8;
	end
	
	@ (posedge clk)
	@ (posedge clk) begin
	mem_ready = 1'b1;
	mem_rd = 256'hABCD_EF12;
	end
	
	// 3rd
	@ (posedge cache_ready) 	
	@ (posedge clk) begin
	mem_ready = 1'b0;
	cache_addr = 28'd16;
	end
	
	@ (posedge clk)
	@ (posedge clk) begin
	mem_ready = 1'b1;
	mem_rd = 256'hA1B2_C3D4;
	end
	
	// 4th
	@ (posedge cache_ready) 	
	@ (posedge clk) begin
	mem_ready = 1'b0;
	cache_addr = 28'd24;
	end
	
	@ (posedge clk)
	@ (posedge clk) begin
	mem_ready = 1'b1;
	mem_rd = 256'hDFDF_ABAB;
	end
	
	// 5th
	@ (posedge cache_ready) 	
	@ (posedge clk) begin
	mem_ready = 1'b0;
	cache_addr = 28'd32;
	end
	
	@ (posedge clk)
	@ (posedge clk) begin
	mem_ready = 1'b1;
	mem_rd = 256'h0A0A_0B0B;
	end
	*/
	
	
	#5000
		$stop();
end

/*

#500
always @ (posedge clk) begin
cache_valid = 1'b1;
cache_rw = 1'b0;
cache_addr


*/
	always @ (dut.State) begin
		case (dut.State)
			2'b00: StateName = "IDLE";
			2'b01: StateName = "COMPARE_TAG";
			2'b10: StateName = "WRITE_BACK";
			2'b11: StateName = "ALLOCATE";
			default:StateName = "??";
		endcase
	end


	always begin
		#5 clk = ~clk;
	end
endmodule
