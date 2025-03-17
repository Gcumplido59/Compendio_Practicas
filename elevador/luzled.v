module luzled(
	input rst,
	input boton,
	input clk,
	output reg [9:0] led,
	output reg person_in
);

parameter	idle = 0,
				s1 = 1,
				s2 = 2,
				s3 = 3,
				s4 = 4,
				s5 = 5,
				s6 = 6,
				s7 = 7,
				s8 = 8,
				s9 = 9,
				s10 = 10;
				
reg [3:0] current_state;
reg [3:0] next_state;
wire clklento;

clock_divider #(.FREQ(1_000)) clkdiv_inst (
    .clk(clk),
    .rst(1'b0),       
    .clk_div(clklento)
);

always @(posedge clklento or posedge rst)
begin
	if(rst)
		current_state <= idle;
	else
		current_state <= next_state;
end


always @(current_state, boton)
begin
	case(current_state)
		idle:
		begin
			if (!boton)
				next_state = idle;
			else
				next_state = s1;
		end
		
		s1: next_state = s2;
		
		s2: next_state = s3;
		
		s3: next_state = s4;
		
		s4: next_state = s5;
		
		s5: next_state = s6;
		
		s6: next_state = s7;
		
		s7: next_state = s8;
		
		s8: next_state = s9;
		
		s9: next_state = s10;
		
		s10: next_state = idle;
		
	endcase
end

always @(current_state, boton)
begin
	case(current_state)
		idle: led = 10'b11111_11111;
		s1:	led = 10'b11110_01111;
		s2:	led = 10'b11100_00111;
		s3:	led = 10'b11000_00011;
		s4:	led = 10'b10000_00001;
		s5:	led = 10'b00000_00000;
		s6:	led = 10'b10000_00001;
		s7:	led = 10'b11000_00011;
		s8:	led = 10'b11100_00111;
		s9:	led = 10'b11110_01111;
		s10:
			begin
				led = 10'b11111_11111;
				person_in = 1;
			end
			
	endcase
end

endmodule