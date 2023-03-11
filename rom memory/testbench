`timescale 1ns / 1ps

module rom_tb( );
    reg clk, enb;
    reg [2:0]addr;
    wire [7:0]out;
    
    rom uut (.clk(clk), .enb(enb), .addr(addr), .out(out));
    
    always #5 clk=~clk;
    initial begin
        clk=0; enb=0; 
        #100;
        
        enb=1;
        addr=3;
        #10;
        
        addr=2;
        #10;
        
        addr=7;
        #10;
        
        addr=0;
        #10;
        
        enb=0;
        #100;
        
        enb=1;
        addr=6;
        #10;
        
        addr=2;
        #10;
        
        #1000; $finish;
     end
endmodule
