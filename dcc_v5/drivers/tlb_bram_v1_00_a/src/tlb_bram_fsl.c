#include "tlb_bram_fsl.h"

void tlb_bram_test() {

  int tcnt = 2048 ;
  int i;
  char j;
  unsigned int data=0;
  unsigned int rdata;

  //Write in bram
  for (i=0;i<tcnt;i++) {
    if ( i % 256 == 0 )
      printf("tlb_bram_test:Write:Tcnt=%d\r\n",i);
    for(j=0;j<4;j++) {
      data++;
      //printf("Bram Write:Way%d:Addr=%x:Data=%x\r\n",3-j,i,data);
      tlb_bram_write(j,i,data);
    }
  }

  data = 0;
  for (i=0;i<tcnt;i++) {
    if ( i % 256 == 0 )
      printf("tlb_bram_test:Read:Tcnt=%d\r\n",i);
    for (j=0;j<4;j++) {
      data++;
      tlb_bram_read(j,i,&rdata);
      if ( data == rdata ) {
	//printf("Bram Read:Way%d:Addr=%x:Data=%x\r\n",3-j,i,rdata);
	;
      }
      else
	printf("ERROR:Bram Read:Way%d:Addr=%x:Data=%x (Expect=%x)\r\n",j,i,rdata,data);
    }
  }

}


void tlb_bram_simple(int tcnt, char way) {

  int i;
  char j;
  int data=0;
  unsigned int rdata;

  //Write in bram
  for (i=0;i<tcnt;i++) {

      data++;
      printf("Bram Write:Way%d:Addr=%x:Data=%x\r\n",way,i,data);
      tlb_bram_write(way,i,data);

      tlb_bram_read(way,i,&rdata);
      printf("Bram Read:Way%d:Addr=%x:Data=%x\r\n",way,i,rdata);
 
  }
}


void tlb_bram_write(unsigned char way,
		    unsigned int addr,
		    unsigned int data) {
  
  unsigned char way_select = 1;
  way_select <<= way ;
  
  unsigned int fsl_data = way_select ;
  fsl_data <<= 28;
  fsl_data |= addr ;
  //  printf("\ttlb_bram_write:fsl_addr=%x\r\n",fsl_data);

  tlb_bram_fsl_cwrite(fsl_data);
  tlb_bram_fsl_write(data);

}

//Data returned in array rdata (must be of size 4 at least)
void tlb_bram_read(unsigned char way, unsigned int addr, unsigned int * rdata) {

  unsigned int rval ;
  char i ;
  unsigned char way_select = 1;
  way_select <<= way ;
  
  unsigned int fsl_data = way_select ;

  fsl_data <<= 28;
  fsl_data |= addr ;

  tlb_bram_fsl_write(fsl_data);

  tlb_bram_fsl_read(rval);
  *(rdata) = rval ;

  /*
  tlb_bram_fsl_read(rval);
  *(rdata++) = rval ;

  tlb_bram_fsl_read(rval);
  *(rdata++) = rval ;

  tlb_bram_fsl_read(rval);
  *(rdata++) = rval ;
  */

}


