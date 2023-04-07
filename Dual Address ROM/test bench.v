`timescale 1ns / 1ps

module dual_address_rom_two_stage_pipeline_tb( );
    reg clk;
    reg [2:0] addr1, addr2;
    wire [63:0] dout1, dout2;
    
    dual_address_rom_two_stage_pipeline dut (.clk(clk), .addr1(addr1), .addr2(addr2), .dout1(dout1), .dout2(dout2));
    
    always #5 clk=~clk;
    initial begin
        clk=0; 
        #100;
        
        addr1=3;
        addr2=6;
        #10;
        
        addr1=5;
        addr2=4;
        #10;
        
        addr1=2;
        addr2=1;
        #10;
        
        addr1=7;
        addr2=0;
        #10;
        
        addr1=0;
        addr2=2;
        #10;
       
        #100;
        
        addr1=6;
        addr2=3;
        #10;
        
        addr1=2;
        addr2=2;
        #10;
        
        #1000; $finish;
     end
endmodule
