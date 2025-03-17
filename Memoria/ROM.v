module ROM #(parameter DATA_WIDTH = 8, ADDRESS_WIDTH = 8)(
	input ce, read_en,
	input [ADDRESS_WIDTH-1:0] address,
	output [ADDRESS_WIDTH-1:0] data
);

reg [DATA_WIDTH -1:0] mem [0.2**(ADDRESS_WIDTH)-1];

initial
begin
	$readmemH("ROM.hex", mem);
end

assign data = (ce && read_en) ? mem[address] : 8'h00;

endmodule
