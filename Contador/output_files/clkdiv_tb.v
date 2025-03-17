module clkdiv_tb;

  // Declaración de señales de entrada y salida
  reg clk;
  reg rst;
  wire clk_div;

  // Instanciación del módulo clkdiv con un valor reducido de constantN
  clkdiv #(.FREQ(80)) DUT (
    .clk(clk),
    .rst(rst),
    .clk_div(clk_div)
  );

  // Generación del reloj: periodo de 10 ns (5 ns alto, 5 ns bajo)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Secuencia de estímulos
  initial begin
    // Aplicar reset al inicio
	 rst = 0;
	 #10
    clk_div = 1;
    #10;          
    clk_div = 0;     
	 #10
    clk_div = 1;
    #10;          
    clk_div = 0;    
	#10
    clk_div = 1;
    #10;          
    clk_div = 0;    

    
    #200;
    $finish;
  end

endmodule

