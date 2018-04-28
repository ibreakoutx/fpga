#ifndef __WORK_SETUP_H__
#define __WORK_SETUP_H__

#include "encryption_work_item.h"
#include <stdlib.h>
#include "lfsr_random.h"
#include <assert.h>

//Returns a pointer to a work item
encryption_work_item * work_setup(unsigned int num_records) ;

#endif
