
`timescale 1ns/1ns
module RegisterFile (
	input clk, rst, WriteEn, input [4:0] ReadAddr1, ReadAddr2, WriteAddr, input [31:0] WriteData, output [31:0] ReadData1, ReadData2
);
	reg [31:0] data [0:31];
	assign ReadData1 = data[ReadAddr1];
	assign ReadData2 = data[ReadAddr2];
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			for (integer i = 0; i <= 31; i++) begin
				data[i] <= {32{1'b0}};
			end
		end else begin
			data[WriteAddr] <= WriteEn ? WriteData : data[WriteAddr];
		end
	end
endmodule
