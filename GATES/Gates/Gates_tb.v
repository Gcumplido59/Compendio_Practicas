`timescale 1ns / 100ps

module Gates_tb();

reg a_in;
reg b_in;
wire [7:0] z_out;

Gates DUT(
.a(a_in),
.b(b_in),
.z(z_out)
);

initial 
begin
	a_in = 0;
	b_in = 0;
	#10
	a_in = 0;
	b_in = 1;
	#10
	a_in = 1;
	b_in = 1;
	#10
	a_in = 1;
	b_in = 0;
	#10
	$stop;
	$finish;
end

endmodule 
