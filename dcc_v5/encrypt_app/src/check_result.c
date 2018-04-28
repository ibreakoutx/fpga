#include "check_result.h"

static AES_KEY  db_encrypt_key;

void check_result(unsigned int compareq) {

   q_entry * entry ;
   encryption_work_item * work_item ;
   int j=0;
   int i;

   while(1) {
     entry=deq((queue*)compareq);
     if(entry == 0) break;
     work_item = (encryption_work_item *)entry->value;

     AES_set_encrypt_key(work_item->key->bytes, 128, &db_encrypt_key);

     printf("Check_Result:Work Item[%d]:SW Compare ...\r\n",j++);
     for(i=0;i<work_item->count;i++) {  
       u128 sw_compare ;
       AES_encrypt((work_item->plaintxt_buffer+i)->bytes, 
		   sw_compare.bytes,
		   &db_encrypt_key);
       assert ( equal_u128 ( work_item->result_buffer+i, &sw_compare ) );
     }
     printf("\t\t\t\t... %d Records OK\r\n",i--);

     free_encryption_work_item(work_item);
     free(entry);
   }
   free((queue *)compareq);
}

