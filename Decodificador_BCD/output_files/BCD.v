module BCD #(parameter N = 4)(
//entradas switches
	input [N-1:0] BCD_in_sw,
	output [0:6] display_unidad
);

//auxiliar
wire [3:0] aux_unidades;

//Division de unidades
assign aux_unidades = BCD_in_sw % 10;  


display DISPLAY1(
.decoder_in(aux_unidades),
.decoder_out(display_unidad)
);

endmodule