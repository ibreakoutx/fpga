#ifndef __ENCRYPTION_WORK_ITEM_H__
#define __ENCRYPTION_WORK_ITEM_H__

#include <stdlib.h>

typedef union {
  unsigned int dw[4];
  unsigned char bytes[16];
} u128 ;

typedef struct {
  u128 * key ;//ptr to to 128 bit, 4 dw key
  unsigned int count ;
  u128 * plaintxt_buffer;
  u128 * result_buffer ;
} encryption_work_item ;

void * display_u128( const char * str, u128 * value ) ;

int equal_u128( u128 * , u128 *);

void free_encryption_work_item( encryption_work_item * p ) ;

#endif

						  
