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
   integer 		count ;

   reg [31:0] 		fsl_data[0:7];
   reg [2:0] 		fsl_ptr ;

   integer 		i ;
   
   initial
     begin
	$dumpvars;
	//$readmemh("encoded.dat",idata);
	fsl_ptr = 0;
	count = 0;
	FSL_S_Exists = 0;
	FSL_M_Full = 0;
	FSL_S_Control = 0;
	FSL_S_Data = 32'h80000000 ;

	for (i=0;i<8;i=i+1)
	  fsl_data[i] = i+1;
	
	addr = 0;
	din = 1;
	
	rst = 1 ;
	repeat (10) @(posedge clk);
	rst = 0 ;
	repeat (10000) @(posedge clk);
	$finish;
     end

   always @(posedge clk)
     begin
	wait(rst == 0);
	
	FSL_S_Data <= fsl_data[fsl_ptr];
	FSL_S_Exists <= 1;
	if ( FSL_S_Read )
	  fsl_ptr <= fsl_ptr + 1;
     end

   always @(posedge clk)
     if ( $random() % 2 )
       FSL_M_Full <= 0;
     else
       FSL_M_Full <= 0;
   

   task data_write ;
      input [31:0] data ;
      begin
	@(posedge clk);
	 FSL_S_Data <= data;
	 FSL_S_Exists <= 1;
	 @(posedge clk);
	 FSL_S_Exists <= 0;	 
      end
   endtask // cache_write

   task data_read ;
      input [3:0] way ;      
      input [10:0] addr;
      begin
	@(posedge clk);
	 FSL_S_Data[0:3] <= way;
	 FSL_S_Data[20:31] <= addr;	 	 
	 FSL_S_Exists <= 1;
	@(posedge clk);
	 FSL_S_Exists <= 0;	 
      end
   endtask // cache_write
      
   test_fsl dut (/*autoinst*/
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
