#ifndef _HOST_SETUP_H_
#define _HOST_SETUP_H_

#include "stdlib.h"
#include "stdio.h"
#include "mmu.h"
#include "aes_accel_fsl.h"
#include "queue.h"

void host_setup(int num_work_items_per_q, int num_records,
		unsigned int * pt_base_pa,//page table base address
		unsigned int * workq_doorbell ,
		unsigned int * compareq );

#endif
