`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Slow Clock 
//adapted from: Rice Rodriguez 
//  https://github.com/ricerodriguez/ttu-lab1-code-examples/tree/master/part1-clocks-and-counters
module SlowClock(
    input CLK,
    input reset,
    output [1:0]digit_refresh 
    
);
    reg [20:0] refresh_counter; //refresh counter, used to refresh display
                                // The first 19 bits are for creating 190Hz refresh rate
                                // The other 2 bits are for creating 4 LED-activating signals
initial refresh_counter <= 0;
   
        always @(posedge CLK)
        
        begin 
            if(reset==1)
                
                refresh_counter <= 0;
            else
            
                refresh_counter <= refresh_counter + 1;
                
    end 
            assign digit_refresh = refresh_counter[20:19]; // Last 2 bits used to refresh display
                                                           // (100 x 10^6)/(2^19) = 190 Hz, 5.24 ms to change display
           
 endmodule