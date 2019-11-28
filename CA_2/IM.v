
`timescale 1ns/1ns
module IM (input [31:0] address, output [31:0] instruction);

	parameter integer l = 500;
	reg [l-1:0][31:0] ins;
	assign instruction = ins[address];
endmodule	
