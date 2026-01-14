`timescale 1ns / 1ps
module tb( );
 reg rst, clk, j, k;
 wire q;
 
 //instanciate the module 
 dut Z(.rst(rst), .clk(clk), .j(j), .k(k), .q(q));
 
 initial begin
  clk = 0;
  forever #5 clk = ~clk;
 end
 
 initial begin
 rst = 0; j = 0; k = 0;
 $monitor("%0t j=%0b k=%0b  q=%0b", $time, j, k, q);
 rst = 1;
 repeat (10) begin
  #10 {j,k} = {j,k} + 1;
 end
 $finish;
 end 
endmodule
