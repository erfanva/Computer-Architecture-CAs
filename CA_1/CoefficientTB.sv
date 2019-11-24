
`timescale 1ns/1ns
module CoefficientTB();
    reg clk=0, rst=0;

    wire [19:0] x, y, B0, B1;
    wire EnCC, EnErr;
    DataLoader DL(clk, rst, x, y, EnCC, EnErr);
    Coefficient CC(clk, rst, EnCC, x, y, B0, B1);
    // Error Err(clk, rst, EnErr, x, y, B0, B1, E);

    initial begin
        rst = 1;
        #50;
        rst = 0;
        #20000;
        $stop;
    end

    // clock generator
	always begin 
		#50; clk <= ~clk;
	end
endmodule