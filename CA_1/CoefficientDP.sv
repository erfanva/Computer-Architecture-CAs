`timescale 1ns/1ns
module CoefficientDP(input clk, rst, 
    ld0xy, ldxy, ld0x2, ldx2, ld0x, ldx, ld0y, ldy, 
    ldxbar, ldybar, 
    ldB1, ldB0,
    ld1cnt, inccnt, input [19:0] x, y, output [19:0] B0out, B1out);

    wire [19:0] sumxyreg, sumxy, sumx2reg, sumx2, sumxreg, sumx, sumyreg, sumy, xy, x2,
                xbar, xbarreg, ybar, ybarreg, xbarsumx, xbarsumy, SSxx, SSxy, B1, B0, b1xbar;

    reg [7:0] n;

    always@(posedge clk, posedge rst) begin
        if(rst)
            n <= 8'b0;
        else begin
            if(ld1cnt) 
                n <= 8'b00000001;
            else 
                n <= inccnt ? n + 1 : n;
        end
    end

    // xy
    Multiplier mulxy(x, y, xy);
    AddOrSub addsumxy(xy, sumxyreg, 1'b1, sumxy);
    Reg20bit regsumxy(clk, rst, ld0xy, ldxy, sumxy, sumxyreg);

    // x2
    Multiplier mulx2(x, x, x2);
    AddOrSub addsumx2(x2, sumx2reg, 1'b1, sumx2);
    Reg20bit regsumx2(clk, rst, ld0x2, ldx2, sumx2, sumx2reg);

    // x
    AddOrSub addsumx(x, sumxreg, 1'b1, sumx);
    Reg20bit regsumx(clk, rst, ld0x, ldx, sumx, sumxreg);

    // y
    AddOrSub addsumy(y, sumyreg, 1'b1, sumy);
    Reg20bit regsumy(clk, rst, ld0y, ldy, sumy, sumyreg);

    // xbar
    Divider dividxbar(x, {2'b0, n, 10'b0}, xbar);
    Reg20bit regxbar(clk, rst, 1'b0, ldxbar, xbar, xbarreg);

    // ybar
    Divider dividybar(y, {2'b0, n, 10'b0}, ybar);
    Reg20bit regybar(clk, rst, 1'b0, ldybar, ybar, ybarreg);

    // n xbar2
    Multiplier mulxbarsumx(sumx, xbar, xbarsumx);

    // n xbar ybar
    Multiplier mulxbarsumy(xbar, sumy, xbarsumy);

    // SSxx
    AddOrSub subssxx(sumx2, xbarsumx, 1'b0, SSxx);

    // SSxy
    AddOrSub subssxy(sumxy, xbarsumy, 1'b0, SSxy);

    // B1
    Divider dividB1(SSxy, SSxx, B1);
    Reg20bit regB1(clk, rst, 1'b0, ldB1, B1, B1out);

    // B0
    Multiplier mulB1xbar(B1, xbar, b1xbar);
    AddOrSub subB0(ybar, b1xbar, 1'b0, B0);
    Reg20bit regB0(clk, rst, 1'b0, ldB0, B0, B0out);

endmodule