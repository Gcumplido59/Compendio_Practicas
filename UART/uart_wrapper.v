module uart_wrapper (
input MAX10_CLK1_50,
input [1:0] KEY,
input [7:0] SW,
output [7:0] LEDR,
output LEDR8
);

uart uart_inst (
    .clk(MAX10_CLK1_50),
    .rst(KEY[0]),
    .btn(KEY[1]),
    .sw(SW),
    .led(LEDR),
	 .led_parity(LEDR8)
);

endmodule