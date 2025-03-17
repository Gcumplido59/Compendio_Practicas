`timescale 1ns / 100ps

module adder_tb();

reg a_reg,b_reg;
wire S1_wire,S0_wire;

adder DUT(
.a(a_reg),
.b(b_reg),
.s1(s1_wire),
.s2(s2_wire)
);

initial
begin
	a_reg = 0;
	b_reg = 0;
	#10
	a_reg = 0;
	b_reg = 1;
	#10
	a_reg = 1;
	b_reg = 0;
	#10
	a_reg = 1;
	b_reg = 1;
	#10
	$stop;
	$finish;
end
endmodule