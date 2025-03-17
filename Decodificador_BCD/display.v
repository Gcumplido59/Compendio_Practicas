module display(
	input s0, s1,
	output a,b,c,d,e,f,g
);

assign a = ~(~s0),
		b = 0,
		c = ~(~s1),
		d = ~(~s0),
		e = ~(~s0),
		f = ~((~s1) & (~s0)),
		g = ~((s1) & (~s0));
		
endmodule
