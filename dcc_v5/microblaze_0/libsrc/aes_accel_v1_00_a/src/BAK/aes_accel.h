//////////////////////////////////////////////////////////////////////////////
// Filename:          C:\work\fpga\dcc_v2p\drivers/aes_accel_v1_00_a/src/aes_accel.h
// Version:           1.00.a
// Description:       aes_accel (AES128 accelerator) Driver Header File
// Date:              Fri Oct 24 23:09:53 2008 (by Create and Import Peripheral Wizard)
//////////////////////////////////////////////////////////////////////////////

#ifndef AES_ACCEL_H
#define AES_ACCEL_H

#include "xstatus.h"

#include "fsl.h" 
#define write_into_fsl(val, id)  putfsl(val, id)
#define read_from_fsl(val, id)  getfsl(val, id)

/*
* A macro for accessing FSL peripheral.
*
* This example driver writes all the data in the input arguments
* into the input FSL bus through blocking writes. FSL peripheral will
* automatically read from the FSL bus. Once all the inputs
* have been written, the output from the FSL peripheral is read
* into output arguments through blocking reads.
*
* Arguments:
*	 input_slot_id
*		 Compile time constant indicating FSL slot from
*		 which coprocessor read the input data. Defined in
*		 xparameters.h .
*	 output_slot_id
*		 Compile time constant indicating FSL slot into
*		 which the coprocessor write output data. Defined in
*		 xparameters.h .
*	 input_0    An array of unsigned integers. Array size is 12
*	 output_0   An array of unsigned integers. Array size is 12
*
* Caveats:
*    The output_slot_id and input_slot_id arguments must be
*    constants available at compile time. Do not pass
*    variables for these arguments.
*
*    Since this is a macro, using it too many times will
*    increase the size of your application. In such cases,
*    or when this macro is too simplistic for your
*    application you may want to create your own instance
*    specific driver function (not a macro) using the 
*    macros defined in this file and the slot
*    identifiers defined in xparameters.h .  Please see the
*    example code (aes_accel_app.c) for details.
*/

#define  aes_accel(\
		 input_slot_id,\
		 output_slot_id,\
		 input_0,      \
		 output_0       \
		 )\
{\
   int i;\
\
   for (i=0; i<12; i++)\
   {\
      write_into_fsl(input_0[i], input_slot_id);\
   }\
\
   for (i=0; i<12; i++)\
   {\
      read_from_fsl(output_0[i], output_slot_id);\
   }\
}

XStatus AES_ACCEL_SelfTest();

#endif 
