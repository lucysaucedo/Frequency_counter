`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Frequency Counter Testbench Module
//adapted from: Rice Rodriguez 
//  https://github.com/ricerodriguez/ttu-lab1-code-examples/tree/master/part1-clocks-and-counters
// ============================================================================
module freq_counter_tb();
     wire [19:0] freq;
     reg CLK, IN, enable;
     wire done;
     initial begin //initialize registers 
          CLK = 0;
          IN = 0;
          enable = 1; //enable the timer
          // Test frequency is 250 kHz
          forever #2000 IN = !IN;
     end

     // Clock is 100 MHz
     always #5 CLK = !CLK;

     freq_counter tb1(
          .CLK(CLK),
          .enable(enable),
          .IN(IN),
          .freq(freq),
          .done(done)
          );

endmodule