`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Binary_To_BCD(
    input CLK,
     input  [11:0] bnum, 
     output reg [3:0] thousands,
     output reg [3:0] hundreds,
     output reg [3:0] tens,
     output reg [3:0] ones
     );

    reg [27:0] shift; //16 bits from 4 bits for each decimal place, 
                      // 12 input into binary. 

integer i; //For Loop

     always @(bnum)//parameters
     begin
          thousands = 4'b0;//amount of bits ' b zero
          hundreds = 4'b0;
          tens = 4'b0;
          ones = 4'b0;

          shift = 0;
          shift[11:0] = bnum; //moving number to shift register

          for (i = 0; i < 12; i = i + 1) //create a for loop, convert digits to BCD, 
                                         //maximum value in BCD 
          begin
               if (shift[15:12] >= 5) 
                    shift[15:12] = shift[15:12] + 3;//ones

               if (shift[19:16] >= 5)
                    shift[19:16] = shift[19:16] + 3;//tens

               if (shift[23:20] >= 5)
                    shift[23:20] = shift[23:20] + 3;//hundreds

               if (shift[27:24] >= 5)
                    shift[27:24] = shift[27:24] + 3; //thousands 

               shift = shift << 1;

          end

          thousands = shift[27:24];
          hundreds  = shift[23:20];
          tens      = shift[19:16];
          ones      = shift[15:12];
          
     end
endmodule
