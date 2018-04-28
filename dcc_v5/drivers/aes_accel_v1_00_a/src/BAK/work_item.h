#ifndef __WORK_ITEM_H__
#define __WORK_ITEM_H__

typedef union {
  unsigned int dw[4];
  unsigned char bytes[16];
} u128 ;

typedef struct {
  unsigned int * key ;//ptr to to 128 bit, 4 dw key
  unsigned int count ;
  u128 * plaintxt_buffer;
  u128 * result_buffer ;
} encryption_work_item ;

#endif

						  
