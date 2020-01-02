
`timescale 1ns/1ns
module ALU #(parameter integer n)(in0, in1, ALUop, out, zero);
  
  input [n-1:0] in0,in1;
  input [3:0] ALUop;
  output reg [n-1:0] out;
  output zero;
  reg [n-1:0] hi, lo;
  assign zero = ~|{out};

  always@(in0, in1, ALUop) begin
    out <= {n{1'b0}};
    case (ALUop)
        4'b0000: out <= in0 + in1;
        4'b0001: out <= in0 - in1;
        4'b0010: out <= in0 & in1;
        4'b0011: out <= in0 | in1;
        4'b0100: out <= in0 ^ in1;
        4'b0101: {hi, lo} <= in0 * in1;
        4'b0110: out <= lo;
        4'b0111: out <= hi;
        4'b1000: begin 
          out <= in0 < in1;
        end
        default: out <= in0 + in1;
    endcase
  end
endmodule 
