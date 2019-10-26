module Regression(input clk, rst, output [19:0] outB0, outB1, E);
    wire [19:0] x, y, B0, B1;
    wire EnCC, EnErr;
    DataLoader DL(clk, rst, x, y, EnCC, EnErr);
    Coefficient CC(clk, rst, EnCC, x, y, B0, B1);
    Error Err(clk, rst, EnErr, x, y, B0, B1, E);

    assign outB0 = B0;
    assign outB1 = B1;
endmodule