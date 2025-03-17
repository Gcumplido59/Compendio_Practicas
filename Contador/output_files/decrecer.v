module decrecer(
    input clk, rst, enable,
    output reg [3:0] count
);


always @(posedge clk or posedge rst)

	begin
	
		if(rst)
			count<=0;
			
		else if(enable)
			count<=count-1;
		else
			count<=count;
			
	end
endmodule