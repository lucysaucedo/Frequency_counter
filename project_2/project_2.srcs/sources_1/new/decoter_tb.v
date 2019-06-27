`timescale 1ns / 1ps
//// Decoter Test Bench Module
//adapted from: Rice Rodriguez 
//  https://github.com/ricerodriguez/ttu-lab1-code-examples/tree/master/part1-clocks-and-count
module decoder_tb();
     reg [1:0]digit_refresh;
//     reg [15:0] BCD = 16'b0001001000110100; // 1234 binary string.
     reg [15:0] BCD = {4'd1,4'd2, 4'd3, 4'd4};
     wire [3:0] LED_BCD;
     wire [3:0]digits;

 Decoder uut(
     .digit_refresh(digit_refresh),
     .BCD(BCD),
     .LED_BCD(LED_BCD),
     .digits(digits)
 
 );
  
 initial begin
        #100 //Will delay or slow down number before each execution.
        digit_refresh = 'b00;
//        #10 digit_refresh = 'b01;
//        #10 digit_refresh = 'b10;
//        #10 digit_refresh = 'b11;
    repeat (4)
        begin
            #10 digit_refresh <= digit_refresh + 1;
        end
     end
     
 endmodule
