module top_7seg #(parameter N = 5, SEGMENTOS = 7)(
	input[N-1 : 0] A,B,
	output [0 : 6] D_decenas, D_unidades
);

//auxiliar
wire [N:0] suma_wire;
wire [3:0] unidades_wire;
wire [3:0] decenas_wire;

adder_parametrizado SUMADOR(
.A(A),
.B(B),
.suma(suma_wire)
);

//division de unidades y decenas
assign unidades_wire = suma_wire % 10;
assign decenas_wire = suma_wire / 10;


endmodule
