#include "work_setup.h"

//#define DEBUG true 

static unsigned char gkey[16] = {0xB0, 0x1D, 0xFA, 0xCE, 
				 0x0D, 0xEC, 0x0D, 0xED, 
				 0x0B, 0xA1, 0x1A, 0xDE, 
				 0x0E, 0xFF, 0xEC, 0x70};

//Setup work
encryption_work_item * work_setup( unsigned int num_records ) {

  int lfsr;
  int i,j;

#ifdef DEBUG
  lfsr = 0;
#else
  lfsr = 0xdeadbeef;
#endif

  encryption_work_item * work_item = (encryption_work_item *)(malloc(sizeof(encryption_work_item)));
  assert( work_item != 0);

  u128 * key128 = (u128 *)malloc(sizeof(u128));
  assert( key128 != 0 );

  for(i=0;i<16;i++)
    key128->bytes[i] = gkey[i];

  work_item->key = key128;
  work_item->count = num_records;

  work_item->plaintxt_buffer = (u128 *)(malloc(sizeof(u128)*num_records));
  assert(work_item->plaintxt_buffer != 0);

  work_item->result_buffer   = (u128 *)(malloc(sizeof(u128)*num_records));
  assert(work_item->result_buffer != 0);

  for(i=0;i<work_item->count;i++) {
    
    for (j=0;j<4;j++) {
#ifdef DEBUG
      lfsr++;
#else
      lfsr = lfsr_random(lfsr) ;
#endif
      (work_item->plaintxt_buffer+i)->dw[j] = lfsr;
    }

  }
  return work_item ;
}
