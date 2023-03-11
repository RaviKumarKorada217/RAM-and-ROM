`timescale 1ns / 1ps

module single_port_ram_tb(   );
    reg [7:0]data;
    reg [5:0]addr;
    reg we, clk;
    wire [7:0]out;
    
    single_port_ram uut ( .data(data), .addr(addr), .we(we), .clk(clk), .out(out));
    
    always #5 clk=~clk;
    initial
    begin
        clk=0;
        we=1;
        
        data=8'ha1;
        addr=6'd1;
        #10;
        
        data=8'hb2;
        addr=6'd2;
        #10;
        
        data=8'hc3;
        addr=6'd3;
        #10;
        
        we=0;
        addr=6'd2;
        #10;
        
        addr=6'd1;
        #10;
        
        we=1;
        data=8'hdf;
        addr=6'd50;
        #10;
        
        data=8'hee;
        addr=6'd51;
        #10;
        
        we=0;
        addr=6'd50;
    
    #1000; $finish;
    end
    
endmodule
