module cronometro(
    input clk,
    input rst,
    input enable,
    output [0:6] display1, display2, display3, display4, display5
);

wire rst_debouncer;
wire clk_segundos;
wire clk_milisegundos;
wire [3:0] count, dec, cent, mil, seg, seg_dec;


debouncer #(.N_MAX(5000)) debouncer_rst (
    .clk(clk),
    .debouncer_in(rst),
    .debouncer_out(rst_debouncer)
);

clock_divider #(.FREQ(1)) clkdiv_inst (
    .clk(clk),
    .rst(rst_debouncer),
    .clk_div(clk_segundos)
);

clock_divider #(.FREQ(1000)) clkdiv_inst2 (
    .clk(clk),
    .rst(rst_debouncer),
    .clk_div(clk_milisegundos)
);

contador contador_inst2 (
    .clk(clk_milisegundos),
    .rst(rst_debouncer),
    .enable(enable),
	 .count(count),
	 .dec(dec),
	 .cent(cent),
	 .seg(seg),
	 .seg_dec(seg_dec)
);


BCD display_inst (
    .count(count),
	 .dec(dec),
	 .cent(cent),
	 .seg(seg),
	 .seg_dec(seg_dec),
    .mili_uni(display1),
	 .mili_dec(display2),
	 .mili_cent(display3), 
	 .seg_uni(display4), 
	 .seg_dece(display5)
);


endmodule
