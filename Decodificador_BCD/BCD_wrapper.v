module BCD_wrapper #(parameter N = 10)
(
	input [9:0] SW,
	output [0:6] HEX0,HEX1,HEX2,HEX3
);

BCD #(.N(N)) MOD_NOMBRES(
	.BCD_in_sw(SW),
	.display_unidad(HEX0),
	.display_decena(HEX1),
	.display_centena(HEX2),
	.display_miles(HEX3)
);

endmodule