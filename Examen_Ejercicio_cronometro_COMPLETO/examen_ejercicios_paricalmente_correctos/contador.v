module contador(
	input clk, rst, enable,
	output reg [3:0] count, dec, cent, mil, seg, seg_cent
);


always @(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			count<=0;
			dec<=0;
			cent<=0;
			mil<=0;
			seg<=0;
			seg_cent<=0;
		end
		else if(enable)
		begin
			count<=count+1;
			if (count == 9)
			begin
				dec <= dec +1;
				count <= 0;
			end
			if (dec == 9)
			begin
				cent <= cent +1;
				dec <= 0;
			end
			if (cent == 9)
			begin
				mil <= mil +1;
				cent <= 0;
			end
			if (mil == 9)
			begin
				seg <= seg +1;
				mil <= 0;
			end
			if(seg == 9)
			begin
				seg_cent <= seg_cent+1;
				seg <= 0;
			end
				
		end
		else
			count<=count;
	end
endmodule