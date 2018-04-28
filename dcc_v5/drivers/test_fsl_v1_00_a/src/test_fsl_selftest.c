//////////////////////////////////////////////////////////////////////////////
// Filename:          C:\work\fpga\dcc_v2p\drivers/test_fsl_v1_00_a/src/test_fsl_selftest.c
// Version:           1.00.a
// Description:       
// Date:              Mon Oct 27 21:24:21 2008 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#include "xparameters.h"
#include "test_fsl.h"

/* IMPORTANT:
*  In order to run this self test, you need to modify the value of following
*  micros according to the slot ID defined in xparameters.h file. 
*/
#define input_slot_id   XPAR_FSL_TEST_FSL_0_INPUT_SLOT_ID
#define output_slot_id  XPAR_FSL_TEST_FSL_0_OUTPUT_SLOT_ID

XStatus TEST_FSL_SelfTest()
{
	 unsigned int input_0[8];     
	 unsigned int output_0[8];     

	 //Initialize your input data over here: 
	 input_0[0] = 12345;     
	 input_0[1] = 24690;     
	 input_0[2] = 37035;     
	 input_0[3] = 49380;     
	 input_0[4] = 61725;     
	 input_0[5] = 74070;     
	 input_0[6] = 86415;     
	 input_0[7] = 98760;     

	 //Call the macro with instance specific slot IDs
	 test_fsl(
		 input_slot_id,
		 output_slot_id,
		 input_0,      
		 output_0       
		 );

	 if (output_0[0] != 444420)
		 return XST_FAILURE;
	 if (output_0[7] != 444420)
		 return XST_FAILURE;

	 return XST_SUCCESS;
}
