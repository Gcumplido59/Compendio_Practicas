module mult_vs_shift #(parameter bits = 15)(

	input  [bits:0] a,b,
	input clk,
	output reg [2*bits + 3:0]  result

);

always @(posedge clk)
begin
	result <= (a*b)>>2;
end

endmodule 