module pwm(
	input pb_inc,
	input pb_dec,
	input clk,
	input rst,
	output pwm_out
);

wire neg_pb_inc = ~pb_inc;
wire neg_pb_dec = ~pb_dec;
wire slow_clk;
wire debounced_pb_inc, debounced_pb_dec;

reg [31:0] DC;

parameter base_freq = 'd50_000_000;
parameter target_freq = 'd50;
parameter counts = base_freq/target_freq;

//reducir el reloj
clkdiv u1(clk, rst, slow_clk);

//debouncers
debouncer2 d0(neg_pb_inc, slow_clk, rst, debounced_pb_inc);
debouncer2 d1(neg_pb_dec, slow_clk, rst, debounced_pb_dec);

//generador duty cycle
always @(posedge slow_clk or negedge rst)
begin
	if (debounced_pb_dec)
//		DC<=DC - X;
	else
//		DC<= DC + X;
end

endmodule


module debouncer2(
	input pb_1, clk, rst,
	output pb_out
);

wire Q0, Q1, Q2, Q2_bar;
wire slow_clk;

//reducir el reloj
clkdiv u1(clk, rst, slow_clk);

//flip flops
d_ff d0(slow_clk, pb_1, Q0);
d_ff d1(slow_clk, Q0, Q1);
d_ff d2(slow_clk, Q1, Q2);

assign Q2_bar = ~ Q2;
assign pb_out = Q1 & Q2_bar;

endmodule

//Flip Flop D
module d_ff(
	input slow_clk, D,
	output reg Q
);

always @(posedge slow_clk)
begin
	Q <= D;
end
endmodule