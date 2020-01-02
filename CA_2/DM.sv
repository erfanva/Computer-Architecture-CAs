
`timescale 1ns/1ns
module DM (
	input clk, rst, MemRead, MemWrite, input [31:0] address, WriteData, output [31:0] ReadData
);
	parameter integer l = 500;
	reg [31:0] data [0:5000];
	assign ReadData = data[address];


	always @(posedge clk, posedge rst) begin
		if(rst) begin
			for (int i = 1000; i <= 1080; i = i + 4) begin
				data[i] <= (i-1000)/4;
			end
			for (int i = 2000; i <= 2040; i = i + 4) begin
				data[i] <= (i-2000)/4;
			end
		end else begin
			data[address] <= MemWrite ? WriteData : data[address];
		end
	end
endmodule
