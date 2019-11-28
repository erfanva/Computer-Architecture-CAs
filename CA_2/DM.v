
`timescale 1ns/1ns
module DM (
	input clk, rst, MemRead, MemWrite, input [31:0] address, WriteData, output [31:0] ReadData
);
	parameter integer l = 500;
	reg [31:0] data [0:l-1];
	assign ReadData = data[address];


	always @(posedge clk, posedge rst) begin
		if(rst) begin
			for (int i = 0; i <= l; i++) begin
				data[i] <= 32'b0;
			end
		end else begin
			data[address] <= MemWrite ? WriteData : data[address];
		end
	end
endmodule
