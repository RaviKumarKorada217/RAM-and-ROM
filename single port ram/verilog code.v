`timescale 1ns / 1ps
// 8*64 bit RAM
module single_port_ram(
    input [7:0] data, //data input
    input [5:0] addr, //address
    input we,    //write enable
    input clk,   // clock
    output [7:0] out  //output
    );
    
    reg [7:0]ram[63:0]; //64 memory locations, requires 6-address lines to represent the location and each location has 8 bit of data
    reg [5:0]addr_reg; //address register
    
    always@(posedge clk)
        begin
         if(we)
            ram[addr]<=data;
         else
            addr_reg <= addr;
        end
    assign out=ram[addr_reg];
endmodule
