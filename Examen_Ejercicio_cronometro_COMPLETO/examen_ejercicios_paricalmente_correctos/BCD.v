module BCD #(parameter N = 4)(
    input [N-1:0] count, dec, cent, mil, seg, seg_cent,
    output [0:6] miliseg, seg_unidad, seg_decena, seg_centena
);

wire [3:0] aux_ms_unidad;
wire [3:0] aux_seg_unidad;
wire [3:0] aux_seg_decena;
wire [3:0] aux_seg_centena;

assign aux_ms_unidad = count;  
assign aux_seg_unidad = dec;  
assign aux_seg_decena = cent;  

decoder DISPLAY1(
    .decoder_in(aux_ms_unidad),
    .decoder_out(miliseg)
);
decoder DISPLAY2(
    .decoder_in(aux_seg_unidad),
    .decoder_out(seg_unidad)
);
decoder DISPLAY3(
    .decoder_in(aux_seg_decena),
    .decoder_out(seg_decena)
);

decoder DISPLAY4(
    .decoder_in(aux_seg_centena),
    .decoder_out(seg_centena)
);


endmodule
