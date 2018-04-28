#ifndef AES_ACCEL_FSL_H
#define AES_ACCEL_FSL_H

#include "fsl.h" 
#include "xparameters.h"
#include "encryption_work_item.h"
#include "aes_core.h"
#include <assert.h>

//Blocking write
#define aes_accel_fsl_write(val) putfsl(val,XPAR_FSL_AES_ACCEL_0_INPUT_SLOT_ID)

//Blocking Write with control signal asserted
#define aes_accel_fsl_cwrite(val) cputfsl(val,XPAR_FSL_AES_ACCEL_0_INPUT_SLOT_ID)

//Blocking read
#define aes_accel_fsl_read(val) getfsl(val,XPAR_FSL_AES_ACCEL_0_OUTPUT_SLOT_ID)

//non-blocking read
#define aes_accel_fsl_nread(val) ngetfsl(val,XPAR_FSL_AES_ACCEL_0_OUTPUT_SLOT_ID)

//Write AES Key
void aes_key_write ( u128 * key ) ;

//Write into AES_FSL fifo
void aes_data_write(u128 * wdata);

//Read from AES FSL fifo
void aes_data_read(u128 * rdata);

void aes_test(unsigned int num);
 
#endif 
