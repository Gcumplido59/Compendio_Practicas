module d3consecutivo(
	input clk,
	input rst_a_p,
	input detection,
	output reg FSM_out
);

parameter	A=0,
				B=1,
				C=2,
				D=3;
				
reg [1:0] current_state;
reg [1:0] next_state;

always @(posedge clk or posedge rst_a_p)
begin
	if((rst_a_p) or (detection == 0))
		current_state <= A;
	else
		current_state <= next_state;
end


always @(current_state, detection)
begin
	case(current_state)
		A:
		begin
			if (detection == 0)
				next_state = A;
			else
				next_state = B;
		end
		
		B: 
		begin
			if (detection == 0)
				next_state = A;
			else 
				next_state  = C;
		end
		
		C:
		begin
			if (detection == 0)
				next_state = A;
			else
				next_state = D;
		end
		
		D:
		begin
			if (enable == 0)
				next_state = A;
			else
				next_state = D;
		end	
	endcase
end

always @(current_state, detection)
begin
	case(current_state)
		A:
			FSM_out = 0;
		B:
			FSM_out = 1;
		C:
			FSM_out = 2;
		D:
			FSM_out = 3;
		end	
	endcase
end

endmodule