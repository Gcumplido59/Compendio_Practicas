module debouncer(
	input pb_1, clk, rst,
	output pb_out
);

wire Q0, Q1, Q2, Q2_bar;
wire slow_clk;

//reducir el reloj
clock_divider #(.FREQ(40)) u1(clk, rst, slow_clk);

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

module clock_divider #(parameter FREQ)(
	input clk, rst,
	output reg clk_div
);

localparam CLK_FREQ = 50_000_000;
localparam COUNT_MAX = (CLK_FREQ/(2*FREQ));

reg [31:0] count;
//reg [ceillog(COUNT_MAX) -1:0] count;

always@(posedge clk or posedge rst)
	begin
		if(rst)
			count<=0;			
		else if (count == COUNT_MAX-1)
			count<=0;
		else
			count<= count+1;
	end
	
always@(posedge clk or posedge rst)
	begin
		if(rst==1)
			clk_div<=0;
		else if (count == COUNT_MAX -1)
			clk_div <= ~clk_div;
		else
			clk_div <= clk_div;
	end

endmodule