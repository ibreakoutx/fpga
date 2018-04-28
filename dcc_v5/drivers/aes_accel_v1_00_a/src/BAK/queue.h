#ifndef __QUEUE_H__
#define __QUEUE_H__

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

typedef struct {
  void * value ;
  void * next ;
} q_entry ;

typedef struct {
  unsigned int count ;
  q_entry * head ;
  q_entry * tail ;
} queue ;

//Initialize count = 0
queue * init_queue ();

//Enqueue at tail
void enq( queue * qptr , q_entry * entry ) ;

//Dequeues from head
//Returns 0 if queue empty
q_entry * deq( queue * qptr) ;

#endif
