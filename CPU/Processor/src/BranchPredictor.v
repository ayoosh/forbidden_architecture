// Include listing

// Branch Predictor module ports declaration
module BranchPredictor (
	// Outputs
	output	oBranchTake,
	
	// Inputs
	input	iBranchCmd,
	input	iBranchTaken,
	input	iClk,
	input	iRst_n
);

	// Local Parameters definition
	localparam	NOT_TAKEN1	= 2'b00;
	localparam	NOT_TAKEN2	= 2'b01;
	localparam	TAKEN1		= 2'b10;
	localparam	TAKEN2		= 2'b11;
	
	// Internal signals declaration
	reg		[1:0]	state, nextState;
	
	// Internal signals assignment
	// FSM: Input Combinational Logic
	always @ (state, iBranchCmd, iBranchTaken) begin
		case (state)
			TAKEN1:		nextState = (iBranchCmd && !iBranchTaken) ? TAKEN2 : TAKEN1;
			TAKEN2:		nextState = iBranchCmd ? (iBranchTaken ? TAKEN1 : NOT_TAKEN1) : TAKEN2;
			NOT_TAKEN1:	nextState = iBranchCmd ? (iBranchTaken ? TAKEN2 : NOT_TAKEN2) : NOT_TAKEN1;
			NOT_TAKEN2:	nextState = (iBranchCmd && iBranchTaken) ? NOT_TAKEN1 : NOT_TAKEN2;
			default:	nextState = TAKEN1;
		endcase
	end
	
	// FSM: Flip-Flops
	always @ (posedge iClk) begin
		if (!iRst_n)
			state <= TAKEN1;
		else
			state <= nextState;
	end
	
	// Outputs assignment
	// FSM: Output Combinational Logic
	assign oBranchTake = state[1];

endmodule
