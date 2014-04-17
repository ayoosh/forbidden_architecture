module MDU_Divider (
	input			clk,		// input clk
	output			rfd,		// output rfd
	input	[31:0]	dividend,	// input [31 : 0] dividend
	input	[31:0]	divisor,	// input [31 : 0] divisor
	output	[31:0]	quotient,	// output [31 : 0] quotient
	output	[31:0]	fractional	// output [31 : 0] fractional
);

endmodule

module FPU_Adder (
	input	[31:0]	a,
	input	[31:0]	b,
	input	[5:0]	operation,
	output	[31:0]	result,
	input			clk
);

endmodule

module FPU_Multiplier (
	input	[31:0]	a,
	input	[31:0]	b,
	output	[31:0]	result,
	input			clk
);

endmodule

module FPU_Divider (
	input	[31:0]	a,
	input	[31:0]	b,
	output	[31:0]	result,
	input			clk
);

endmodule

module FPU_Ftoi (
	input	[31:0]	a,
	output	[31:0]	result,
	input			clk
);

endmodule

module FPU_Itof (
	input	[31:0]	a,
	output	[31:0]	result,
	input			clk
);

endmodule

module FPU_Sqrt (
	input	[31:0]	a,
	output	[31:0]	result,
	input			clk
);

endmodule
