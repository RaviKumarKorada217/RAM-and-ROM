`timescale 1ns / 1ps

module single_address_rom_tb( );
    reg clk;
    reg [5:0]addr;
    wire [7:0]dout;
    
    single_address_rom uut ( .clk(clk), .addr(addr), .dout(dout));
    
    always #5 clk = ~clk;
    initial begin
        clk=0;
        repeat(40) #10 addr=$random();
        
        #1000; $finish();
    end
endmodule
