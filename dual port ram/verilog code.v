`timescale 1ns / 1ps
//16-data lines and 20-address lines
//16*1024 RAM
module dual_port_ram(
    input [15:0]data1, data2, //input data
    input [19:0]addr1, addr2, //addresses
    input we1, we2, //write enables
    input clk, //clock
    output reg[15:0]out1, out2 //output
    );
    
    reg [15:0]ram[1023:0]; // 1024 memory locations, so we require 20 address lines to represent the 1024 locations and each location has 16-bit data
    
    always@(posedge clk)
        if(we1)
            ram[addr1]<=data1;
        else
            out1<=ram[addr1];
   
   always@(posedge clk)
        if(we2)
            ram[addr2]<=data2;
        else
            out2<=ram[addr2]; 
endmodule
