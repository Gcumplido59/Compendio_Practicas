module debouncer2_tb;

reg pb_1;
reg clk = 0;
reg rst;
wire pb_out;

debouncer2 DUT(
.pb_1(pb_1),
.clk(clk),
.rst(rst),
.pb_out(pb_out)
);

always #10 clk <= ~clk;

initial
	begin
	   rst= 0;
		#100;
		rst= 1;
		#100;
		rst= 0;
		#100;
		
		pb_1 = 1;
		#100;
		pb_1 = 0;
		#100;
		pb_1 = 1;
		#100;
		pb_1 = 0;
		#100;
	end
endmodule
