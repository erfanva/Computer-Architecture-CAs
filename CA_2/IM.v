
`timescale 1ns/1ns
module IM (input [31:0] address, output [31:0] instruction);

	parameter integer l = 500;
	reg [31:0] ins [0:l-1];
	assign instruction = ins[address];

	initial begin
		for (int i = 0; i <= l; i++) begin
			ins[i] = 32'b0;
			// ins[i] = {6'b000001, 5'd1, 5'd1, 16'd255}; //addi R0, R1, 255
		end

		ins[4] = {6'b000001, 5'd1, 5'd1, 16'd255}; //addi R0, R1, 255
		ins[8] = {6'b000001, 5'd1, 5'd1, 16'd100}; //addi R0, R2, 100
		ins[12] = {6'b000000, 5'd1, 5'd2, 5'd3, 5'd0, 6'b000000}; //add r1, r2, r3

	end;
endmodule	
