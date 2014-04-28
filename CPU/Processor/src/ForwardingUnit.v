// Include listing

// Forwarding Unit module ports declaration
module ForwardingUnit (
	// Outputs
	output	[1:0]	oForwardCmd0,
	output	[1:0]	oForwardCmd1,

	// Inputs
	input	[4:0]	iExRegRs,
	input	[4:0]	iExRegRt,
	input	[4:0]	iMemRegRd,
	input			iMemRegWrite,
	input	[4:0]	iWbRegRd,
	input			iWbRegWrite
);

	// Outputs assignment
	assign oForwardCmd0	=	(iMemRegWrite && !(iMemRegRd == 32'h0) && (iMemRegRd == iExRegRs)) ? 2'b01 :
							(iWbRegWrite && !(iWbRegRd == 32'h0) && (iWbRegRd == iExRegRs)) ? 2'b10 :
							2'b00;
	assign oForwardCmd1	=	(iMemRegWrite && !(iMemRegRd == 32'h0) && (iMemRegRd == iExRegRt)) ? 2'b01 :
							(iWbRegWrite && !(iWbRegRd == 32'h0) && (iWbRegRd == iExRegRt)) ? 2'b10 :
							2'b00;

endmodule
