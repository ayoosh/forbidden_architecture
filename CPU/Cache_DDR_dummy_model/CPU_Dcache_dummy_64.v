`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:32 03/26/2014 
// Design Name: 
// Module Name:    write_data_mem 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CPU_Dcache_dummy #(
      parameter CYCLE_DELAY = 10
		)
(
		input clk,
		input rst,
		
	output  	   [31:0] mem_data_wr1,
								// Input data from cache
								
	input   [31:0] mem_data_rd1,
								// Output the data to cache
								
   output        [27:0]  mem_data_addr1,
								// DDR2 address from cache to read/write the data from/to
								
	output reg               mem_rw_data1,
	                     // To indicate read/write command from cache
								
	output reg               mem_valid_data1,
	                     // To indicate from cache if command is valid
								
	input 				  mem_ready_data1,
	
	output   reg			error
                        // To indicate to cache that response is ready	
    );

	reg [31:0] temp_mem [0:63];
	reg [27:0] temp_mem_addr [0:63];
	reg [31:0] cycle_count;
   reg  enable_cycle;	
	reg [5:0] rom_addr;
	reg [5:0] mem_ready_count;
	assign mem_data_wr1 = temp_mem[rom_addr];
   assign mem_data_addr1 = temp_mem_addr[rom_addr];
	
	
	
	//assign error = (mem_ready_data1 & mem_valid_data1 & ~mem_rw_data1) ? ( (mem_data_rd1 == temp_mem[rom_addr]) ? 0 : 1) : 1'b0;
	
	always @(posedge clk)
	begin
	if(rst)
	error <= 0;
	else
		begin
		if((mem_ready_data1 & mem_valid_data1 & ~mem_rw_data1) & (mem_data_rd1 != temp_mem[rom_addr]))
		error <= 1;
	//	else if(mem_ready_data1)
	//	error <= 0;
		end
	end
	
	integer i;
	reg update_write;
	
	always @(posedge clk)
	begin
		if(rst)
		begin
			rom_addr <= 6'd0;
			temp_mem[0] <= 32'h010000FF;   // Start Address, that's where its written
			temp_mem[1] <= 32'h000AAAAA;
			temp_mem[2] <= 32'h010BBBBB;  // Display on
			temp_mem[3] <= 32'h12345678;
			temp_mem[4] <= 32'h88887777;  // Display on
			temp_mem[5] <= 32'h01112222;  // Writing wrong address
			temp_mem[6] <= 32'h22223333;   // Display on
			temp_mem[7] <= 32'h55556666;
			temp_mem[8] <= 32'h77778888;  // Display on
			temp_mem[9] <= 32'h010AB0FF;   // Start Address, that's where its written
			temp_mem[10] <= 32'h111AAAAA;
			temp_mem[11] <= 32'h010CCCCC;  // Display on
			temp_mem[12] <= 32'h1DEDEDED;
			temp_mem[13] <= 32'h00001234;  // Display on
			temp_mem[14] <= 32'h34563456;  // Writing wrong address
			temp_mem[15] <= 32'h34569876;   // Display on			
			
			temp_mem[16] <= 32'h011000FF;   // Start Address, that's where its written
			temp_mem[17] <= 32'h001AAAAA;
			temp_mem[18] <= 32'h011BBBBB;  // Display on
			temp_mem[19] <= 32'h12145678;
			temp_mem[20] <= 32'h88187777;  // Display on
			temp_mem[21] <= 32'h01112222;  // Writing wrong address
			temp_mem[22] <= 32'h22123333;   // Display on
			temp_mem[23] <= 32'h55156666;
			temp_mem[24] <= 32'h77178888;  // Display on
			temp_mem[25] <= 32'h011AB0FF;   // Start Address, that's where its written
			temp_mem[26] <= 32'h111AAAAA;
			temp_mem[27] <= 32'h011CCCCC;  // Display on
			temp_mem[28] <= 32'h1D1DEDED;
			temp_mem[29] <= 32'h00101234;  // Display on
			temp_mem[30] <= 32'h34163456;  // Writing wrong address
			temp_mem[31] <= 32'h34169876;   // Display on	

			temp_mem[32] <= 32'h110000FF;   // Start Address, that's where its written
			temp_mem[33] <= 32'h100AAAAA;
			temp_mem[34] <= 32'h110BBBBB;  // Display on
			temp_mem[35] <= 32'h22345678;
			temp_mem[36] <= 32'h18887777;  // Display on
			temp_mem[37] <= 32'h11112222;  // Writing wrong address
			temp_mem[38] <= 32'h12223333;   // Display on
			temp_mem[39] <= 32'h15556666;
			temp_mem[40] <= 32'h17778888;  // Display on
			temp_mem[41] <= 32'h110AB0FF;   // Start Address, that's where its written
			temp_mem[42] <= 32'h211AAAAA;
			temp_mem[43] <= 32'h110CCCCC;  // Display on
			temp_mem[44] <= 32'h2DEDEDED;
			temp_mem[45] <= 32'h10001234;  // Display on
			temp_mem[46] <= 32'h14563456;  // Writing wrong address
			temp_mem[47] <= 32'h14569876;   // Display on			
			
			temp_mem[48] <= 32'h010400FF;   // Start Address, that's where its written
			temp_mem[49] <= 32'h0004AAAA;
			temp_mem[50] <= 32'h0104BBBB;  // Display on
			temp_mem[51] <= 32'h12355678;
			temp_mem[52] <= 32'h88847777;  // Display on
			temp_mem[53] <= 32'h01142222;  // Writing wrong address
			temp_mem[54] <= 32'h22243333;   // Display on
			temp_mem[55] <= 32'h55546666;
			temp_mem[56] <= 32'h77748888;  // Display on
			temp_mem[57] <= 32'h0104B0FF;   // Start Address, that's where its written
			temp_mem[58] <= 32'h1114AAAA;
			temp_mem[59] <= 32'h0104CCCC;  // Display on
			temp_mem[60] <= 32'h1DE4EDED;
			temp_mem[61] <= 32'h00041234;  // Display on
			temp_mem[62] <= 32'h34543456;  // Writing wrong address
			temp_mem[63] <= 32'h34549876;   // Display on				
			
			
			temp_mem_addr[0] <= 28'h000_0008;
			temp_mem_addr[1] <= 28'h100_0008; // Same index, different tag write then read
			temp_mem_addr[2] <= 28'h100_0009;
			temp_mem_addr[3] <= 28'h100_000B;
			temp_mem_addr[4] <= 28'h100_000F;
			temp_mem_addr[5] <= 28'h000_000C; 
			temp_mem_addr[6] <= 28'h000_000D;
			temp_mem_addr[7] <= 28'h200_0030;  // Same index, different tag write then read
			temp_mem_addr[8] <= 28'h230_0030;
			temp_mem_addr[9] <= 28'h000_0009;  // Generate Error
			temp_mem_addr[10] <= 28'h120_0008; // Same index, different tag write then read
			temp_mem_addr[11] <= 28'h120_0009;
			temp_mem_addr[12] <= 28'h130_000B;
			temp_mem_addr[13] <= 28'h130_000F;
			temp_mem_addr[14] <= 28'h210_0031; 
			temp_mem_addr[15] <= 28'h240_0032;
	

			temp_mem_addr[16] <= 28'h000_0108;
			temp_mem_addr[17] <= 28'h100_0108; // Same index, different tag write then read
			temp_mem_addr[18] <= 28'h100_0109;
			temp_mem_addr[19] <= 28'h100_010B;
			temp_mem_addr[20] <= 28'h100_010F;
			temp_mem_addr[21] <= 28'h000_010C; 
			temp_mem_addr[22] <= 28'h000_010D;
			temp_mem_addr[23] <= 28'h200_0130;  // Same index, different tag write then read
			temp_mem_addr[24] <= 28'h230_0130;
			temp_mem_addr[25] <= 28'h000_0109;  // Generate Error
			temp_mem_addr[26] <= 28'h120_0108; // Same index, different tag write then read
			temp_mem_addr[27] <= 28'h120_0109;
			temp_mem_addr[28] <= 28'h130_010B;
			temp_mem_addr[29] <= 28'h130_010F;
			temp_mem_addr[30] <= 28'h210_0131; 
			temp_mem_addr[31] <= 28'h240_0132;
	
			temp_mem_addr[32] <= 28'h000_1008;
			temp_mem_addr[33] <= 28'h100_1008; // Same index, different tag write then read
			temp_mem_addr[34] <= 28'h100_1009;
			temp_mem_addr[35] <= 28'h100_100B;
			temp_mem_addr[36] <= 28'h100_100F;
			temp_mem_addr[37] <= 28'h000_100C; 
			temp_mem_addr[38] <= 28'h000_100D;
			temp_mem_addr[39] <= 28'h200_1030;  // Same index, different tag write then read
			temp_mem_addr[40] <= 28'h230_1030;
			temp_mem_addr[41] <= 28'h000_1009;  // Generate Error
			temp_mem_addr[42] <= 28'h120_1008; // Same index, different tag write then read
			temp_mem_addr[43] <= 28'h120_1009;
			temp_mem_addr[44] <= 28'h130_100B;
			temp_mem_addr[45] <= 28'h130_100F;
			temp_mem_addr[46] <= 28'h210_1031; 
			temp_mem_addr[47] <= 28'h240_1032;
	

			temp_mem_addr[48] <= 28'h001_1108;
			temp_mem_addr[49] <= 28'h101_1108; // Same index, different tag write then read
			temp_mem_addr[50] <= 28'h101_1109;
			temp_mem_addr[51] <= 28'h101_110B;
			temp_mem_addr[52] <= 28'h101_110F;
			temp_mem_addr[53] <= 28'h001_110C; 
			temp_mem_addr[54] <= 28'h001_110D;
			temp_mem_addr[55] <= 28'h201_1130;  // Same index, different tag write then read
			temp_mem_addr[56] <= 28'h231_1130;
			temp_mem_addr[57] <= 28'h001_1109;  // Generate Error
			temp_mem_addr[58] <= 28'h121_1108; // Same index, different tag write then read
			temp_mem_addr[59] <= 28'h121_1109;
			temp_mem_addr[60] <= 28'h131_110B;
			temp_mem_addr[61] <= 28'h131_110F;
			temp_mem_addr[62] <= 28'h211_1131; 
			temp_mem_addr[63] <= 28'h241_1132;

			mem_rw_data1 <= 1;
			mem_valid_data1 <= 1;   // Starting with write command
			cycle_count <= 32'd0;
			enable_cycle <= 0;
			update_write <= 0;
		end
		else
		begin
			if(rom_addr == 6'd63 && (mem_ready_data1 | enable_cycle) )
				begin
				
				if(cycle_count == CYCLE_DELAY)
					begin


					if(mem_ready_count == 1 & ~update_write)  // Last Command was read, so now write
						begin
						//mem_rw_data1 <= 1;
						//rom_addr <= 6'd0;
						update_write <= 1;
						// Update with new data
				    	for(i = 0; i <64; i = i + 1)
						temp_mem[i] <= temp_mem[i] + 32'd2;
						
						end
						
					else if(mem_ready_count == 1 & update_write)
						begin
						mem_valid_data1 <= 1;
					   cycle_count <= 32'd0;
					   enable_cycle <= 0;
						
						mem_rw_data1 <= 1;
						rom_addr <= 6'd0;
						update_write <= 0; // Setting it back
						end
											
						
					else if(mem_ready_count == 2)
						begin
						mem_valid_data1 <= 1;
					   cycle_count <= 32'd0;
					   enable_cycle <= 0;
						
						mem_rw_data1 <= 0;
						rom_addr <= 6'd0;
						end
					end
					
					else
					begin
					mem_valid_data1 <= 0;
					mem_rw_data1 <= 0;
					enable_cycle <= 1;
					cycle_count <= cycle_count + 1;
					end
				
				end
				
			else if(mem_ready_data1 | enable_cycle )
				begin

				if(cycle_count == CYCLE_DELAY)
					begin
					mem_valid_data1 <= 1;
					cycle_count <= 32'd0;
					enable_cycle <= 0;
					if(mem_ready_count == 2)  // Write and then read
						begin
						mem_rw_data1 <= 1;
						rom_addr <= rom_addr+1;
						end
					else if(mem_ready_count == 1)
						begin
						rom_addr <= rom_addr+1;
						mem_rw_data1 <= 0;
						end
					end
					
					else
					begin
					mem_valid_data1 <= 0;
					mem_rw_data1 <= 0;
					enable_cycle <= 1;
					cycle_count <= cycle_count + 1;
					end				
				
				end
					
			else
			   begin
				rom_addr <= rom_addr;
				// Start with first write
				end
		end
	end
	
	
		always @(posedge clk)
	begin
   if(rst)
	mem_ready_count <= 0;
	else if(mem_rw_data1 & mem_valid_data1) // For write increment by 2
	mem_ready_count <= 2;   // Write
	else if(~mem_rw_data1 & mem_valid_data1)
	mem_ready_count <= 1;  // Read
	
	end
	
	
	
endmodule