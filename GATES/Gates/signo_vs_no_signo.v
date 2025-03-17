module signo_vs_no_signo(

	input [15:0] dato,
	output [15:0] dato_abs

);

wire signed [15:0] dato_aux;
assign dato_aux = dato;
assign dato_abs = dato_aux < 0? -dato_aux: dato_aux;


endmodule 