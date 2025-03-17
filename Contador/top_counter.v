module top_counter(
    input clk, rst, enable,           
    output [0:6] display
);


wire slow_clk;

clkdiv #(.FREQ(1_000)) clkdiv_inst (
    .clk(clk),
    .rst(1'b0),       
    .clk_div(slow_clk)
);


contador contador_inst(

);
reg [3:0] counter;
always @(posedge slow_clk) begin
    if(counter == 4'd9)
        counter <= 4'd0;
    else
        counter <= counter + 1;
end

BCD display_inst (
    .BCD_in_sw(counter),
    .display_unidad(display)
);

endmodule
