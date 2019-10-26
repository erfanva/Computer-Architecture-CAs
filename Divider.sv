module Divider(input [19:0] X, Y, output [19:0] W);
    assign W = (X / (Y >> 5)) << 5;
endmodule