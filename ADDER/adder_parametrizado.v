module adder_parametrizado #(parameter N = 5)(
	input [N-1:0] A,B,
	output [N:0] suma,
	output cout
);

wire [N-1:0] c_wire;

//instanciamos el primer fulladder

fulladder FA0 (
.a(A[0]),
.b(B[0]),
.cin(0),
.s(suma[0]),
.cout(c_wire[0])
);

genvar i;

generate
	for(i=1;i<N;i =i+1)
	begin : Create_SUM
		fulladder FA (
		.a(A[i]),
		.b(B[i]),
		.cin(c_wire[i-1]),
		.s(suma[i]),
		.cout(c_wire[i])
		);
	end
endgenerate

assign suma[N] = c_wire[N-1];

endmodule