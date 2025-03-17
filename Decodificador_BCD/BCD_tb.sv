module BCD_tb #(parameter N = 10, ITERACIONES = 10)();
reg [N-1 : 0] BCD_in_sw;

wire [0:6] display_unidad;
wire [0:6] display_decena;
wire [0:6] display_centena;
wire [0:6] display_miles;

BCD DUT(
.BCD_in_sw(BCD_in_sw),
.display_unidad(display_unidad),
.display_decena(display_decena),
.display_centena(display_centena),
.display_miles(display_miles)
);

task set_input();
	BCD_in_sw = $urandom_range(0,2**N-1);
	$display("valor a probar = %d",BCD_in_sw);
	#10;
endtask

integer i;

initial
begin
	for(i=0;i< ITERACIONES; i=i+1)
	begin
		set_input();
	end
end

endmodule