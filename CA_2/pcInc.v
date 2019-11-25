  
`timescale 1ns/1ns
module ALU #(parameter integer n)(in0,in1,ALUop,out,zero);
  
  input [n:0] in0,in1;
  input [2:0] ALUop;
  output [n:0] out;
  always@(in0, in1, ALUop) begin
    case (ALUop)
        3'b000: out = in0 + in1;
        3'b001: out = in0 - in1;
        3'b010: out = in0 + in1;
        3'b011: out = in0 + in1;
        3'b100: out = in0 & in1;
        3'b101: out = in0 | in1;
        3'b110: out = in0 ^ in1;
        3'b111: out = in0 * in1;
    endcase
  end
endmodule 

