module RegressionTB();
    reg clk=0, rst=0;
    wire [19:0] outB0, outB1, E;
    Regression UUT(clk, rst, outB0, outB1, E);

    initial begin
        #20000;
        $stop;
    end

    // clock generator
	always begin 
		#10; clk <= ~clk;
	end
endmodule