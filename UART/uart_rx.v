module uart_rx(
    input clk, serial_in, rst,
    output reg [7:0] parallel_out,
    output reg parity_error,
    output reg parity_bit  
);

localparam baudrate      = 'd115_200;
localparam base_freq     = 'd50_000_000;
localparam clock_per_bit = base_freq / baudrate;

localparam RX_IDLE       = 0,
           RX_START_BIT  = 1,
           RX_DATA       = 2,
           RX_PARITY     = 3,
           RX_STOP       = 4;
                    
reg [2:0] active_state = RX_IDLE;
reg [31:0] clock_ctr = 0;
reg [2:0] d_idx = 0;
            
always @(posedge clk or negedge rst)
begin
    if (~rst) begin
        active_state   <= RX_IDLE;
        clock_ctr      <= 0;
        d_idx          <= 0;
        parallel_out   <= 8'b0;
        parity_error   <= 0;
        parity_bit     <= 0;
    end
    else begin
        case(active_state)
            RX_IDLE:
            begin
                if (serial_in == 0)
                    active_state <= RX_START_BIT;
                else
                    active_state <= RX_IDLE;
            end
            
            RX_START_BIT:
            begin
                if (clock_ctr <= (clock_per_bit - 1)/2) begin
                    clock_ctr <= clock_ctr + 1;
                    active_state <= RX_START_BIT;
                end
                else begin
                    clock_ctr <= 0;
                    active_state <= RX_DATA;
                end
            end
            
            RX_DATA:
            begin
                if (clock_ctr <= clock_per_bit - 1) begin
                    clock_ctr <= clock_ctr + 1;
                    active_state <= RX_DATA;
                end
                else begin
                    clock_ctr <= 0;
                    parallel_out[d_idx] <= serial_in;
                    if (d_idx < 7) begin
                        d_idx <= d_idx + 1;
                        active_state <= RX_DATA;
                    end
                    else begin
                        active_state <= RX_PARITY;
                    end
                end
            end
            
            RX_PARITY:
            begin
                if (clock_ctr <= clock_per_bit - 1) begin
                    clock_ctr <= clock_ctr + 1;
                    active_state <= RX_PARITY;
                end
                else begin
                    clock_ctr <= 0;
                    parity_bit <= serial_in; // Se captura el bit de paridad recibido
                    if (serial_in == (^parallel_out))
                        parity_error <= 0;
                    else
                        parity_error <= 1;
                    active_state <= RX_STOP;
                end
            end
            
            RX_STOP:
            begin
                if(clock_ctr <= clock_per_bit - 1) begin
                    clock_ctr <= clock_ctr + 1;
                    active_state <= RX_STOP;
                end
                else begin
                    clock_ctr <= 0;
                    active_state <= RX_IDLE;
                    d_idx <= 0;
                end
            end
            
            default:
                active_state <= RX_IDLE;
        endcase
    end
end
endmodule
