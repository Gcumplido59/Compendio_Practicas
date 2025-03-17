module BCD #(parameter N = 4)(
    input [N-1:0] count, dec, cent, seg, seg_dec,
    output [0:6] mili_uni, mili_dec, mili_cent, seg_uni, seg_dece
);

wire [3:0] aux_ms_unidad;
wire [3:0] aux_ms_decena;
wire [3:0] aux_ms_centena;
wire [3:0] aux_seg;
wire [3:0] aux_seg_decena;

assign aux_ms_unidad = count;  
assign aux_ms_decena = dec;  
assign aux_ms_centena = cent;  
assign aux_seg = seg; 
assign aux_seg_decena = seg_dec;  

decoder DISPLAY1(
    .decoder_in(aux_ms_unidad),
    .decoder_out(mili_uni)
);
decoder DISPLAY2(
    .decoder_in(aux_ms_decena),
    .decoder_out(mili_dec)
);
decoder DISPLAY3(
    .decoder_in(aux_ms_centena),
    .decoder_out(mili_cent)
);

decoder DISPLAY4(
    .decoder_in(aux_seg),
    .decoder_out(seg_uni)
);

decoder DISPLAY5(
    .decoder_in(aux_seg_decena),
    .decoder_out(seg_dece)
);


endmodule
