`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Wisconsin-Madison
// Engineer: Rohit Shukla
// 
// Create Date:    21:56:45 01/28/2014 
// Design Name: Receiver module for SPART
// Module Name:    receiver 
// Project Name: SPART
// Target Devices: Virtex-5 (Digilent opensparc board)
// Tool versions: Xilinx ISE
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module receiver(
	input 		 RX,
	output  [7:0] DATABUS,
	output reg 	 RDA,
	input 		 brg_en,
	input 		 clk,
	input 		 rst,
	input 		 clr_rda		 
    );

	// Counter increments from 0 to 9. After its value becomes 9, this means
        // we have received all the serial data from computer. Now reset 
	// it to 0. 
	reg [3:0] counter, counter_next, sample_count, sample_count_next, sample_accum, sample_accum_next;
	// A one bit state to keep in track whether we have started receiving
	// the serial data. 
	reg state;
	reg [1:0] next_state;
	// Store the one bit input data in the register first.
	reg received_input_bit;
	reg rxd_sync_clk;
	reg RDA_next;
	// Sore the received bits in the ReceivedData register.
	// When all of the input serial data has been received
	// send it to the processor through DATABUS.
	reg [7:0] ReceivedData, ReceivedData_next;
    
	assign DATABUS = ReceivedData;

   ////////////
   // STATES //
   ////////////
   localparam  NOT_RECEIVING_DATA  = 0,    
               RECEIVE_DATA        = 1;
               
   //////////////////////
   // INPUT BITS STATE //
   //////////////////////
   localparam	START_BIT                 = 0,    
		COMPLETED_RECEIVING_DATA  = 9;
  
   always @(posedge clk) begin
		if(rst == 1'b1) begin
			ReceivedData <= 8'h0;
			state <= NOT_RECEIVING_DATA;
			counter <= 4'h0;
			sample_count <= 4'h0;
			sample_accum <= 4'h0;
			RDA <= 1'b0;
			
			received_input_bit <= 1'b1;
			rxd_sync_clk <= 1'b1;
		end
		else begin
			ReceivedData <= ReceivedData_next;
			state <= next_state;
			counter <= counter_next;
			sample_count <= sample_count_next;
			sample_accum <= sample_accum_next;
			RDA <= RDA_next;

			//synchronize the RX line with CLK
			received_input_bit <= RX;
			rxd_sync_clk <= received_input_bit;

		end
	end

	always @ (*) begin
	
		sample_accum_next = sample_accum;
		ReceivedData_next = ReceivedData;
		counter_next = counter;
		RDA_next = RDA;
		sample_count_next = sample_count;

		case (state) 
		NOT_RECEIVING_DATA: begin
							next_state = NOT_RECEIVING_DATA;
							if (clr_rda)
								RDA_next = 1'b0;
							if (brg_en) begin
								
								//Sample the bit. Search for START_BIT
								if (sample_count == 4'h0) begin
									if (rxd_sync_clk == 1'b0) begin
										// Finding the START_BIT. Start incrementing the accumulator.
										sample_count_next = 4'h1;
										next_state = NOT_RECEIVING_DATA;
										sample_accum_next = 4'h0;
									end
									else begin
										sample_count_next = 4'h0;
										next_state = NOT_RECEIVING_DATA;
										sample_accum_next = 4'h0;
									end
								end
								
								// Sampled 16 times. Pick the correct bit.
								else if (sample_count == 4'hF) begin
									
									sample_accum_next = 4'h0;
									sample_count_next = 4'h0;

									if (sample_accum[3] == 1'b0) begin
										//start bit found, begin receiving other bits
										next_state= RECEIVE_DATA;
										ReceivedData_next = 8'h00;
										counter_next = 4'h0;
									end
									else 
										next_state = NOT_RECEIVING_DATA;
								end

								// Continue sampling 16 times.
								else begin
									// Keep count of the number of samples per brg_full signal
									sample_count_next = sample_count + 1;
									// Add the RX and keep accumulating.
									sample_accum_next = sample_accum + rxd_sync_clk;
									next_state = NOT_RECEIVING_DATA;
								end
							end
						end
						
	RECEIVE_DATA: begin
			RDA_next = 1'b0; //byte not ready 

			if (brg_en) begin
				// Add all the received bits and pick the MSB as the denoted RX bit. 
				sample_accum_next = sample_accum + rxd_sync_clk;						
				sample_count_next = sample_count + 1;
			end

			if(brg_en && sample_count == 4'hF) begin
				
				ReceivedData_next = {sample_accum[3],ReceivedData[7:1]};
				sample_accum_next = 4'h0;
				counter_next = counter + 1;
			end

			if (counter == 4'd8)begin
				//have all of our bits for this transmission
				next_state = NOT_RECEIVING_DATA;
				RDA_next = 1'b1;
				sample_accum_next = 4'h0;
				sample_count_next = 4'h0;
			end
			else begin
				//keep sampling and shifting bits in
				next_state = RECEIVE_DATA;
			end

		end//RECIEVING
		endcase
	end
	
endmodule
