module one_shot_wr(
	input MAX10_CLK1_50,
	input [9:0] SW,
	output [9:0] LEDR
);

oneshot WRAPPER(
.clk(MAX10_CLK1_50)
.button([9:0] SW)
.delay([9:0] LEDR)
);

endmodule