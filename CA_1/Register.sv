`timescale 1ns/1ns
module Reg20bit(input clk, rst, ld0, ld, input [19:0] D, output reg [19:0] Q);
    always@(posedge clk, posedge rst)begin
        if(rst || ld0)
            Q <= 20'b0;
        else 
            Q <= ld ? D : Q;
    end
endmodule