// Code your design here

module gates(
  
  input A_in,B_in,
  output reg [7:0] Z_out
);

  always @(*)
    begin
      Z_out[0] = A_in & B_in;
      Z_out[1] = A_in | B_in;
      Z_out[2] = A_in ^ B_in;
      Z_out[3] = !B_in;
      Z_out[4] = ~(A_in & B_in);
      Z_out[5] = ~(A_in | B_in);
      Z_out[6] = ~(A_in ^ B_in);
      Z_out[7] = !A_in;
    end
   
endmodule
