
`timescale 1ns/1ns
module ALUController (input [5:0] func, input addi, subi, slti, output [3:0] ALUop);
//			4'b0000: out <= in0 + in1;
//         4'b0001: out <= in0 - in1;
//         4'b0010: out <= in0 & in1;
//         4'b0011: out <= in0 | in1;
//         4'b0100: out <= in0 ^ in1;
//         4'b0101: {hi, lo} <= in0 * in1;
//         4'b0110: out <= lo;
//         4'b0111: out <= hi;
//         4'b1000: slt
  assign ALUop = 	addi ? 4'b0000 : 
  					subi ? 4'b0001 :
  					slti ? 4'b1000 : func[3:0];
endmodule 

