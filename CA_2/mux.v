
`timescale 1ns/1ns
module MUX #(parameter integer n)(in0,in1,sel,out);
  input [n-1:0] in0,in1;
  input sel;
  output [n-1:0] out;
  assign out = sel? in1: in0;
endmodule 