#include "aes_accel_fsl.h"

static AES_KEY  db_encrypt_key;

void aes_key_write ( u128 * key ) {
  int i=0 ;
  aes_accel_fsl_cwrite(key->dw[i]);
  for (i=1;i<4;i++)
    aes_accel_fsl_write(key->dw[i]);
}


void aes_data_write ( u128 * wdata ) {
  int i ;
  for (i=0;i<4;i++)
    aes_accel_fsl_write(wdata->dw[i]);
}


void aes_data_read ( u128 * rdata ) {
  int i ;
  for (i=0;i<4;i++)
    aes_accel_fsl_read(rdata->dw[i]);
}


void aes_test( unsigned int num_records ) {
  int i;

  encryption_work_item * work_item = (encryption_work_item *)work_setup(num_records);

  AES_set_encrypt_key(work_item->key->bytes, 128, &db_encrypt_key);

  aes_key_write( work_item->key ) ;

  printf("aes_test:HW encryption start....\r\n");
  for(i=0;i<work_item->count;i++) {
    aes_data_write( work_item->plaintxt_buffer+i );
    aes_data_read( work_item->result_buffer+i);
  }
  printf("..........end\r\n");

  printf("aes_test:Compare start....\r\n");
  for(i=0;i<work_item->count;i++) {  
    u128 sw_compare ;
    AES_encrypt((work_item->plaintxt_buffer+i)->bytes, 
		sw_compare.bytes,
		&db_encrypt_key);
    assert ( equal_u128 ( work_item->result_buffer+i, &sw_compare ) );
  }
  printf("......end : OK\r\n");
  /*
  display_u128( "Key", work_item->key ) ;

  for(i=0;i<work_item->count;i++) {
    display_u128("Plaintxt",work_item->plaintxt_buffer+i);
  }

  for(i=0;i<work_item->count;i++) {
    display_u128("HW Encrypted",work_item->result_buffer+i);
  }

  for(i=0;i<work_item->count;i++) {
    display_u128("SW Encrypted",work_item->compare_buffer+i);
  }

  AES_encrypt((work_item->result_buffer+i)->bytes, 
		(work_item->plaintxt_buffer+i)->bytes,
		&db_encrypt_key);

  for(i=0;i<work_item->count;i++) {
    display_u128("Decrypted",work_item->plaintxt_buffer+i);
  }
  */
}

