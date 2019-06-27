`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//adapted from: Rice Rodriguez 
//https://github.com/ricerodriguez/ttu-lab1-code-examples/tree/master/part1-clocks-and-count
//////////////////////////////////////////////////////////////////////////////////

module BCD_to_SevenSeg(
    input [3:0] disp_out,  // Output to display
    output reg [6:0]SEG   // 7 segment display
    );

initial SEG <= 0;
    always@(*)
        begin
          case(disp_out)  // Cathode patterns of the 7-segment LED display
                       4'b0000: SEG = 7'b1000000; // "0"
                       4'b0001: SEG = 7'b1111001; // "1"
                       4'b0010: SEG = 7'b0100100; // "2"
                       4'b0011: SEG = 7'b0110000; // "3"
                       4'b0100: SEG = 7'b0011001; // "4"
                       4'b0101: SEG = 7'b0010010; // "5"
                       4'b0110: SEG = 7'b0000010; // "6"
                       4'b0111: SEG = 7'b1111000; // "7"
                       4'b1000: SEG = 7'b0000000; // "8"
                       4'b1001: SEG = 7'b0011000; // "9"
                       default: SEG = 7'b1000000; // "0"
          endcase
end

endmodule