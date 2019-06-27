`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//adapted from: Rice Rodriguez 
//https://github.com/ricerodriguez/ttu-lab1-code-examples/tree/master/part1-clocks-and-count
//////////////////////////////////////////////////////////////////////////////////
module slowclock_tb();
    wire [1:0] digit_refresh;
    reg  CLK, reset, IN; 
    
    initial begin
          CLK = 0;
          IN = 0;
          reset = 0;

          // Test frequency is 250 kHz
          forever #2000 IN = !IN;
     end

     // Clock is 100 MHz
     always #5 CLK = !CLK;
      SlowClock uut(
        .CLK(CLK),
        .reset(reset),
        .digit_refresh(digit_refresh));

endmodule
