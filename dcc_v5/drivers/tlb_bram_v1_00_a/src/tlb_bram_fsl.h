#ifndef TLB_FSL_BRAM_H
#define TLB_FSL_BRAM_H

#include "fsl.h" 
#include "xparameters.h"
#include <stdio.h>

#define tlb_bram_fsl_write(val) putfsl(val,XPAR_FSL_TLB_BRAM_0_INPUT_SLOT_ID)
#define tlb_bram_fsl_cwrite(val) cputfsl(val,XPAR_FSL_TLB_BRAM_0_INPUT_SLOT_ID)

#define tlb_bram_fsl_read(val) getfsl(val,XPAR_FSL_TLB_BRAM_0_OUTPUT_SLOT_ID)

#define tlb_bram_fsl_nread(val) ngetfsl(val,XPAR_FSL_TLB_BRAM_0_OUTPUT_SLOT_ID)

void tlb_bram_test() ;
void tlb_bram_simple(int tcnt, char way) ;

void tlb_bram_write(unsigned char way,
		    unsigned int addr,
		    unsigned int data) ;

//Data returned in array rdata (must be of size 4 at least)
void tlb_bram_read(unsigned char way, 
		   unsigned int addr, 
		   unsigned int * rdata) ;
 
#endif 
