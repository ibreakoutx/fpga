`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:    11:43:46 05/30/05
// Design Name:    
// Module Name:    hfifo_stim
// Project Name:   
// Target Device:  
// Tool versions:  
// Description:
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module hfifo_stim_test ;

reg clk ;
reg reset ;

initial
 begin
   clk = 0 ;
   reset = 0 ;
   #15 reset = 1 ;
   #150 reset = 0 ;
 end

always
  #5 clk = ~clk ;

hfifo_stim stim ( .SYSTEM_CLOCK(clk), 
		  .reset(reset));

endmodule
