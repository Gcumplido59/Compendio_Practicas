// Code your testbench here
// or browse Examples

module gates_tb();
  reg A_reg;
  reg B_reg;
  wire Z_wire;
  
//Instancia el modulo a probar
gates DUT(
  .a_in(a_reg),
  .b_in(b_reg),
  .z_out(z_wire)
);
  
initial
  begin
    A_Reg = 0;
    B_reg = 0;
    
    $display("A_in:%0h, B_in:%0h, Z_0:%0h", A_reg,B_reg, Z_out);
    #10;
    A_reg = 1;
    #10;
    B_reg = 1;
    #10;
    A_reg = 0;
    #10;
    $stop
    $finish
  end
endmodule