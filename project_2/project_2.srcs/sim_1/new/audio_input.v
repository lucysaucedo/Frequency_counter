`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/27/2019 02:05:17 PM
// Design Name: 
// Module Name: audio_input
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module audio_input(
input [11:0] freq,
output [1:0] flag
);

assign flag = ((freq >= 400) && (freq <= 600)) ? 2'd1 : 
              ((freq >= 900) && (freq <= 1100)) ? 2'd2 :
              ((freq >= 1300) && (freq <= 1700)) ? 2'd3 : 2'd0;

endmodule
