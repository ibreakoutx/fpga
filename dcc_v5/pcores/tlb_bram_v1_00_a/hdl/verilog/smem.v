`timescale 1ns/1ns

//-----------------------------------------------------------
//Single port RAM
//Tested by synthesizing using Xilinx XST, BLOCKRAM inferred
//----------------------------------------------------------

module smem (/*AUTOARG*/
   // Outputs
   dout,
   // Inputs
   clk, din, addr, wr
   ) ;

   parameter dwidth = 32 ;//data bus width
   parameter awidth = 11 ;//addr bus width, 2K
   parameter size   = 2048 ;//Size of memory array
   
   input clk ;
   
   input [ dwidth-1 : 0] din ;
   input [ awidth-1 : 0] addr ;
   input 		 wr ;
   
   output [ dwidth-1 : 0] dout ;

   wire [ dwidth-1 : 0]  din ;   
   reg  [dwidth-1 : 0]   mem [ size-1:0 ] ;
   reg  [dwidth-1 : 0] 	 dout ;
   
   always @(posedge clk)
     if (wr === 1'b1)
       mem[addr] <= din ;
     else
       dout <= mem[addr];

endmodule
   
