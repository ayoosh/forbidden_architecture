`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    driver 
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
module driver(
    input clk,
    input rst,
    input [1:0] br_cfg,
    output reg iocs,
    output reg iorw,
    input rda,
    input tbr,
    output reg [1:0] ioaddr,
    inout [7:0] databus,
	output reg [31:0] data_ioaddr,
	output reg data_wr_rdy,
	input [8:0] piso_out,
	input clk_200
    );

	parameter IDLE = 2'b00;
	parameter WRITE = 2'b01;
	parameter READ = 2'b10;
 
	parameter BRG_CGF_325 = 2'b00;
	parameter BRG_CGF_162 = 2'b01;
	parameter BRG_CGF_81 = 2'b10;
	parameter BRG_CGF_40 = 2'b11;
	
//	reg iocs, iorw;
//	reg [1:0] ioaddr;
//	reg [7:0] databus;
	reg [1:0] state;  // 0 implies idle, 1 implies write state
	reg [1:0] next_state;
	reg [1:0] ready_rw;
	reg [7:0] databus_drive;  // Data which will drive the bus

	reg [7:0] div_low;
	reg [7:0] div_high;
	
	
	reg [1:0] counter;
	reg [1:0] counter_wr;
	
	reg data_received;
	reg data_written;
	
	reg data_spart_rdy;
	reg data_spart_rdy_next = 1'b0;
	reg tbr_changed;
	
	wire [35:0] control;
	wire [7:0] trigger;
	wire [255:0] dataport;
	
// Read case, needs to be changed
assign databus =  (iorw == 0 & iocs == 1 ) ? databus_drive : 8'hzz;

always @ (posedge clk) begin
	if(rst)
	begin
		data_ioaddr <= 32'd0;
		data_wr_rdy <= 1'b0;
		counter <= 2'd0;
		data_received <= 1'b0;
	end
	else if (iorw == 1 && iocs == 1 && rda == 1)   // Read command
	begin
		data_wr_rdy <= 1'b0;
		case(counter)
		3'd0:	data_ioaddr[7:0] <= databus;
		3'd1:	data_ioaddr[15:8] <= databus;
		3'd2:	data_ioaddr[23:16] <= databus;
		3'd3:	begin
				data_ioaddr[31:24] <= databus;
				data_received <= 1'b1;
				data_wr_rdy <= 1'b1;
				end
		endcase
		counter <= counter +1'b1;
	end
	else
	begin
		if(data_written)
		begin
			data_received <= 1'b0;
		end
		else
		begin
			data_received <= data_received;
		end
		data_wr_rdy <= 1'b0;
	end
end


always @ (*) begin
	case (br_cfg) 
//	begin
	BRG_CGF_325:
	//if (br_cfg == 2'b00)
	begin	// Div - 325
	div_low <=  8'h16;
	div_high <= 8'h05;
	end
	
	BRG_CGF_162:
//	else if (br_cfg == 2'b01)
	begin	// Div - 162
	div_low <=  8'h8B;
	div_high <= 8'h02;
	end
	
	BRG_CGF_81:	
//	else if (br_cfg == 2'b10)
	begin	// Div - 81
	div_low <=  8'h46;
	div_high <= 8'h01;
	end
	
	BRG_CGF_40:
//	else if (br_cfg == 3)
	begin	// Div - 40
	div_low <=  8'hA3;
	div_high <= 8'h00;
	end
	
	//end
	endcase
end
		
	always @ (posedge clk)
	begin
	if(rst) begin
	state <= IDLE;
	
  end
	else
	state <= next_state;
	end
	
	
	always @(posedge clk)
	begin
	if(rst)
		data_spart_rdy <= 1'b0;
	else
		data_spart_rdy <= data_spart_rdy_next;
	end

	
	always @(state or tbr or rda or ready_rw or data_wr_rdy or data_received or data_spart_rdy or tbr_changed)
	begin
//	if(rst)
//		data_spart_rdy_next = 1'b0;
//	else
//	begin
	case(state)
	IDLE : begin 
				if ( (rda == 1) && (ready_rw == 2) && !data_received )
					next_state = READ;
				else if((tbr == 1) && (ready_rw == 2 ) && data_received && !data_spart_rdy)
				begin
					next_state = WRITE;
					data_spart_rdy_next = 1'b1;
				end
				else
					next_state = IDLE;
				if(tbr && tbr_changed)
				begin
					data_spart_rdy_next = 1'b0;
				end
				else if(tbr && !tbr_changed && !data_spart_rdy_next)
				begin
					data_spart_rdy_next = 1'b0;
				end
			end
			
	WRITE : next_state = IDLE;
	READ :  next_state = IDLE;
	default: next_state = IDLE;
	endcase
	//end
	end
	
	// Output logic
	
	always @ (posedge clk)
	begin
		if (rst) begin
		iocs <=0;
		iorw <= 1;
		ioaddr <= 2'b00;
		databus_drive <= 8'h00;
		ready_rw <= 2'b00;
		counter_wr <= 2'd0;
		tbr_changed <= 1'b0;
		data_written <= 1'b0;
		end

// Upon reset program div buf
		else if ( ready_rw == 0)
		begin
			ioaddr <= 2'b10; // Div buffer low
			iocs <= 1;
			iorw <= 0;
			databus_drive <= div_low; // condition based on input
			ready_rw <= ready_rw + 1;
		end

		else if ( ready_rw == 1)
		begin
			ioaddr <= 2'b11; // Div buffer low
			iocs <= 1;
			iorw <= 0;
			databus_drive <= div_high; // condition based on input
			ready_rw <= ready_rw + 1;
		end

		else if ( ready_rw == 2 )
		begin
			ioaddr <= 2'b00; // To prevent writing to div buffer again
			data_written <= 1'b0;
			case(state)
			IDLE :  begin
					iocs <=0;
					iorw <= 1;
					if(!tbr)
					begin
						tbr_changed <= 1'b1;
					end
					else if(tbr && tbr_changed)
					begin
						tbr_changed <= 1'b0;
					end
					end
			WRITE : begin
					iocs <= 1;
					iorw <= 0;
					case(counter_wr)
					2'd0: databus_drive <= data_ioaddr[7:0];  // Generate random value may be later
					2'd1: databus_drive <= data_ioaddr[15:8];
					2'd2: databus_drive <= data_ioaddr[23:16];
					2'd3: begin
							databus_drive <= data_ioaddr[31:24];
							data_written <= 1'b1;
						  end
					endcase
					counter_wr <= counter_wr + 1'b1;
					ioaddr <= 2'b00;
					end
			READ : begin
					iocs <= 1;
					iorw <= 1;
				    // Read data storage taken care later, since asynchronous
					ioaddr <= 2'b00;
					end
			default: begin
					iocs <= 0;
					iorw <= 1;
					end
			endcase
		end
	end
	/*
	icon icon_1(
		.CONTROL0(control)
	);
	
	ila ila_1(
		.CLK(clk),
		.CONTROL(control),
		.DATA(dataport),
		.TRIG0(trigger)
	);
	
	assign dataport[8:0] = piso_out;
	assign dataport[40:9] = data_ioaddr;
	assign dataport[41] = iocs;
	assign dataport[42] = iorw;
	assign dataport[44:43] = counter;
	assign dataport[46:45] = counter_wr;
	assign dataport[47] = tbr;
	assign dataport[48] = rda;
	//assign dataport[49] = clk;
	assign dataport[50] = data_received;
	assign dataport[51] = data_spart_rdy;
	assign dataport[53:52] = state;
	assign dataport[55:54] = ioaddr;
	assign dataport[56] = tbr_changed;
	
	assign trigger[0] = clk;
	assign trigger[1] = iocs;
	assign trigger[2] = iorw;
	assign trigger[3] = tbr;
	assign trigger[4] = rda;
	assign trigger[5] = data_received;
	assign trigger[6] = data_spart_rdy;
	assign trigger[7] = tbr_changed;
	*/
endmodule
