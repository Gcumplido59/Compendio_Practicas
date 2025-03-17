module clkdiv_wrapper #(parameter FREQ = 1)
(
	input MAX10_CLK1_50,
	input [9:0] SW,
	output [9:0] LEDR
);

clkdiv #(.FREQ(FREQ)) MOD_NOMRBES(
	.clk(MAX10_CLK1_50),
	.rst(SW[0]),
	.clk_div(LEDR[0])
);

endmodule