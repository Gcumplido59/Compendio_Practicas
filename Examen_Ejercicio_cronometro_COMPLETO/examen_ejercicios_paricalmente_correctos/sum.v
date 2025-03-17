module sum(
	input [4:0] N, 
	input start,
	input clk,
	input rst,
	output reg [0:6] HEX0, HEX1, HEX2
);

parameter 	IDLE = 0,
				SUM = 1,
				DONE = 2;
				
reg [3:0] current_state;
reg [3:0] next_state;

wire clklento;
wire count;

clock_divider #(.FREQ(2)) clkdiv_inst (
    .clk(clk),
    .rst(1'b0),       
    .clk_div(clklento)
);


always @(posedge clklento or posedge rst)
begin
	if(rst)
		current_state <= IDLE;
	else
		current_state <= next_state;
end

			
always @(current_state, start)
begin
	case(current_state)
		IDLE:
		begin
			if (!start)
				next_state = IDLE;
			else 
				next_state = COMPLETE;	
		end
		
		SUM:
		begin
			if (count < N)
				next_state = DONE;
			else
				next_state = COMPLETE;
		end
		
		DONE:
			begin
				if (rst)
				next_state = IDLE;
				else
				next_state = DONE;
			end
	endcase
end

always @(current_state, start)
begin
	case(current_state)
		IDLE: 
		SUM:
			
			
	endcase
end

endmodule