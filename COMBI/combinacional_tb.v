`timescale 1ns / 100ps

module combinacional_tb();

reg [5:0] data_in_reg;
wire [2:0] data_out_wire;

combinacional2 DUT(
.data_in(data_in_reg),
.data_out(data_out_wire)
);

initial 
begin
	data_in_reg = 6'b101010;
	#10
	data_in_reg = 6'b101100;
	#10
	data_in_reg = 6'b101101;
	#10
	data_in_reg = 6'b011011;
	#10
	data_in_reg = 6'b101111;
	#10
	$stop;
	$finish;
end

endmodule 