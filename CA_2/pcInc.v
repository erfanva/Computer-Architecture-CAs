  
`timescale 1ns/1ns
module pcInc #(parameter integer n)(pcin,pcout);
  input [n-1:0] pcin;
  output [n-1:0] pcout;
  assign pcout = pcin + 4; 
endmodule 