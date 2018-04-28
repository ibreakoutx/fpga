`include "timescale.v"

module tb ;

   /*autoreginput*/
   // Beginning of automatic reg inputs (for undeclared instantiated-module inputs)
   reg			FSL_M_Full;		// To dut of aes_accel.v
   reg			FSL_S_Control;		// To dut of aes_accel.v
   reg [0:31]		FSL_S_Data;		// To dut of aes_accel.v
   reg			FSL_S_Exists;		// To dut of aes_accel.v
   // End of automatics

   /*autowire*/
   // Beginning of automatic wires (for undeclared instantiated-module outputs)
   wire			FSL_M_Clk;		// From dut of aes_accel.v
   wire			FSL_M_Control;		// From dut of aes_accel.v
   wire [0:31]		FSL_M_Data;		// From dut of aes_accel.v
   wire			FSL_M_Write;		// From dut of aes_accel.v
   wire			FSL_S_Clk;		// From dut of aes_accel.v
   wire			FSL_S_Read;		// From dut of aes_accel.v
   // End of automatics

   reg [63:0] 		idata[0:50000] ;
   reg [4:0] 		idata_length ;

   reg 			rst;
   reg 			clk;
   wire 		FSL_Clk = clk ;
   wire 		FSL_Rst = rst ;

   reg [10:0] 		addr;
   reg [31:0] 		din ;
   
   initial clk = 0;
   always #5 clk = ~clk ;

   integer 		wr_ptr,rd_ptr ;
   reg [32:0] 		mem[0:1000];
   
   initial
     begin
	$dumpvars;
	//$readmemh("encoded.dat",idata);

	FSL_S_Exists = 0;
	FSL_M_Full = 0;
	FSL_S_Control = 0;
	FSL_S_Data = 32'h80000000 ;
	wr_ptr = 0;
	rd_ptr =0 ;
	
	addr = 0;
	din = 0;
	
	rst = 1 ;
	repeat (10) @(posedge clk);
	rst = 0 ;
	repeat (10000) @(posedge clk);
	$finish;
     end

   always @(posedge clk)
     if ( $random() % 2 )
       FSL_M_Full <= 0;
     else
       FSL_M_Full <= 0;

   always @(posedge clk)
     begin
	wait(rst == 0);

	if ( FSL_S_Read )
	  rd_ptr =rd_ptr + 1;
	
	{FSL_S_Control,FSL_S_Data} <= mem[rd_ptr];
	FSL_S_Exists <= 1;
//	@(posedge clk);
//	FSL_S_Exists <= 1;
     end
   
   initial
     begin
	repeat(10)
	  begin
	     din = din + 1 ;
	     cache_write(4'd1,addr,din);

	     din = din + 1 ;	     
	     cache_write(4'd2,addr,din);

	     din = din + 1 ;
	     cache_write(4'd4,addr,din);

	     din = din + 1 ;	
	     cache_write(4'd8,addr,din);

	     addr = addr + 1 ;
	     
	  end // repeat (10)
	addr= 0;
	repeat(10)
	  begin
	     cache_read(4'd1,addr);

	     cache_read(4'd2,addr);

	     cache_read(4'd4,addr);

	     cache_read(4'd8,addr);
	     addr = addr + 1;
	     
	  end
     end // initial begin

   task cache_write ;
      input [3:0] way ;
      input [10:0] addr;
      input [31:0] data ;
      begin
	 mem[wr_ptr]={1'b1,way,17'h0,addr};
	 wr_ptr = wr_ptr + 1;
	 mem[wr_ptr]= data ;
	 wr_ptr = wr_ptr + 1;
      end
   endtask // cache_write


   task cache_read ;
      input [3:0] way ;      
      input [10:0] addr;
      begin
	 mem[wr_ptr]={1'b0,way,17'h0,addr};
	 wr_ptr = wr_ptr + 1;
      end
   endtask // cache_write
      
   tlb_bram dut (/*autoinst*/
		  // Outputs
		  .FSL_S_Clk		(FSL_S_Clk),
		  .FSL_S_Read		(FSL_S_Read),
		  .FSL_M_Clk		(FSL_M_Clk),
		  .FSL_M_Write		(FSL_M_Write),
		  .FSL_M_Data		(FSL_M_Data[0:31]),
		  .FSL_M_Control	(FSL_M_Control),
		  // Inputs
		  .FSL_Clk		(FSL_Clk),
		  .FSL_Rst		(FSL_Rst),
		  .FSL_S_Data		(FSL_S_Data[0:31]),
		  .FSL_S_Control	(FSL_S_Control),
		  .FSL_S_Exists		(FSL_S_Exists),
		  .FSL_M_Full		(FSL_M_Full));

   
endmodule // tb
