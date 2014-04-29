/**********************************************************************************
	Triple ported register file.  Two read ports (oDataRead0 & oDataRead1), and
	one write port (iDataWrite).  Data is written on clock high, and
	read on clock low
***********************************************************************************/

// Include listing
`include	"../src/DualPortRAM.v"

// Register File module ports declaration
module RegisterFile #(
	// External parameters
	parameter	DATA_WIDTH	= 32,
	parameter	ADDR_WIDTH	= 5
)
(
	// Outputs
	output	[DATA_WIDTH-1:0]	oDataRead0,
	output	[DATA_WIDTH-1:0]	oDataRead1,  		//output read ports

	// Inputs
	input	[ADDR_WIDTH-1:0]	iAddrRead0, 
	input	[ADDR_WIDTH-1:0]	iAddrRead1,			// two read port addresses
	input						iEnRead0,
	input						iEnRead1,			// read enables (write not functionality)
	input	[ADDR_WIDTH-1:0]	iAddrWrite,			// write address
	input	[DATA_WIDTH-1:0]	iDataWrite,			// iDataWrite bus
	input						iEnWrite,			// write enable
													// test is halted.
	input						iClk,
	input						iClkX2,
	input						iRst_n
);

	// Internal parameters declaration
	localparam	READ			= 1'b0;
	localparam	WRITE			= 1'b1;

	// Internal variables declaration
	integer						i;

	// Internal signals declaration
	reg							rState;

	reg		[DATA_WIDTH-1:0]	rDataRead0;				// have to capture write data from previous cycle
	reg		[DATA_WIDTH-1:0]	rDataRead1;				// have to capture write data from previous cycle

	// Dual-Port Block RAM signals
	wire	[DATA_WIDTH-1:0]	memDataOutA;
	wire	[DATA_WIDTH-1:0]	memDataInA;
	wire	[ADDR_WIDTH-1:0]	memAddrA;
	wire						memEnA;
	wire						memWeA;
	wire	[DATA_WIDTH-1:0]	memDataOutB;
	wire	[DATA_WIDTH-1:0]	memDataInB;
	wire	[ADDR_WIDTH-1:0]	memAddrB;
	wire						memEnB;
	wire						memWeB;

	// External modules instantiation
	DualPortRAM #(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(ADDR_WIDTH)
	)
	mem (
		// Outputs
		.oDataA	(memDataOutA),
		.oDataB	(memDataOutB),

		// Inputs
		.iDataA	(memDataInA),
		.iAddrA	(memAddrA),
		.iEnA	(memEnA),
		.iWeA	(memWeA),
		.iClkA	(iClkX2),
		.iDataB	(memDataInB),
		.iAddrB	(memAddrB),
		.iEnB	(memEnB),
		.iWeB	(memWeB),
		.iClkB	(iClkX2),
		.iRst_n	(iRst_n)
	);

	// Internal signals assignment
	assign memAddrA		= (rState == READ) ? iAddrRead0 : iAddrWrite;
	assign oDataRead0	= (iAddrRead0 == 5'h00) ? 32'h0000_0000 : (rState == WRITE) ? memDataOutA : rDataRead0;
	assign memDataInA	= iDataWrite;
	assign memEnA		= (rState == READ) ? iEnRead0 : iEnWrite;
	assign memWeA		= ((rState == WRITE) && !(iAddrWrite == 5'h00)) ? iEnWrite : 1'b0;

	assign memAddrB		= iAddrRead1;
	assign oDataRead1	= (iAddrRead1 == 5'h00) ? 32'h0000_0000 : (rState == WRITE) ? memDataOutB : rDataRead1;
	assign memDataInB	= 32'h0;
	assign memEnB		= (rState == READ) ? iEnRead1 : 1'b0;
	assign memWeB		= 1'b0;

	// State change: posedge clk writes, negedge of clk reads
	always @ (posedge iClkX2) begin
		if (iClk)
			rState <= WRITE;	// RF is written on clock high
		else
			rState <= READ;		// RF is read on clock low
	end
	
	always @ (posedge iClkX2) begin
		if (!iRst_n) begin
			rDataRead0	<= 0;
			rDataRead1	<= 0;
		end
		else begin
			rDataRead0	<= memDataOutA;
			rDataRead1	<= memDataOutB;
		end
	end

endmodule
