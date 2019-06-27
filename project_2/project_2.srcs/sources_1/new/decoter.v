`timescale 1ns / 1ps
//// Decoder Modu
//adapted from: Rice Rodriguez 
//  https://github.com/ricerodriguez/ttu-lab1-code-examples/tree/master/part1-clocks-and-count
module Decoder( 
    input [1:0]digit_refresh,
    input [15:0]BCD,
    output reg [3:0]digits,
    output reg [3:0]LED_BCD
);

initial begin
    digits <= 0;
    LED_BCD <= 0;
end 
 always @(*)

     begin
          case(digit_refresh)//digit_refresh is also called in slowclock
               2'b00: begin
                    digits = 4'b0111; // activate LED1 and Deactivate LED2, LED3, LED4
                    LED_BCD = BCD[15:12];  // the first digit of the 16-bit number
               end
               2'b01: begin
                    digits = 4'b1011;// activate LED2 and Deactivate LED1, LED3, LED4
                    LED_BCD = BCD[11:8]; // the second digit of the 16-bit number
               end
               2'b10: begin
                    digits = 4'b1101;// activate LED3 and Deactivate LED2, LED1, LED4                 
                    LED_BCD = BCD[7:4]; // the third digit of the 16-bit number
               end
               2'b11: begin
                    digits = 4'b1110; // activate LED4 and Deactivate LED2, LED3, LED1
                    LED_BCD = BCD[3:0]; // the fouth digit of the 16-bit number
               end
          endcase
     end
endmodule
