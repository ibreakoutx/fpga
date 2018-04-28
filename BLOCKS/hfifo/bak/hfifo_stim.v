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
module hfifo_stim( SYSTEM_CLOCK, reset , LED_0,LED_1,LED_2,LED_3);

input SYSTEM_CLOCK ;
input reset ;
output LED_0 ;
output LED_1 ;
output LED_2 ;
output LED_3 ;

reg [3:0] count ;
reg [3:0] din ;
wire [3:0] dout ;
reg push ;
reg pop ;
wire rdy ;
wire not_full ;

assign LED_0 = dout[0] ;
assign LED_1 = dout[1] ;
assign LED_2 = dout[2] ;
assign LED_3 = dout[3] ;

hfifo dut ( .push(push),
				.pop(pop),
				.rdy(rdy),
				.not_full(not_full),
				.clk(SYSTEM_CLOCK),
				.reset(reset),
				.din(din),
				.dout(dout)
				);

//Divide by 100,000,000 clk enable
reg clk_enable ;
reg [27:0] div_count ;
always @(posedge SYSTEM_CLOCK or posedge reset)
	if (reset)
	begin
		div_count <= 0;
		clk_enable <= 0 ;
	end
	else
	begin
		clk_enable <= 0 ;
		div_count <= div_count+1 ;
		if (div_count == 28'd1000000000) 
			begin
				clk_enable <= 1;
				div_count <= 0 ;
			end
	end


always @(posedge SYSTEM_CLOCK or posedge reset )
	if (reset)
		begin
			count <= 0 ;
			push <= 0;
			pop <= 0;
		end
	else
		begin
			push <= 0 ;
			pop <= 0;
		if (clk_enable)

			if ( not_full ) 
				begin
					din <= count ;
					count <= count + 1 ;
					push <= 1;
				end

			if (rdy)
				pop <= 1 ;
 		end

endmodule
