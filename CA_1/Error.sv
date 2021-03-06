
`timescale 1ns/1ns
module Error(input clk, rst, En, input [19:0] x, y, B0, B1, output [19:0] E);
    wire [19:0] B1x, ysubB0;
    Multiplier mulb1x(x, B1, B1x);
    AddOrSub sub0(y, B0, 1'b0, ysubB0);
    AddOrSub sub1(ysubB0, B1x, 1'b0, E);
endmodule
