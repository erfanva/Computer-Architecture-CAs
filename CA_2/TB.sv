
`timescale 1ns/1ns
module TB();
  reg rst,clk=0;
  MIPS UUT(clk,rst);
  always #100 clk=~clk;
  initial begin
    // rst=0;
    // #200
    rst=1;
    #200
    rst=0;
    #10000;
    $stop;
  end
endmodule 
