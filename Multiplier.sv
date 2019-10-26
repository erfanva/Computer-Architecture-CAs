module Multiplier(input [19:0] X, Y, output [19:0] W);
    wire [39:0] temp;
    assign temp = X * Y;
    assign #10 W = temp[29:10];
endmodule