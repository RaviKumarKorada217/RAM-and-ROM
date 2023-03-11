`timescale 1ns / 1ps
//8*8 bit rom
module rom(
    input clk, enb,
    input [2:0]addr,
    output reg [7:0]out
    );
    
    reg[7:0]rom[7:0]; //8 memory locations each having 8-bit data, so it requires 3-address lines to represent
    
    always@(posedge clk)
    begin
    if(enb)
        out<=rom[addr];
    else
        out<=8'hxx;
    end
    
    initial begin
        rom[0]=8'h01;
        rom[1]=8'haa;
        rom[2]=8'h54;
        rom[3]=8'hfa;
        rom[4]=8'he5;
        rom[5]=8'h98;
        rom[6]=8'h56;
        rom[7]=8'h34;
    end
endmodule
