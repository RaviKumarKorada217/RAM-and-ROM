`timescale 1ns / 1ps

module dual_port_ram_tb(  );
    reg [15:0] data1, data2;
    reg [19:0] addr1, addr2;
    reg we1, we2, clk;
    wire [15:0] out1, out2;
    
    dual_port_ram uut(  .data1(data1), .data2(data2), .addr1(addr1), .addr2(addr2),
                        .we1(we1), .we2(we2), .clk(clk), .out1(out1), .out2(out2));
                        
    always #5 clk=~clk;
    initial begin
    clk=0;
    we1=1; we2=1;
    
    data1=16'habaa; addr1=20'd1;
    data2=16'h1222; addr2=20'd2;
    #10;
    
    data1=16'hffff; addr1=20'd3;
    data2=16'h1122; addr2=20'd4;
    #10;
    
    data1=16'h1234; addr1=20'd5;
    data2=16'h0000; addr2=20'd6;
    #10;
    
    we2=0;
    data1=16'h8787; addr1=20'd7;
    addr2=20'd5;
    #10;
    
    we2=0;
    data1=16'h8787; addr1=20'd7;
    addr2=20'd5;
    #10;
        
    we1=0;
    addr1=20'd1;
    addr2=20'd2;
    #10;
    
    addr1=20'd3;
    addr2=20'd4;
    #10;
    
    we1=1;
    data1=16'hffff; addr1=20'd1;
    #10;
    
    #1000; $finish;
    end
endmodule
