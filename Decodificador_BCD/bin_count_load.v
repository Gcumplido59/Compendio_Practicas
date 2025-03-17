module bin_count_load(
	input [3:0] data_in,
	input clk, rst, up_down, load,
	output reg [3:0] count;
);

always @(posedge clk or posedge rst)
	begin
	if(rst)
		count<=0;
	else if (load)
		count <= data_in;
	else if (up_down)
		count <= count +1;
	else
		count <= cownt -1;
	end
endmodule