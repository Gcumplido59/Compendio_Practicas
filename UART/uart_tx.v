module uart_tx(
	input [7:0] data,
	input send_data, rst, clk,
	output reg serial_out
);

localparam base_freq = 50_000_000;
localparam baudrate = 115_200; // velocidad de transmisión
localparam counts_per_bit = base_freq / baudrate;

localparam	TX_IDLE   = 3'b000,
           TX_START  = 3'b001,
           TX_DATA   = 3'b010,
           TX_PARITY = 3'b011,
           TX_STOP   = 3'b100;
					
reg [2:0] active_state;  
reg [31:0] clock_ctr;
reg [3:0] d_idx;       

always @(posedge clk or negedge rst)
begin
	if (~rst) begin
		active_state <= TX_IDLE;
		clock_ctr <= 0;
		d_idx <= 0;
	end
	else begin
		case (active_state)
			
			TX_IDLE:
			begin
				serial_out <= 1;
				clock_ctr <= 0;
				d_idx <= 0;
				
				if (send_data)
					active_state <= TX_START;
				else
					active_state <= TX_IDLE;
			end
			
			TX_START:
			begin
				serial_out <= 0;
				if (clock_ctr < counts_per_bit - 1) begin
					clock_ctr <= clock_ctr + 1;
					active_state <= TX_START;
				end
				else begin
					clock_ctr <= 0;
					active_state <= TX_DATA;
				end
			end
			
			TX_DATA:
			begin
				serial_out <= data[d_idx];
				if (clock_ctr < counts_per_bit - 1) begin
					clock_ctr <= clock_ctr + 1;
					active_state <= TX_DATA;
				end
				else begin
					clock_ctr <= 0;
					if (d_idx < 7) begin
						d_idx <= d_idx + 1;
						active_state <= TX_DATA;
					end
					else
						active_state <= TX_PARITY;
				end
			end
			
			TX_PARITY:
			begin
				serial_out <= ^data;  
				if (clock_ctr < counts_per_bit - 1) begin
					clock_ctr <= clock_ctr + 1;
					active_state <= TX_PARITY;
				end
				else begin
					clock_ctr <= 0;
					active_state <= TX_STOP;
				end
			end
			
			TX_STOP:
			begin
				serial_out <= 1;
				if (clock_ctr < counts_per_bit - 1) begin
					clock_ctr <= clock_ctr + 1;
					active_state <= TX_STOP;
				end
				else begin
					clock_ctr <= 0;
					active_state <= TX_IDLE;
				end
			end
			
			default:
				active_state <= TX_IDLE;
		endcase
	end
end

endmodule
