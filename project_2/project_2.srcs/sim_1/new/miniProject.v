`timescale 1ns / 1ps
//// Frequency Counter  Module
//adapted from: Rice Rodriguez 
//  https://github.com/ricerodriguez/ttu-l ab1-code-examples/tree/master/part1-clocks-and-count
//////////////////////////////////////////////////////////////////////////////////
module freq_counter(
     // These are my inputs
     input CLK,          // 100 MHz clock signal from the Basys3 oscillator
     input enable,       // Enable bit to turn this module on from another module
     input IN,           // The signal we're counting the frequency of
     // These are my outputs 
     output reg [11:0] freq = 12'b0,    // frequency we found for the input signal
     output reg done = 0);              // Done flag = finished counting the frequency of the signal

     reg[31:0] count = 32'b0;   //Count = positive clock we've seen it will hold the number of positive edge counter, meaning we will 
                                //know how much time has passed by. 
     reg [11:0] edge_count = 12'b0; //edge_count = this will hold the positive edge counter of the input signal
                                    //This will help us count how many signal cycles have passed, 
                                    //by knowing how many cycles have passed.
     reg last = 0; //This is a register for our D Flip-Flop, we need a D Flip-Flop 
                    //because out input sinal can either be high or low. 
                    //therefore we need to store our input signal and 
                    //compare the last known state signal to the current state.
                    //In a D Flip-Flop this is your Q output
                    //how am I getting the frequency?

     // 100 million / 16 = 625k
     localparam max = 'd6250000; //specific dimensions of a vector. 

     
     always @(posedge CLK)
          last <= IN; 
                        // Flip-flop stores last value in register. We'll be using this to detect
                        // the positive edges of the incoming signal

     always @ (posedge CLK) //Using always lets the @(expression) will 
                            //prevent from unnecessarily using the clock.
          if(~enable) begin 
               freq = 0;
               edge_count = 0;
               count = 0;
               done = 0;
          end
          else begin
               if (count < max)
               begin
                    count <= count + 1;
                              // If value was 0 and is now 1, positive edge detected. 
                    if(~last & IN)
                         edge_count <= edge_count + 1; //new edge count will be incremented by 1
               end
               else begin
                    freq = 0; // Reset the frequency variable
                    
                    freq = edge_count * 16; // Multiply the value counted so far by 16 because it's only
                                            // been 1/16th of a second so far
                    
                    edge_count = 0; // Reset the edge count
                    
                    count = 0; // Reset the 1/16th second counter
                    done = 1; // We're done, so set the flag on
               end
               end
endmodule
