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
   
   initial clk = 0;
   always #5 clk = ~clk ;

   integer 		wr_ptr,rd_ptr ;
   reg [32:0] 		mem[0:1000];
   
   initial
     begin
	$dumpvars;
	//$readmemh("encoded.dat",idata);
	wr_ptr = 0;
	rd_ptr = 0;
	
	FSL_S_Exists = 0;
	FSL_M_Full = 0;
	FSL_S_Control = 0;
	FSL_S_Data = 0;
	
	rst = 1 ;
	repeat (10) @(posedge clk);
	rst = 0 ;
	repeat (10000) @(posedge clk);
	$finish;
     end


   initial
     begin
	key_write (128'hB01DFACE0DEC0DED0BA11ADE0EFFEC70);
	repeat(100)
	  begin
	     data_write(128'h0);	     
	     data_write(128'h00000001000000020000000300000004);
	     data_write(128'h00000002000000030000000400000005);
	  end
	
     end // initial begin

   task key_write ;
      input [127:0] key;
      begin
	 mem[wr_ptr]={1'b1,key[127:96]};
	 wr_ptr = wr_ptr + 1;

	 mem[wr_ptr]= {1'b0,key[95:64]};
	 wr_ptr = wr_ptr + 1;

	 mem[wr_ptr]= {1'b0,key[63:32]};
	 wr_ptr = wr_ptr + 1;

	 mem[wr_ptr]= {1'b0,key[31:0]};
	 wr_ptr = wr_ptr + 1;	 
      end
   endtask //key_write

   task data_write ;
      input [127:0] data;
      begin
	 mem[wr_ptr]={1'b0,data[127:96]};
	 wr_ptr = wr_ptr + 1;

	 mem[wr_ptr]= {1'b0,data[95:64]};
	 wr_ptr = wr_ptr + 1;

	 mem[wr_ptr]= {1'b0,data[63:32]};
	 wr_ptr = wr_ptr + 1;

	 mem[wr_ptr]= {1'b0,data[31:0]};
	 wr_ptr = wr_ptr + 1;	 
      end
   endtask //key_write   

   always @(posedge clk)
     if ( $random() % 2 )
       FSL_M_Full <= 1;
     else
       FSL_M_Full <= 0;
   
   always @(posedge clk)
     begin
	wait(rst == 0);
	
	if ( FSL_S_Read )
	  begin
	     rd_ptr =rd_ptr + 1;
	  end
	
	{FSL_S_Control,FSL_S_Data} <= mem[rd_ptr];
	FSL_S_Exists <= 0;
	repeat(10)
	  @(posedge clk);
	FSL_S_Exists <= 1;
     end

   aes_accel dut (/*autoinst*/
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
