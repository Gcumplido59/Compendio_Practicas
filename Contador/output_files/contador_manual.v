module contador_manual(
    input [3:0] sw_manual,
    output [3:0] count
);
  assign count = sw_manual;
endmodule
