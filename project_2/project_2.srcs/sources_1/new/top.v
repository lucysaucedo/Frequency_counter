`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top(
    input IN,
    input CLK, 
    input reset,
    output [3:0]digits,
    output [6:0]SEG 
);

    wire [11:0]bnum;
    wire [1:0] digit_refresh;
    wire [15:0] BCD;
    wire [3:0] LED_BCD;
    wire enable;
    assign enable = 1;
//refering to test benches or modules.
    SlowClock u3(
            .CLK(CLK),
            .reset(reset),
            .digit_refresh(digit_refresh)
            );
    
    freq_counter u1(
            .CLK(CLK),
            .IN(IN),
            .freq(bnum),
            .enable(enable)
            );

    Binary_To_BCD u5(
            .bnum(bnum),
            .thousands(BCD[15:12]),
            .hundreds(BCD[11:8]),
            .tens(BCD[7:5]),
            .ones(BCD[4:0]) 
            );

    Decoder u8(
            .digit_refresh(digit_refresh),
            .BCD(BCD),
            .digits(digits),
            .LED_BCD(LED_BCD)
            );
    
    BCD_to_SevenSeg u9(
            .disp_out(LED_BCD),
            .SEG(SEG)
    );
    
endmodule