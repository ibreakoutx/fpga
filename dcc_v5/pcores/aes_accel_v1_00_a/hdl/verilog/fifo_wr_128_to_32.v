`include "timescale.v"
/*
 Purpose:
 Push 128 bit word, 32 bits at a time into opb fifo
 When rdy is high, use i_push to send data in.
 as long as fifo not_full , 32 bit words o_push(ed).
 */

module fifo_wr_128_to_32 ( /*AUTOARG*/
   // Outputs
   rdy, odata, o_push,
   // Inputs
   idata, clk, reset, not_full, i_push
   ) ;

   parameter i_w_width=128 ; //input data width
   parameter o_w_width=32 ; //output data width   
   
   input [i_w_width-1:0] idata ;
   input 		clk,reset ;
   input 		not_full ;
   input 		i_push ;
   
   output  	       rdy ;   
   output [o_w_width-1:0] odata ;
   output 		o_push ;

   reg [o_w_width-1:0] 	odata_wd , odata_rd ;
   reg 			rdy_wc , rdy_rc ;
   reg 			o_push_wc, o_push_rc ;

   wire [i_w_width-1:0] 	idata ;
   reg [i_w_width-1:0] 	idata_wd, idata_rd ;   
   wire 		o_push = o_push_rc ;
   
   //Wire assigns for outputs
   wire [o_w_width-1:0] 	odata = odata_rd ;
   wire 		rdy = rdy_rc;

   //Local var
   reg [2:0] fsm_cs, fsm_ns;
   localparam init    = 3'd0;
   localparam stage1  = 3'd1;
   localparam stage2  = 3'd2;
   localparam stage3  = 3'd3;
   localparam stage4  = 3'd4;
   localparam stage5  = 3'd5;   
   

   always @(posedge clk or posedge reset)
     if (reset)
       begin
	  fsm_cs <= init ;
	  rdy_rc <= 0 ;
	  odata_rd <= 0;
	  o_push_rc <= 0;
       end
     else
       begin
	  fsm_cs <= fsm_ns ;
	  odata_rd <= odata_wd ;
	  rdy_rc <= rdy_wc ;
	  idata_rd <= idata_wd ;
	  o_push_rc <= o_push_wc ;
       end

   
   //Algo
   //1. Pop 4 words from Fifo
   //2. Assert rdy
   //3. Wait for pull , goto (1)
   
   always @*

     begin
	
	fsm_ns = fsm_cs ;
	o_push_wc = 0;
	
	//Hold values
	odata_wd = odata_rd ;
	idata_wd = idata_rd ;
	rdy_wc = rdy_rc ;
	
	case ( fsm_cs )
	  init:
	    if ( not_full  )
	      begin
		 fsm_ns = stage1 ;
		 rdy_wc = 1 ;
	      end

	  stage1:
	    begin
	       if ( i_push )
		 begin
		    idata_wd = idata ;
		    rdy_wc = 0;
		    fsm_ns = stage2;
		 end
	    end

	  stage2:
	    begin
	       if ( not_full )
		 begin
		    odata_wd= idata_rd[127:96];
		    if (~o_push_rc) //don't do back to back pushes
		      begin		    		    
			 o_push_wc = 1 ;
			 fsm_ns = stage3 ;
		      end
		 end
	    end

	  stage3:
	    begin
	       if ( not_full )
		 begin
		    odata_wd= idata_rd[95:64];
		    if (~o_push_rc) //don't do back to back pushes
		      begin		    		    
			 o_push_wc = 1 ;
			 fsm_ns = stage4 ;
		      end
		 end
	    end

	  stage4:
	    begin
	       if ( not_full )
		 begin
		    odata_wd= idata_rd[63:32];
		    if (~o_push_rc) //don't do back to back pushes
		      begin		    
			 o_push_wc = 1 ;
			 fsm_ns = stage5 ;
		      end
		 end
	    end	  

	  stage5:
	    begin
	       if ( not_full )
		 begin
		    odata_wd= idata_rd[31:0];
		    if (~o_push_rc) //don't do back to back pushes
		      begin
			 o_push_wc = 1 ;
			 fsm_ns = init ;
		    end
		 end
	    end	  

	  default:fsm_ns = init ;
	  
	endcase // case ( fsm_cs )
     end

endmodule // fifo_wr_128_to_32
