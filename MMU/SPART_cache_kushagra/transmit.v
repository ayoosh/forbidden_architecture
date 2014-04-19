module transmit( 
clk,
rst,
brg_full,
//wr_en,
iorw, //constitutes wr_en
iocs, //constitutes wr_en
databus,
ioaddr,
tbr,
txd,
piso_out
);

//Input ports
input clk;
input rst;
input brg_full; 
input iorw;
input iocs;
input [1:0] ioaddr;
//input wr_en;  // Active high
input [7:0] databus;
output [8:0] piso_out;

// Output ports
output tbr;
output txd;

reg [8:0] piso; // parallel in serial out shifter
reg [3:0] count;
reg buffer_full;

assign tbr = ~buffer_full;
assign txd = piso[0];
assign cnt_flag = (count == 10);
assign piso_out = piso;
always @ (posedge clk)
begin
     if(rst) begin
	//	 count <= 0;
		 piso <= 9'h1FF;  // Should send out STOP bit
	//	 buffer_full <= 0;
     end

	// ioaddr wasn't even considered previously
	 else if (iocs & ~iorw & (ioaddr == 2'd0)) begin
		 piso <= {databus[7:0],1'b1};
	// buffer_full <= 1;
	 end

	
	//~rst removed. Redundant. If rst=1, it's taken care in the first block itself.
/*	if(count == 0 && buffer_full && brg_full) begin
		piso[0] <= 1'b0; // Start bit		
		count <= count + 1;		
	end 
*/
	else if (buffer_full && brg_full && ~cnt_flag ) begin
	if (count == 0)
		piso[0] <= 1'b0; // Start bit
	//	count <= count + 1; 
	else
		piso <= {1'b1, piso[8:1]}; // Shift
	end

	else if (cnt_flag & brg_full)  begin
	//	count <= 0;
		piso <= 9'h1FF;
	//	buffer_full <= 0;
	end
end

//Different block for buffer_full
always @ (posedge clk)
begin
if (rst)
	buffer_full <= 1'b0;
else if (cnt_flag & brg_full)
	buffer_full <= 1'b0;
else if (iocs & ~iorw & (ioaddr == 2'b0))
	buffer_full <= 1'b1;
end


// Different block for count
always @ (posedge clk)
begin
if (rst)
	count <= 0;
else if (cnt_flag & brg_full)
	count <= 0;
// else if (iocs & ~iorw & (count!=9))
else if (brg_full & buffer_full)
	count <= count + 1;
end
	
endmodule
