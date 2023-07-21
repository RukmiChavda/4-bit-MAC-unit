`timescale 1ns / 1ps


module MAC_4_bit_tb;
    
    reg [3:0]i,j;
    reg clk,rst;
    wire [8:0]f;
    
    MAC_4_bit unit(f,i,j,clk,rst);
    
    always #5 clk = ~clk;  
    
    initial begin
        
        clk <= 0;   
        rst <= 0;
        
        #10 rst <=1;
        
        i <= 4'b1010;  j <= 4'b1010;  
        #10;
        i <= 4'b1101;  j <= 4'b0110; 
        #10;
        i <= 4'b1001;  j <= 4'b0010; 
        #10;
        i <= 4'b0101;  j <= 4'b0100; 
        #10;
        rst <= 0;
        i <= 4'b1001;  j <= 4'b0010; 
        #10;
        i <= 4'b0101;  j <= 4'b0100; 
        #10 rst <=1;
        i <= 4'b1110;  j <= 4'b0010;  
        #10;
        i <= 4'b1001;  j <= 4'b0011; 
        #10;
        rst <= 0;
       
    end
    
endmodule
