module oneshot_tb;

    reg clk;
    reg button;
    wire oneShot;
    

    oneshot DUT(
        .clk(clk),
        .button(button),
        .oneShot(oneShot)
 );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        button = 0;
        
        #10
		  button = 1;
        #100
		  button = 0;
        #10
		  button = 1;
        #50        
        $stop;
    end
    
endmodule
