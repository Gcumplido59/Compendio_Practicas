module top_contador(
    input clk,
    input rst,
    input enable,
    input direccion,
    input manual_sel,
    input [3:0] sw_manual,
    output [0:6] display
);

wire rst_debouncer;
wire clk_segundos;
wire [3:0] decrecerCrecer;
wire [3:0] manual_count;
wire [3:0] counter_out;
wire manual_mode;

debouncer #(.N_MAX(5000)) debouncer_rst (
    .clk(clk),
    .debouncer_in(rst),
    .debouncer_out(rst_debouncer)
);

clkdiv #(.FREQ(1)) clkdiv_inst (
    .clk(clk),
    .rst(rst_debouncer),
    .clk_div(clk_segundos)
);

contador contador_inst (
    .clk(clk_segundos),
    .rst(rst_debouncer),
    .enable(enable),
    .direccion(direccion),
    .count(decrecerCrecer)
);

contador_manual manual_inst (
    .sw_manual(sw_manual),
    .count(manual_count)
);

assign manual = rst_debouncer & manual_sel;
assign counter_out = manual ? manual_count : decrecerCrecer;

BCD display_inst (
    .BCD_in_sw(counter_out),
    .display_unidad(display)
);


endmodule
