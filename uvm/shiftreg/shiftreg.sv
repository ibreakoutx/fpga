
module shiftreg #(
		  parameter int width=8
)
( input clk,rst,
  input [width-1:0] din,
  input valid_in,
  output logic [width-1:0] dout,
  output logic  valid_out
  );

   logic [width:0] sreg[0:3];
   
   always @(posedge clk)
   if (rst)
     for (int i=0;i<4;i=i+1)
       sreg[i] <= 'b0;
   else
     begin
	sreg[0] <= {valid_in,din};
	  
	for (int i=0;i<3;i=i+1)
	  sreg[i+1] <= sreg[i];
	
	{valid_out,dout} <= sreg[3];
     end
	  
endmodule // shiftreg
