`timescale 1ns / 1ps

// 8*64 on chip dual address rom with two stage pipelining
module dual_address_rom_two_stage_pipeline( clk, addr1, addr2, dout1, dout2 );
    input clk;
    input [2:0] addr1, addr2;
    output [63:0] dout1, dout2;
    
    reg [63:0]ROM[7:0];    // actual ROM
    reg [63:0] dout1_next, dout2_next; // next output values
    reg [63:0] dout1_reg1, dout2_reg1; // Fist pipeline registers
    reg [63:0] dout1, dout2; // second pipeline registers
    
    wire [63:0]loc[7:0];
    
    //ROM data loading....
    assign loc[0] = 64'h5B5B5B5B5B5B5B5B;
    assign loc[1] = 64'hAE6A4719E7B99682 ; 
    assign loc[2] = 64'h7631CF8A8ACF3176 ; 
    assign loc[3] = 64'h8AE782B9477E1996 ; 
    assign loc[4] = 64'h5BA5A55B5BA5A55B ; 
    assign loc[5] = 64'h4782196A96E77EB9 ; 
    assign loc[6] = 64'h918A76CFCF768A31 ; 
    assign loc[7] = 64'h19B96A827E9647E7 ; 
    
    always@( loc[0],loc[1],loc[2],loc[3],loc[4],loc[5],loc[6],loc[7], addr1, addr2 ) begin
        case(addr1)
            3'b000 : dout1_next=loc[0];
            3'b001 : dout1_next=loc[1];
            3'b010 : dout1_next=loc[2];
            3'b011 : dout1_next=loc[3];
            3'b100 : dout1_next=loc[4];
            3'b101 : dout1_next=loc[5];
            3'b110 : dout1_next=loc[6];
            3'b111 : dout1_next=loc[7];
            default: dout1_next=64'hz;
        endcase
        case(addr2)
            3'b000 : dout2_next=loc[0];
            3'b001 : dout2_next=loc[1];
            3'b010 : dout2_next=loc[2];
            3'b011 : dout2_next=loc[3];
            3'b100 : dout2_next=loc[4];
            3'b101 : dout2_next=loc[5];
            3'b110 : dout2_next=loc[6];
            3'b111 : dout2_next=loc[7];
            default: dout2_next=64'hz;
        endcase
    end
    
    //First pipelining
    always@(posedge clk) begin
        dout1_reg1<=dout1_next;
        dout2_reg1<=dout2_next;
    end
    
    //Second pipelining
    always@(posedge clk) begin
        dout1<=dout1_reg1;
        dout2<=dout2_reg1;
    end
endmodule
