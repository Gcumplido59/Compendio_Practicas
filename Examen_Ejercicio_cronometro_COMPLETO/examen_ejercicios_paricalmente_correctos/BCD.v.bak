module BCD #(parameter N = 4)(
    input [N-1:0] BCD_in_sw,
    output [0:6] display_unidad
);

wire [3:0] aux_unidades;
assign aux_unidades = BCD_in_sw;

decoder DISPLAY1(
    .decoder_in(aux_unidades),
    .decoder_out(display_unidad)
);

endmodule
