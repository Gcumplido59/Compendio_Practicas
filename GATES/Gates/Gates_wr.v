module Gates_wr(
	
	input [1:0] SW,
	output [7:0] LEDR

);

Gates Wrapper(

.a(SW[0]),
.b(SW[1]),
.z(LEDR)

);


endmodule 