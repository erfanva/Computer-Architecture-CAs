module Divider(input [19:0] X, Y, output [19:0] W);
    assign #10 W = (X / (Y >> 5)) << 5;
endmodule