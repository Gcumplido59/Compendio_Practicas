module cronometro(
    input clk,
    input rst,
    input enable,
    output [0:6] display1, display2, display3, display4, display5
);

wire rst_debouncer;
wire clk_segundos;
wire clk_milisegundos;
wire [3:0] count, dec, cent, mil, seg, seg_cent;


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

clock_divider #(.FREQ(150)) clkdiv_inst2 (
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
	 .mil(mil),
	 .seg(seg),
	 .seg_cent(seg_cent)
);


BCD display_inst (
    .count(count),
	 .dec(dec),
	 .cent(cent),
	 .mil(mil),
	 .seg(seg),
	 .seg_cent(seg_cent),
    .miliseg(display1),
	 .seg_unidad(display2),
	 .seg_decena(display3),
	 .seg_centena(display4)
);


endmodule
