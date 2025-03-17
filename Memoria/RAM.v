module RAM #(parameter DATA_WIDTH = 5, ADDRESS_WIDTH = 5)(
	input clk,
	input wr_en,
	input [DATA_WIDTH -1:0] data_in,
	input [ADDRESS_WIDTH -1:0] address_in,
	
	output reg [ADDRESS_WIDTH -1:0] data_out
);

wire wr_en_boton = !wr_en;

reg [DATA_WIDTH -1:0] RAM_MEMORY [0.2**(ADDRESS_WIDTH)-1];

always @(posedge clk)
begin
	if(wr_en_boton)
		RAM_MEMORY[address_in] <= data_in;
	else
		data_out <= RAM_MEMORY[address_in];
end

endmodule