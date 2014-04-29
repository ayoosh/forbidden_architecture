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

	// Dual-Port Block RAM signals
	wire	[DATA_WIDTH-1:0]	memDataOut0_A;
	wire	[DATA_WIDTH-1:0]	memDataOut0_B;
	
	wire	[DATA_WIDTH-1:0]	memDataOut1_A;
	wire	[DATA_WIDTH-1:0]	memDataOut1_B;
	
	reg		[ADDR_WIDTH-1:0]	rAddrRead0;
	reg		[ADDR_WIDTH-1:0]	rAddrRead1;
	
	reg		[ADDR_WIDTH-1:0]	rAddrWrite;
	reg		[DATA_WIDTH-1:0]	rDataWrite;

	// External modules instantiation
	DualPortRAM #(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(ADDR_WIDTH)
	)
	mem_0 (
		// Outputs
		.oDataA	(memDataOut0_A),
		.oDataB	(memDataOut0_B),

		// Inputs
		.iDataA	(32'h0000_0000),
		.iAddrA	(iAddrRead0),
		.iEnA	(iEnRead0),
		.iWeA	(1'b0),
		.iClkA	(iClk),
		.iDataB	(iDataWrite),
		.iAddrB	(iAddrWrite),
		.iEnB	(iEnWrite),
		.iWeB	(1'b1),
		.iClkB	(iClk),
		.iRst_n	(iRst_n)
	);
	
	DualPortRAM #(
		.DATA_WIDTH(DATA_WIDTH),
		.ADDR_WIDTH(ADDR_WIDTH)
	)
	mem_1 (
		// Outputs
		.oDataA	(memDataOut1_A),
		.oDataB	(memDataOut1_B),

		// Inputs
		.iDataA	(32'h0000_0000),
		.iAddrA	(iAddrRead1),
		.iEnA	(iEnRead1),
		.iWeA	(1'b0),
		.iClkA	(iClk),
		.iDataB	(iDataWrite),
		.iAddrB	(iAddrWrite),
		.iEnB	(iEnWrite),
		.iWeB	(1'b1),
		.iClkB	(iClk),
		.iRst_n	(iRst_n)
	);

	// Internal signals assignment
	always @ (posedge iClk) begin
		if (!iRst_n) begin
			rAddrRead0	<= 0;
			rAddrRead1	<= 0;

			rAddrWrite	<= 0;
			rDataWrite	<= 0;
		end
		else begin
			rAddrRead0	<= iAddrRead0;		
			rAddrRead1	<= iAddrRead1;
			
			rAddrWrite	<= iAddrWrite;
			rDataWrite	<= iDataWrite;
		end
	end
	
	
	assign oDataRead0 = (rAddrRead0 == 5'h00) ? 32'h0000_0000 : (rAddrRead0 == rAddrWrite) ? rDataWrite : memDataOut0_A;
	assign oDataRead1 = (rAddrRead1 == 5'h00) ? 32'h0000_0000 : (rAddrRead1 == rAddrWrite) ? rDataWrite : memDataOut1_A;

endmodule
