module BCD #(parameter N = 10)(
//entradas switches
	input [N-1:0] BCD_in_sw,
	output [0:6] display_unidad,display_decena,display_centena,display_miles
);

//auxiliares
wire [3:0] aux_mil;
wire [3:0] aux_cent;
wire [3:0] aux_decenas;
wire [3:0] aux_unidades;

//Division de unidades, decenas, centenas y miles
assign aux_unidades = BCD_in_sw % 10;  
assign aux_decenas = (BCD_in_sw %100)/10;
assign aux_cent = (BCD_in_sw %1000)/100;
assign aux_mil = BCD_in_sw /1000;

decoder_7_seg DISPLAY1(
.decoder_in(aux_unidades),
.decoder_out(display_unidad)
);

decoder_7_seg DISPLAY2(
.decoder_in(aux_decenas),
.decoder_out(display_decena)
);

decoder_7_seg DISPLAY3(
.decoder_in(aux_cent),
.decoder_out(display_centena)
);

decoder_7_seg DISPLAY4(
.decoder_in(aux_mil),
.decoder_out(display_miles)
);

endmodule