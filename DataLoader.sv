
module DataLoader(input clk, rst, output [19:0] x, y, output EnCC, EnErr);
    wire [7:0] cnt;

    DataLoaderCU CU(clk, rst, EnCC, EnErr, cnt);
    DataLoaderDP DP(clk, rst, cnt, x, y);
endmodule