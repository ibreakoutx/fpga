`include "timescale.v"
/*
 Purpose:
 Pop 32 bit words from opb fifo
 Assemble into 128 bit word for consumption by
 master state machine
 Also register the control line value that comes with 
 the First 32 bit word
 */

module fifo_rd_32_to_128 ( /*AUTOARG*/
   // Outputs
   odata, o_control, pop, o_rdy,
   // Inputs
   idata, i_rdy, clk, reset, pull, i_control
   ) ;

   parameter i_r_width=32 ; //input data width
   parameter o_r_width=128 ; //output data width   
   
   input [i_r_width-1:0] idata ;
   input 		 i_rdy;
   input 		 clk,reset ;
   input 		 pull ;
   input 		 i_control;
   
   output [o_r_width-1:0] odata ;
   output 		  o_control;
   output 		  pop ;
   output 		  o_rdy ;
   
   reg [o_r_width-1:0] 	odata_wd , odata_rd ;
   reg 			o_rdy_wc , o_rdy_rc ;
   reg 			pop_rc,pop_wc;
   reg 			o_control_wd,o_control_rd;
   
   //Wire assigns for outputs
   wire 		pop = pop_wc ;
   wire [o_r_width-1:0] odata = odata_rd ;
   wire 		o_rdy = o_rdy_wc;
   wire 		o_control = o_control_rd;
   
   //Local var
   reg [2:0] fsm_cs, fsm_ns;

   //Don't worry about the state encoding
   //synthesis will optimize this
   localparam init   = 3'd0;
   localparam stage1 = 3'd1;
   localparam stage2 = 3'd2;
   localparam stage3 = 3'd3;
   localparam stage4 = 3'd4;

   always @(posedge clk or posedge reset)
     if (reset)
       begin
	  pop_rc <= 0;
	  fsm_cs <= init ;
	  o_rdy_rc <= 0 ;
       end
     else
       begin
	  fsm_cs <= fsm_ns ;
	  pop_rc <= pop_wc ;
	  odata_rd <= odata_wd ;
	  o_control_rd <= o_control_wd;
	  o_rdy_rc <= o_rdy_wc ;
       end

   //Algo
   //1. Pop 4 words from Fifo
   //2. Assert o_rdy
   //3. Wait for pull , goto (1)
   
   always @*
     begin
	
	fsm_ns = fsm_cs ;
	pop_wc = 0;
	o_rdy_wc = 0;
	
	//Hold values
	odata_wd = odata_rd ;
	o_control_wd = o_control_rd ;
	
	case ( fsm_cs )
	  init:
	    if ( i_rdy  )
	      begin
		 fsm_ns = stage1;
		 pop_wc = 1;
		 odata_wd[127:96] = idata ;
		 o_control_wd = i_control ;		    
	      end
	  	  
	  stage1:
	    begin
	       if ( i_rdy  )
		 begin
		    odata_wd[95:64] = idata ;		    		    
		    fsm_ns = stage2 ;
		    pop_wc = 1 ;
		 end
	    end

	  stage2:
	    begin

	       if ( i_rdy  )
		 begin
		    odata_wd[63:32] = idata ;		    
		    fsm_ns = stage3 ;
		    pop_wc = 1 ;
		 end
	    end

	  stage3:
	    begin
	       if ( i_rdy  )
		 begin
		    odata_wd[31:0] = idata ; 		    
		    fsm_ns = stage4 ;
		    pop_wc = 1 ;
		 end
	    end

	  stage4:
	    begin
	       o_rdy_wc = 1;
	       if ( pull )
		 fsm_ns = init ;
	    end	  

	  default:fsm_ns = init ;
	  
	endcase // case ( fsm_cs )
     end

endmodule // fifo_rd_64_to_128
