
module data_splitter ( /*AUTOARG*/
   // Outputs
   idata_pop, odata1_push, odata1, odata2_pop, odata2,
   // Inputs
   clk, rst, stagecnt, num, idata_rdy, idata, odata1_rdy, odata2_rdy
   );

   //System clk and reset
   input clk ;
   input rst ;

   //Splitter parameters
   input [31:0] stagecnt ;
   input [31:0] num ;

   //Read Data from fifo interface
   input 	idata_rdy ;
   input [31:0] idata ;
   output 	idata_pop ;
   
   //Output data interface
   output 	odata1_push;
   input 	odata1_rdy;
   output [31:0] odata1;

   output 	odata2_push;
   input 	odata2_rdy;
   output [31:0] odata2;   

   //zWidth [31:0] data ;
   
   //zReg
   reg [31:0] idata_pop_rc ;
   reg  chan1_cnt_rc ;
   reg [31:0] idata_pop_wc ;
   reg [31:0] odata1_push_wc ;
   reg  chan1_cnt_wc ;
   reg [31:0] idata_rd ;
   reg [31:0] odata1_rd ;
   reg [31:0] odata2_rd ;
   reg [31:0] data_rd ;
   reg [31:0] data_wd ;
   //    

   always @(posedge clk)
     if (rst)
       begin
	  //zClkReset
	  idata_pop_rc <= 0 ; 
	  chan1_cnt_rc <= 0 ; 
	  //zEnd
       end
     else
       begin
	  //zClkAssign
	  idata_pop_rc <=  idata_pop_wc ; 
	  chan1_cnt_rc <=  chan1_cnt_wc ; 
	  data_rd <=  data_wd ; 
	  //zEnd
       end
   
   //1. Is data rdy in source, yes then pop
   //2. Push stagecnt times to channel1, unless not rdy

   parameter s0=1,s1=2,s2=2;

   always @( /*AUTOSENSE*/fsm_cs or s0)
     begin
	fsm_nxt = fsm_cs ;
	
	//zWireAssign
	idata_pop_wc =  0 ; 
	odata1_push_wc =  0 ; 
	chan1_cnt_wc =  0 ; 
	data_wd =  data_rd ; 
	
	//zEnd
	
	case(fsm_cs)
	  s0:begin
	     if ( idata_rdy )
	       begin
		  idata_pop_wc = 1;
		  fsm_nxt = s1 ;
	       end
	  end
	  
	  s1:begin
	     if ( idata_pop_rc )
	       data_wd = idata;
	     if ( chan1_cnt_rc < stagecnt && odata1_rdy )
	       begin
		  odata1_push_wc = 1;
		  fsm_nxt = s2 ;
	       end
	  end

	  s2:begin
	     odata1 = data_rd ;
	     chan1_cnt_wc = chan1_cnt_rc + 1 ;
	     fsm_nxt = s0 ;
	  end
	endcase // case (fsm_cs)

     end
     
endmodule // data_splitter

