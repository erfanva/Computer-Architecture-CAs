module Coefficient(input clk, rst, En, input [19:0] x, y, output [19:0] B0, B1);
    wire ld0xy, ldxy, ld0x2, ldx2, ld0x, ldx, ld0y, ldy, 
        ldxbar, ldybar, 
        ldB1, ldB0,
        ld1cnt, inccnt;

    CoefficientCU CU(clk, rst, En, ld0xy, ldxy, ld0x2, ldx2, ld0x, ldx, ld0y, ldy, 
        ldxbar, ldybar, 
        ldB1, ldB0,
        ld1cnt, inccnt);

    CoefficientDP DP(clk, rst, 
        ld0xy, ldxy, ld0x2, ldx2, ld0x, ldx, ld0y, ldy, 
        ldxbar, ldybar, 
        ldB1, ldB0,
        ld1cnt, inccnt, x, y, B0, B1);
endmodule