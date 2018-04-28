#include "encryption_work_item.h"

void * display_u128( const char * str, u128 * value ) {
  int i ;

  printf("%s::u128:dw:",str);
  for(i=0;i<4;i++)
    printf("0x%x, ",value->dw[i]);
  printf ("\r\n");

  /*
  printf("%s::u128:bytes:",str);
  for(i=0;i<16;i++)
    printf("0x%x, ",value->bytes[i]);
  printf ("\r\n");
  */

}


//Returns 1 if equal
int equal_u128( u128 * v1, u128 * v2 ) {
  int i;
  for(i=0;i<4;i++) {
    if (v1->dw[i] != v2->dw[i]) {
      display_u128("Not Equal",v1);
      display_u128("Not Equal",v2);
      return 0;
    }
  }
  return 1;
}
						  
void free_encryption_work_item( encryption_work_item * p ) {
  free(p->key);
  free(p->plaintxt_buffer);
  free(p->result_buffer);
}
