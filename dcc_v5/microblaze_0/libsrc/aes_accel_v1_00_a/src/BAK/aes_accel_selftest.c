//////////////////////////////////////////////////////////////////////////////
// Filename:          C:\work\fpga\dcc_v2p\drivers/aes_accel_v1_00_a/src/aes_accel_selftest.c
// Version:           1.00.a
// Description:       
// Date:              Fri Oct 24 23:09:53 2008 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#include "xparameters.h"
#include "aes_accel.h"

/* IMPORTANT:
*  In order to run this self test, you need to modify the value of following
*  micros according to the slot ID defined in xparameters.h file. 
*/
#define input_slot_id   XPAR_FSL_AES_ACCEL_0_INPUT_SLOT_ID
#define output_slot_id  XPAR_FSL_AES_ACCEL_0_OUTPUT_SLOT_ID

XStatus AES_ACCEL_SelfTest()
{
	 unsigned int input_0[12];     
	 unsigned int output_0[12];     

	 //Initialize your input data over here: 
	 input_0[0] = 12345;     
	 input_0[1] = 24690;     
	 input_0[2] = 37035;     
	 input_0[3] = 49380;     
	 input_0[4] = 61725;     
	 input_0[5] = 74070;     
	 input_0[6] = 86415;     
	 input_0[7] = 98760;     
	 input_0[8] = 111105;     
	 input_0[9] = 123450;     
	 input_0[10] = 135795;     
	 input_0[11] = 148140;     

	 //Call the macro with instance specific slot IDs
	 aes_accel(
		 input_slot_id,
		 output_slot_id,
		 input_0,      
		 output_0       
		 );

	 if (output_0[0] != 962910)
		 return XST_FAILURE;
	 if (output_0[11] != 962910)
		 return XST_FAILURE;

	 return XST_SUCCESS;
}
