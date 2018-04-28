#include "host_setup.h"

//====================================================

void host_setup(int num_work_items_per_q, int num_records,
		unsigned int * pt_base_pa,//page table base address
		unsigned int * workq_doorbell , //pointer to workq
		unsigned int * comp_q ) {//queue to check results

  int i;
  
   print("=========== HOST Setup Begin ================\r\n");
   //This section mimics what the host cpu would setup.

   //Get Base_addr for Page Tables
   unsigned int  * pt_base_addr ;
   pt_base_addr = (unsigned int *)malloc( sizeof(unsigned int) * (1024+1024*1024));
   assert( pt_base_addr != 0 );   

   //Page table setup
   setup_page_tables( pt_base_addr );   
   xil_printf ("Page Tables: base_address = 0x%x\r\n\n",pt_base_addr);

   //Setup Work Queue
   xil_printf ("setup_work_queue: %d work items each with %d records\r\n",
	       num_work_items_per_q,num_records);

   queue * workq = init_queue();
   queue * compareq = init_queue();
   q_entry * entry ;
   encryption_work_item * work_item ;

   for(i=0;i<num_work_items_per_q;i++) {
     work_item = (encryption_work_item *)work_setup(num_records);
     entry = (q_entry *)malloc(sizeof(q_entry));
     assert( entry != 0);
     entry->value = (void *)work_item;
     enq(workq,entry);
     enq(compareq,entry);
   }
   xil_printf ("\t\t\t....done\r\n\n");
   xil_printf ("setup_work_queue: Queue Ptr(VA) = 0x%x\r\n\n",workq);

   *(pt_base_pa) = (unsigned int)pt_base_addr;
   *(workq_doorbell)= (unsigned int)workq;
   *(comp_q) = (unsigned int)compareq;
   print("=========== HOST Setup End   ================\r\n");
}

//====================================================
