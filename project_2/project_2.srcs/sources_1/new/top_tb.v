`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
module top_tb ();
    wire [3:0] digits;
    wire [6:0] SEG;
    
    reg IN,CLK,reset;
//    wire Done;
initial begin
          CLK = 0;
          IN = 0;
          reset = 0;

          // Test frequency is 250 kHz
          forever #2000 IN = !IN;
     end
     // Clock is 100 MHz
     always #5 CLK = !CLK;
  top uut(
       .IN(IN),
       .CLK(CLK), 
       .reset(reset),
       .digits(digits),
       .SEG(SEG)); 

endmodule
