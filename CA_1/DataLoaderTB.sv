
`timescale 1ns/1ns
module DataLoaderTB ();
	logic clk=0, rst=0;
	wire EnCC, EnErr;
	wire[19:0] x, y;

    DataLoader UUT(clk, rst, x, y, EnCC, EnErr);

    initial begin
        #10000;
		$stop;
	end

	// clock generator
	always begin 
		#10; clk <= ~clk;
	end
endmodule
