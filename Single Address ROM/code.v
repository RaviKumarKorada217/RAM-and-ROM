`timescale 1ns / 1ps
/* 8*64 Bit ROM 
   Here, there are 8 memory locations, each memory location has 8 bytes of data
   Now, the required output data is 1byte out of these 64 bytes of data
*/
module single_address_rom( clk, addr, dout );
    input clk;
    input [5:0]addr;
    output reg [7:0]dout;
    
    reg [63:0] MEM[7:0];
    reg [7:0] byte_data[7:0];
    
    wire [7:0] d_next;
    wire [63:0] mem_data;
    
    wire [63:0] loc[7:0];
    
    //Data assigning..
    assign loc[0] = 64'hFF806C5D4F4C473C ; 
    assign loc[1] = 64'h80805D554C473C37 ; 
    assign loc[2] = 64'h6C5D4F4C473C3C36 ; 
    assign loc[3] = 64'h5D5D4F4C473C3733 ; 
    assign loc[4] = 64'h5D4F4C47403B332B ; 
    assign loc[5] = 64'h4F4C47403B332B23 ; 
    assign loc[6] = 64'h4F4C473C362D251E ; 
    assign loc[7] = 64'h4C473B362D251E19 ;
    
    always@(loc[0],loc[1],loc[2],loc[3],loc[4],loc[5],loc[6],loc[7])
    begin
        MEM[0]=loc[0];
        MEM[1]=loc[1];
        MEM[2]=loc[2];
        MEM[3]=loc[3];
        MEM[4]=loc[4];
        MEM[5]=loc[5];
        MEM[6]=loc[6];
        MEM[7]=loc[7];
    end
    
    always@(mem_data)
    begin
        byte_data[0]=mem_data[63:56];
        byte_data[1]=mem_data[55:48];
        byte_data[2]=mem_data[47:40];
        byte_data[3]=mem_data[39:32];
        byte_data[4]=mem_data[31:24];
        byte_data[5]=mem_data[23:16];
        byte_data[6]=mem_data[15:8];
        byte_data[7]=mem_data[7:0];
    end
    
    assign mem_data = MEM[addr[5:3]];
    assign d_next = byte_data[addr[2:0]];
    
    always@(posedge clk)
    begin
        dout = d_next; 
    end
endmodule
