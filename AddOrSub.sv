`timescale 1ns/1ns
module AddOrSub(input [19:0] X, Y, input AOrS, output [19:0] W);
    assign W = AOrS ? X + Y : X - Y;
endmodule