
`timescale 1ns/1ns
module pc #(parameter integer n)(
	input clk, rst, input [n-1:0] in, output reg [n-1:0] out	
);
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			out <= {n{1'b0}};
		end else begin
			out <= in;
		end
	end
endmodule
