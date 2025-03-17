`timescale 20ns / 1ps

module contador_tb();

reg clk, rst, enable;
wire [3:0] count;

contador DUT(
.clk(clk_reg),
.rst(rst_reg),
.enable(enable_reg),
.count(count_wire)
);

initial
begin
	rst = 1;
	#10
	rst = 0;
	#10
	enable = 1;
	$stop;
	$finish;
end
endmodule