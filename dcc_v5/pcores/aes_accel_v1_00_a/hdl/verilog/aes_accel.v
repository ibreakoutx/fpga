`include "timescale.v"
//----------------------------------------------------------------------------
// aes_accel - module
//----------------------------------------------------------------------------
// IMPORTANT:
// DO NOT MODIFY THIS FILE EXCEPT IN THE DESIGNATED SECTIONS.
//
// SEARCH FOR --USER TO DETERMINE WHERE CHANGES ARE ALLOWED.
//
// TYPICALLY, THE ONLY ACCEPTABLE CHANGES INVOLVE ADDING NEW
// PORTS AND GENERICS THAT GET PASSED THROUGH TO THE INSTANTIATION
// OF THE USER_LOGIC ENTITY.
//----------------------------------------------------------------------------
//
// ***************************************************************************
// ** Copyright (c) 1995-2007 Xilinx, Inc.  All rights reserved.            **
// **                                                                       **
// ** Xilinx, Inc.                                                          **
// ** XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"         **
// ** AS A COURTESY TO YOU, SOLELY FOR USE IN DEVELOPING PROGRAMS AND       **
// ** SOLUTIONS FOR XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE,        **
// ** OR INFORMATION AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE,        **
// ** APPLICATION OR STANDARD, XILINX IS MAKING NO REPRESENTATION           **
// ** THAT THIS IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,     **
// ** AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE      **
// ** FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY              **
// ** WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE               **
// ** IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR        **
// ** REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF       **
// ** INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       **
// ** FOR A PARTICULAR PURPOSE.                                             **
// **                                                                       **
// ***************************************************************************
//
//----------------------------------------------------------------------------
// Filename:          aes_accel
// Version:           1.00.a
// Description:       Example FSL core (Verilog).
// Date:              Fri Oct 24 10:13:55 2008 (by Create and Import Peripheral Wizard)
// Verilog Standard:  Verilog-2001
//----------------------------------------------------------------------------
// Naming Conventions:
//   active low signals:                    "*_n"
//   clock signals:                         "clk", "clk_div#", "clk_#x"
//   reset signals:                         "rst", "rst_n"
//   generics:                              "C_*"
//   user defined types:                    "*_TYPE"
//   state machine next state:              "*_ns"
//   state machine current state:           "*_cs"
//   combinatorial signals:                 "*_com"
//   pipelined or register delay signals:   "*_d#"
//   counter signals:                       "*cnt*"
//   clock enable signals:                  "*_ce"
//   internal version of output port:       "*_i"
//   device pins:                           "*_pin"
//   ports:                                 "- Names begin with Uppercase"
//   processes:                             "*_PROCESS"
//   component instantiations:              "<ENTITY_>I_<#|FUNC>"
//----------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////
//
//
// Definition of Ports
// FSL_Clk             : Synchronous clock
// FSL_Rst           : System reset, should always come from FSL bus
// FSL_S_Clk       : Slave asynchronous clock
// FSL_S_Read      : Read signal, requiring next available input to be read
// FSL_S_Data      : Input data
// FSL_S_Control   : Control Bit, indicating the input data are control word
// FSL_S_Exists    : Data Exist Bit, indicating data exist in the input FSL bus
// FSL_M_Clk       : Master asynchronous clock
// FSL_M_Write     : Write signal, enabling writing to output FSL bus
// FSL_M_Data      : Output data
// FSL_M_Control   : Control Bit, indicating the output data are contol word
// FSL_M_Full      : Full Bit, indicating output FSL bus is full
//
////////////////////////////////////////////////////////////////////////////////

//----------------------------------------
// Module Section
//----------------------------------------
module aes_accel 
	(
		// ADD USER PORTS BELOW THIS LINE 
		// -- USER ports added here 
		// ADD USER PORTS ABOVE THIS LINE 

		// DO NOT EDIT BELOW THIS LINE ////////////////////
		// Bus protocol ports, do not add or delete. 
		FSL_Clk,
		FSL_Rst,
		FSL_S_Clk,
		FSL_S_Read,
		FSL_S_Data,
		FSL_S_Control,
		FSL_S_Exists,
		FSL_M_Clk,
		FSL_M_Write,
		FSL_M_Data,
		FSL_M_Control,
		FSL_M_Full
		// DO NOT EDIT ABOVE THIS LINE ////////////////////
	);

// ADD USER PORTS BELOW THIS LINE 
// -- USER ports added here 
// ADD USER PORTS ABOVE THIS LINE 

input                                     FSL_Clk;
input                                     FSL_Rst;
   
output                                    FSL_S_Clk;
   
output                                    FSL_S_Read;
input      [0 : 31]                       FSL_S_Data;
input                                     FSL_S_Control;
   
input                                     FSL_S_Exists;
   
output                                    FSL_M_Clk;
   
output                                    FSL_M_Write;
output     [0 : 31]                       FSL_M_Data;
output                                    FSL_M_Control;
input                                     FSL_M_Full;

// ADD USER PARAMETERS BELOW THIS LINE 
// --USER parameters added here 
// ADD USER PARAMETERS ABOVE THIS LINE


//----------------------------------------
// Implementation Section
//----------------------------------------
// In this section, we povide an example implementation of MODULE aes_accel
// that does the following:
//
// 1. Read all inputs
// 2. Add each input to the contents of register 'sum' which
//    acts as an accumulator
// 3. After all the inputs have been read, write out the
//    content of 'sum' into the output FSL bus NUMBER_OF_OUTPUT_WORDS times
//
// You will need to modify this example for
// MODULE aes_accel to implement your coprocessor

   // Total number of input data.
   localparam NUMBER_OF_INPUT_WORDS  = 16;

   // Total number of output data
   localparam NUMBER_OF_OUTPUT_WORDS = 16;

   // Counters to store the number inputs read & outputs written
   reg [0:NUMBER_OF_INPUT_WORDS - 1] nr_of_reads;
   reg [0:NUMBER_OF_OUTPUT_WORDS - 1] nr_of_writes;

   // CAUTION:
   // The sequence in which data are read in should be
   // consistent with the sequence they are written in the
   // driver's aes_accel.c file

   localparam init = 2'd0,
	      wait_for_done = 2'd1,
	      wait_for_rdy  = 2'd2;
   
   reg  rd_pull_rc ;
   reg  rd_pull_wc ;
   reg  i_push_wc ;

   wire i_push = i_push_wc ;
   
   wire   clk = FSL_Clk ;
   wire   rst = FSL_Rst ;
   
   wire [31:0] idata = FSL_S_Data;
   wire     i_control = FSL_S_Control;
   wire     pop ;
   wire     o_push ;
   
   wire        i_rdy = FSL_S_Exists;
   wire        FSL_S_Read = pop ;
   wire        rd_pull = rd_pull_wc;

   wire        FSL_M_Write = o_push ;
   wire        not_full = ~FSL_M_Full ;
   wire [31:0] wr_data ;
   assign      FSL_M_Data = wr_data ;
   wire 	       FSL_M_Control = 0;

   wire [127:0]        key;
   
   reg [127:0] key_rd,key_wd;

   reg 	[1:0]		fsm_ns,fsm_cs ;
   reg 			ld_wc,ld_rc ;

   reg [127:0] 		text_in_wd,text_in_rd ;
   reg [127:0] 		text_out_wd,text_out_rd ;   

   wire [127:0] 	text_in = text_in_rd ;
   wire 		ld = ld_rc;

   wire [127:0] 	text_out;
   wire 		rd_rdy;
   wire [127:0] 	odata;

//   assign 		key = key_rd;
   assign 		key = 128'hB01DFACE0DEC0DED0BA11ADE0EFFEC70;

   //zReg

   always @(posedge clk)
     if (rst)
       begin
	  //zClkReset
	  fsm_cs <= init ;
	  rd_pull_rc <= 0 ; 
	  ld_rc <= 0 ; 
       end
     else
       begin
	  //zClkAssign
	  fsm_cs <= fsm_ns;
	  rd_pull_rc <=  rd_pull_wc ; 
	  key_rd <=  key_wd ; 
	  ld_rc <=  ld_wc ; 
	  text_in_rd <=  text_in_wd ;
	  text_out_rd <= text_out_wd;
	  
       end
   //zEnd
   
   fifo_rd_32_to_128 fifo_rd (
			      // Outputs
			      .odata		(odata[127:0]),
			      .o_control	(o_control),
			      .pop		(pop),
			      .o_rdy		(rd_rdy),
			      // Inputs
			      .idata		(idata[31:0]),
			      .i_rdy		(i_rdy),
			      .clk		(clk),
			      .reset		(rst),
			      .pull		(rd_pull),
			      .i_control	(i_control));
   

   aes_cipher_top cipher_i (
			    // Outputs
			    .done		(done),
			    .text_out		(text_out[127:0]),
			    // Inputs
			    .clk		(clk),
			    .rst		(~rst),
			    .ld			(ld),
			    .key		(key[127:0]),
			    .text_in		(text_in[127:0]));

   
  fifo_wr_128_to_32 fifo_wr (
			      // Outputs
			      .rdy		(wr_rdy),
			      .odata		(wr_data[31:0]),
			      .o_push		(o_push),
			      // Inputs
			      .idata		(text_out_rd[127:0]),
			      .clk		(clk),
			      .reset		(rst),
			      .not_full		(not_full),
			      .i_push		(i_push));   

   always @*

     begin
	fsm_ns = fsm_cs ;
	ld_wc = 0;
	
	//Hold values
	key_wd = key_rd;

	//zWireAssign
	rd_pull_wc =  0 ; 
	i_push_wc =  0 ; 
	text_out_wd = text_out_rd ;
	
	text_in_wd =  text_in_rd ; 
	//zEnd
	
	case ( fsm_cs )
	  init:
	    if ( rd_rdy  )//128 bit word available from fifo_rd_32_to_128
	      begin
		 rd_pull_wc = 1;
		 if ( o_control )
		   begin
		      key_wd = odata ;
		      //Stay in this state
		   end
		 else
		   begin
		      text_in_wd = odata;
		      ld_wc = 1 ;
		      fsm_ns = wait_for_done ;		      
		   end
	      end
	  
	  wait_for_done:
	    begin
	       if ( done )
		 begin
		    text_out_wd = text_out;
		    fsm_ns = wait_for_rdy ;
		 end
	    end

	  wait_for_rdy:
	    begin
	       if (wr_rdy)
		 begin
		    i_push_wc = 1;
		    fsm_ns = init ;
		 end
	    end
	  
	  default:fsm_ns = init ;
	  
	endcase // case ( fsm_cs )
     end


   /*
   always @(posedge FSL_Clk) 
   begin  // process The_SW_accelerator
      if (FSL_Rst)               // Synchronous reset (active high)
        begin
           // CAUTION: make sure your reset polarity is consistent with the
           // system reset polarity
           state        <= Idle;
           nr_of_reads  <= 0;
           nr_of_writes <= 0;
           sum          <= 0;
        end
      else
        case (state)
          Idle: 
            if (FSL_S_Exists == 1)
            begin
              state       <= Read_Inputs;
              nr_of_reads <= NUMBER_OF_INPUT_WORDS - 1;
              sum         <= 0;
            end

          Read_Inputs: 
            if (FSL_S_Exists == 1) 
            begin
              // Coprocessor function (Adding) happens here
              sum         <= sum + FSL_S_Data;
              if (nr_of_reads == 0)
                begin
                  state        <= Write_Outputs;
                  nr_of_writes <= NUMBER_OF_OUTPUT_WORDS - 1;
                end
              else
                nr_of_reads <= nr_of_reads - 1;
            end

          Write_Outputs: 
            if (nr_of_writes == 0) 
              state <= Idle;
            else
              if (FSL_M_Full == 0)  nr_of_writes <= nr_of_writes - 1;
        endcase
   end
*/
   
endmodule
