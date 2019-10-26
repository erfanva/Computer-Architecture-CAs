
module DividerTB ();
	logic [19:0] x = 20'b01000000000000000000, y = 20'b10000000000000000000;
    wire [19:0] W;
    Divider UUT(x, y, W);

    initial begin
        #10000;
		$stop;
	end
endmodule

