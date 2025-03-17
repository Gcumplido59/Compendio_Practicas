module uart_tb;

//auxiliares
reg [7:0] data = 8'b1101_0010;
reg send_data = 0;
reg clk = 0;
reg rst = 1;

wire serial_out;

uart DUT(
	.data(data),
	.send_data(send_data),
	.clk(clk),
	.rst(rst),
	.serial_out(serial_out)
);

always #10 clk <= ~clk;

initial
	begin
		rst = 0;
		#5000
		rst = 1;
		#5000
		send_data = 1;
	end
endmodule