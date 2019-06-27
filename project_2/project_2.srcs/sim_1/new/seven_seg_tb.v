`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//adapted from: Rice Rodriguez 
//https://github.com/ricerodriguez/ttu-lab1-code-examples/tree/master/part1-clocks-and-count
module Test_BCD_to_SevenSeg();

reg [3:0]disp_out;//Inputs
wire [6:0]SEG;//Outputs

//Instantiate
BCD_to_SevenSeg uut(
    .disp_out(disp_out),
    .SEG(SEG)
);

      initial begin//begin test
            #50 disp_out = 4'b0011; //Should output led arrangement for 3 (7'b0110000)
            #50 disp_out = 4'b0001; //Should output led arrangement for 1 (7'b1000000)
            #50 disp_out = 4'b1000; //Should output led arrangement for 8  (7'b0000000)
            #50 disp_out = 4'b0010; //Should output led arrangement for 2  (7'b0100100)
      end
      
endmodule
