`timescale 1ns/1ns

`define init   3'd0
`define stage1 3'd1
`define stage2 3'd2
`define stage3 3'd3
`define stage4 3'd4
`define stage5 3'd5
`define stage6 3'd6
`define stage7 3'd7

module accel_sort ( /*AUTOARG*/
   // Outputs
   odata, push, pop,
   // Inputs
   idata, rdy, not_full, clk, reset, start_index, global_key,
   no_compare,reset_index,zero_key
   ) ;

   parameter i_width=64  ; 
   parameter o_width=64 ; 
   parameter index_width = 19 ;

   parameter i_r_width=64 ;  
   parameter o_r_width=128 ;  

   parameter i_w_width=128 ; 
   parameter o_w_width=64 ; 
   
   input [i_width-1:0] idata ;
   input 	       rdy;
   input 	       not_full ;
   input 	       clk,reset ;
   input [index_width-1:0]	start_index ;
   input [127:0] 		global_key;
   input 			no_compare ;//when set data is not compared,required for an encryption pass
   input 			reset_index ;
   input 			zero_key ;
   
   output [o_width-1:0] 	odata ;
   output 			push;
   output 			pop ;

   wire 			reset_index ;
   
   wire 			pop;
   wire 			no_compare;
   
   reg [2:0] fsm_cs, fsm_ns;

   reg 	     rd_pull_wc,rd_pull_rc;
   reg 	       go_wc,go_rc;

   reg 	       keygen_pull_wc,keygen_pull_rc;

   
   wire [o_r_width-1:0] rdata;
   reg [i_w_width-1:0] 	wr_data_wd,wr_data_rd;
   wire [i_w_width-1:0] wr_data = wr_data_rd;   
   
   wire        rd_rdy ;
   wire        keygen_o_rdy ;
   wire        push ;
   reg 	       wr_push_rc,wr_push_wc;
   wire        not_full ;
   wire        clk,reset;

   wire        wr_push = wr_push_rc;   
   wire        i_rdy = rdy ;
   wire        rd_pull = rd_pull_rc;   
   wire        go = go_rc;   
   wire        keygen_pull = keygen_pull_rc;
   wire [127:0] o_key;

   reg data1_gt_data2_wc;
   wire zero_key ;
   
   reg [127:0] data1_wd,data2_wd,
	       data1_rd,data2_rd,
	       data1_unencrypted_wd,data2_unencrypted_wd,
	       data1_unencrypted_rd,data2_unencrypted_rd;
   
   fifo_rd_64_to_128 fifo_read(
			       // Outputs
			       .odata		(rdata[o_r_width-1:0]),
			       .pop		(pop),
			       .o_rdy		(rd_rdy),
			       // Inputs
			       .idata		(idata[i_width-1:0]),
			       .i_rdy		(i_rdy),
			       .clk		(clk),
			       .reset		(reset),
			       .pull		(rd_pull));
   
   fifo_wr_128_to_64 fifo_write( 
				// Outputs
				.rdy		(wr_rdy),
				.odata		(odata[o_w_width-1:0]),
				.o_push		(push),
				// Inputs
				.idata		(wr_data[i_w_width-1:0]),
				.clk		(clk),
				.reset		(reset),
				.not_full	(not_full),
				.i_push		(wr_push));

   
   aes_keygen  keygen(
		      // Outputs
		      .o_key		(o_key[127:0]),
		      .o_rdy		(keygen_o_rdy),
		      // Inputs
		      .clk		(clk),
		      .reset		(reset),
		      .go		(go),
		      .zero_key         (zero_key),
		      .pull		(keygen_pull),
		      .global_key	(global_key[127:0]),
		      .reset_index      (reset_index),
		      .start_index	(start_index[index_width-1:0]));
   
   
   always @(posedge clk or posedge reset)
     if (reset)
       begin
	  fsm_cs <= `stage1 ;
	  rd_pull_rc <= 0;
	  go_rc <= 0;
	  keygen_pull_rc <= 0;
	  wr_push_rc <= 0;
       end
     else
       begin
	  //Control assigns
	  fsm_cs <= fsm_ns ;
	  rd_pull_rc <= rd_pull_wc ;
	  go_rc <= go_wc ;
	  keygen_pull_rc <= keygen_pull_wc ;
	  wr_push_rc <= wr_push_wc;
	   
	  //Datapath assigns
	  data1_rd <= data1_wd ;
	  data2_rd <= data2_wd;
	  data1_unencrypted_rd <= data1_unencrypted_wd;
	  data2_unencrypted_rd <= data2_unencrypted_wd;
	  wr_data_rd <= wr_data_wd ;
       end

   
   always @(/*autosense*/
	    data1_rd
	    or data1_unencrypted_rd or data2_rd
	    or data2_unencrypted_rd or fsm_cs or keygen_o_rdy
	    or no_compare or o_key or rd_rdy or rdata or wr_data_rd
	    or wr_rdy)
     begin
	//Control
	fsm_ns = fsm_cs ;
	go_wc = 0;
	rd_pull_wc = 0;
	keygen_pull_wc = 0;
	wr_push_wc = 0;

	//Datapath
	data1_gt_data2_wc = (data1_unencrypted_rd < data2_unencrypted_rd) | no_compare ;
	data1_wd = data1_rd;
	data1_unencrypted_wd = data1_unencrypted_rd;
	data2_wd = data2_rd;
	data2_unencrypted_wd = data2_unencrypted_rd;	
	wr_data_wd = wr_data_rd;
	
	case ( fsm_cs )

	  `stage1://Read from fifo 
	    if ( rd_rdy )
	      begin
		 go_wc = 1 ;		 
		 rd_pull_wc = 1 ;
		 data1_wd = rdata ;
		 fsm_ns = `stage2 ;
	      end

	  `stage2:
	    if ( keygen_o_rdy )
	      begin
		 keygen_pull_wc = 1;
		 data1_unencrypted_wd = data1_rd ^ o_key ;
//		 data1_unencrypted_wd = data1_rd ;
		 fsm_ns = `stage3;
	      end

	  `stage3:
	    begin
	       go_wc = 1;//Start next round of computation
	       
	       if ( rd_rdy )
		 begin
		    rd_pull_wc = 1 ;
		    data2_wd = rdata ;
		    fsm_ns = `stage4 ;
		 end
	    end // case: `stage3

	  `stage4:
	    if ( keygen_o_rdy )
	      begin
		 keygen_pull_wc = 1;
		 data2_unencrypted_wd = data2_rd ^ o_key ;
//		 data2_unencrypted_wd = data2_rd ;
		 fsm_ns = `stage5;
	      end

	  `stage5://Compare and push to output fifo
	    if ( wr_rdy )
	      begin
		 if (data1_gt_data2_wc)
		   wr_data_wd = data1_unencrypted_rd;
		 else
		   wr_data_wd = data2_unencrypted_rd;			
		 wr_push_wc =1 ;
		 fsm_ns = `stage6;
	      end

	  `stage6://wait state for wr_rdy to respond
	    if ( !wr_rdy ) 
	      fsm_ns=`stage7;

	  `stage7://Load the other data word
	    if ( wr_rdy )
	      begin
		 if (data1_gt_data2_wc)
		   wr_data_wd = data2_unencrypted_rd;
		 else
		   wr_data_wd = data1_unencrypted_rd;			
		 wr_push_wc =1 ;
		 fsm_ns = `stage1;
	      end
	    
	  default:fsm_ns = `stage1 ;
	  
	endcase // case ( fsm_cs )
     end
   
endmodule // accel_sort
