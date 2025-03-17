module contador(
	input clk, rst, enable,
	output reg [3:0] count, dec, cent, seg, seg_dec
);


always @(posedge clk or posedge rst) begin
  if (rst)
  begin
    count    <= 0;
    dec      <= 0;
    cent     <= 0;
    seg      <= 0;
    seg_dec  <= 0;
  end
  else if (enable)
  begin
    if (count < 9)
	 begin
      count <= count + 1;
    end
	 else
	 begin
      count <= 0;
      if (dec < 9)
		begin
        dec <= dec + 1;
      end
		else
		begin
        dec <= 0;
        if (cent < 9)
		  begin
          cent <= cent + 1;
        end
		  else
		  begin
          cent <= 0;

          if (seg < 9)
			 begin
            seg <= seg + 1;
          end
			 else
			 begin
            if (seg_dec < 5)
				begin
              seg_dec <= seg_dec + 1;
              seg <= 0;
            end
				else
				begin   
              count    <= 0;
              dec      <= 0;
              cent     <= 0;
              seg      <= 0;
              seg_dec  <= 0;
            end
          end
        end
      end
    end
  end
end
endmodule