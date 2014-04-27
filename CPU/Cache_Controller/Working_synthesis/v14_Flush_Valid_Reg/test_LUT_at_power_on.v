//****************************************************
//Test to find power on value of LUTS
//****************************************************

module test_DUT (
input 				clk,
input				rst,
output 		[31:0] data
);


reg [3:0] count_y;
reg	[31:0] LUT [5:0];

assign data = LUT[count_y]; 

always @ (posedge clk) begin
if(rst)
	count_y <=0;
else
	count_y <= count_y + 1;
end

endmodule