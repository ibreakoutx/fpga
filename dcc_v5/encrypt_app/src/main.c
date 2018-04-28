// Located in: microblaze_0/include/xparameters.h
#include "xparameters.h"
#include "stdio.h"
#include "mmu.h"
#include "aes_accel_fsl.h"
#include "queue.h"
#include "host_setup.h"
#include "check_result.h"

//====================================================

//Number of workitems in Q 
#define WORK_ITEMS_PER_Q 5

//Number of records (plaintxt 128 bit words in each workitem)
#define NUM_RECORDS    50000

int main (void) {

  int i;
  unsigned int  pt_base_addr ;
  unsigned int workq_doorbell ;
  unsigned int workq_pa ;
  unsigned int entry_va ,entry_pa ;
  unsigned int work_item_va, work_item_pa;
  unsigned int key_va,key_pa;
  unsigned int plaintxt_buffer_va ;
  unsigned int plaintxt_buffer_pa ;
  unsigned int result_buffer_va ; 
  unsigned int result_buffer_pa ;
  unsigned int compareq ;
  tlb_stats stats;
  int j=0;

  //Initialize TLB hit/miss stats
  stats.hits = 0;
  stats.misses=0;

  //Host Setup
  //1.Page table
  //2.Work Queue
  host_setup(WORK_ITEMS_PER_Q,
	     NUM_RECORDS, 
	     &pt_base_addr, 
	     &workq_doorbell,
	     &compareq
	     );

  xil_printf("\n=========== Process Work Q @ 0x%x ========\r\n",workq_doorbell);

   //All address pointers go thru translation
  
  //Translate work q ptr
  workq_pa = translate_va( (unsigned int *)pt_base_addr , workq_doorbell ,&stats ) ;

   while(1) {
     entry_va=(unsigned int)deq((queue *)workq_pa);
     if(entry_va == 0) break;

     //Translate queue entry ptr
     entry_pa = translate_va( (unsigned int *)pt_base_addr , entry_va ,&stats);

     //Translate work item ptr
     work_item_va = (unsigned int)(((q_entry *)entry_pa)->value);
     work_item_pa = translate_va( (unsigned int *)pt_base_addr ,work_item_va,&stats );

     //Translate AES 128 key ptr (within work item)
     key_va =  (unsigned int)(((encryption_work_item *)(work_item_pa))->key) ;
     key_pa = translate_va( (unsigned int *)pt_base_addr , key_va ,&stats);

     aes_key_write( (u128 *)key_pa ) ;

     printf("HW:AES128 encryption:Work Item[%d]....\r\n",j++);
     for(i=0;i<((encryption_work_item *)(work_item_pa))->count;i++) {

       //Translare ptr to plaintxt record
       plaintxt_buffer_va =  (unsigned int)(((encryption_work_item *)(work_item_pa))->plaintxt_buffer+i) ;
       plaintxt_buffer_pa = translate_va( (unsigned int *)pt_base_addr , plaintxt_buffer_va ,&stats);

       aes_data_write( (u128 *)plaintxt_buffer_pa );

       //Translare ptr where result is to be placed
       result_buffer_va =  (unsigned int)(((encryption_work_item *)(work_item_pa))->result_buffer+i) ;
       result_buffer_pa = translate_va( (unsigned int *)pt_base_addr , result_buffer_va ,&stats);

       aes_data_read( (u128 *)result_buffer_pa);
     }
     printf("\t\t\t\t.....%d Records Done\r\n",i--);
     printf("\t\tTLB Hits = %d, TLB Misses = %d\r\n\n",stats.hits,stats.misses);

   }
   free((queue *)workq_pa);

  print("=========== Process WorkQ DONE ================\r\n\n");

  check_result(compareq);

  print("\r\n --------- Exit Main ------------\r\n");
   return 0;
}

//====================================================
