`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////

module Binary_To_BCD_tb();

	reg [11:0] bnum;   // 125 7d
	wire [3:0] thousands;
    wire [3:0] hundreds;
    wire [3:0] tens;
    wire [3:0] ones;
    //wire [15:0] BCD;
    
    initial begin 
        bnum <= 50;
     end 
	
	Binary_To_BCD uut(
		 .bnum(bnum),
		 .thousands(thousands),
         .hundreds(hundreds),
         .tens(tens),
         .ones(ones) 
		//.BCD(BCD)
	);
      
endmodule