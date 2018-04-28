#include "queue.h"


queue * init_queue() {

  queue * qptr = (queue *)malloc(sizeof(queue));
  assert(qptr != 0);
  qptr->count = 0;
  return qptr ;

}


//Enque at tail
void enq( queue * qptr , q_entry * entry ) {

  if (qptr->count) 
    qptr->tail->next = (void *)entry ;
  else //First queue entry
    qptr->head = entry ;

  qptr->tail = entry;
  qptr->count++;  
}
  
//Deque at head, return 0 (null) ptr if empty
q_entry * deq( queue * qptr ) {
  
  q_entry * head_entry ;

  if ( qptr->count ) {
    head_entry = qptr->head;
    qptr->head = (q_entry *)(qptr->head->next );
    qptr->count--;
    return head_entry ;
  }
  else
    return 0 ;
}

typedef union {
  unsigned int dw[4];
  unsigned char bytes[16];
} u128 ;
 
/*
int main() {

  int i ;
  int * i_ptr ;

  queue * int_q = init_queue();
  q_entry * entry ;

  for(i=0;i<=100000;i++) {

    i_ptr = (int *)malloc(sizeof(int));
    entry = (q_entry *)malloc(sizeof(q_entry));

    *i_ptr = i;
    entry->value = (void *)i_ptr;

    enq(int_q,entry);
  }


  while(1) {
    entry=deq(int_q);
    if(entry == 0) break;

    //printf("q value[%d] = %d\n",i,*((int *)(entry->value)));
    free(entry->value);
    free(entry);
  }


  i_ptr = (int *)malloc(sizeof(int));
  *(i_ptr) = 0x11223344;

  char * ptr ;

  ptr = (char * )i_ptr ;

  ptr++;
  ptr++;
  ptr++;

  u128  data ;

  for(i=0;i<16;i++) 
    data.bytes[i] = i ;

  printf("dw[0]=0x%x\r\n",data.dw[0]);
  printf("dw[1]=0x%x\r\n",data.dw[1]);
  printf("dw[2]=0x%x\r\n",data.dw[2]);
  printf("dw[3]=0x%x\r\n",data.dw[3]);

  return 0;

}
*/
