#include "sortrecord_hw.h"

extern RECORD   db[MAXRECORD];
extern RECORD   PlainTxtdb[MAXRECORD];
extern RECORD   Mergeddb[MAXRECORD];

void sortrecord_hw(const unsigned char * gkey) {
  int num_fifo_fills ;
  int i ,j;
  int records_per_fill ;
  RECORD r ;
  set_global_key( XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR, gkey);

  set_start_index( XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR, 0);

  //set_start_index( XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR, MAXRECORD/2);

  //Enable zero_key bit and no compare
  //  write_control_reg( XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR, 0x7 );

  num_fifo_fills = MAXRECORD/128 ;
  if ( num_fifo_fills == 0 ) num_fifo_fills =1 ;
  
  if ( MAXRECORD < 128 ) records_per_fill = MAXRECORD ;
  else records_per_fill = 128 ;

  //Loop to decrypt and blocksort records 2 at a time
  for ( i=0;i<num_fifo_fills;i++) {

    for( j=0; j<records_per_fill; j++ ) {

      r.f1 = db[ i*records_per_fill + j ].f1;
      r.f2 = db[ i*records_per_fill + j ].f2;
      r.f3 = db[ i*records_per_fill + j ].f3;
      r.f4 = db[ i*records_per_fill + j ].f4;

      write_record_into_fifo( &r, (void *)XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR);
    }

    //printdb( db,0,MAXRECORD-1);

    for( j=0; j<records_per_fill; j++ ) {

      while ( HUFFMAN_ENCODE_TESTHARNESS_mReadFIFOEmpty(XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR) ) {
	;//xil_printf("**** read fifo empty ********\n\r");
      }

      read_record_from_fifo( &r, (void *)XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR) ;

      PlainTxtdb[ i*records_per_fill + j ].f1 = r.f1;
      PlainTxtdb[ i*records_per_fill + j ].f2 = r.f2;
      PlainTxtdb[ i*records_per_fill + j ].f3 = r.f3;
      PlainTxtdb[ i*records_per_fill + j ].f4 = r.f4;
    }
  }//for i

  //  printdb( PlainTxtdb,0,MAXRECORD-1);

  //Now invoke pure software mergesort
  //blocksize is 2.
  merge_all_sorted_blocks(BLOCKSIZE);

  //Encryption pass
  set_start_index( XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR, 0);

  //Reset index
  write_control_reg( XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR, 0x2 );

  //enable no compare bit
  write_control_reg( XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR, 0x1 );
  
  //Loop to encrypt and write out result data
  for ( i=0;i<num_fifo_fills;i++) {
    for( j=0; j<records_per_fill; j++ ) {

      r.f1 = PlainTxtdb[ i*records_per_fill + j ].f1;
      r.f2 = PlainTxtdb[ i*records_per_fill + j ].f2;
      r.f3 = PlainTxtdb[ i*records_per_fill + j ].f3;
      r.f4 = PlainTxtdb[ i*records_per_fill + j ].f4;

      write_record_into_fifo( &r, (void *)XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR);
    }

    for( j=0; j<records_per_fill; j++ ) {
      read_record_from_fifo( &r, (void *)XPAR_HUFFMAN_ENCODE_TESTHARNESS_1_BASEADDR ) ;

      db[ i*records_per_fill + j ].f1 = r.f1 ;
      db[ i*records_per_fill + j ].f2 = r.f2 ;
      db[ i*records_per_fill + j ].f3 = r.f3 ;
      db[ i*records_per_fill + j ].f4 = r.f4 ;
    }

  }//for i

}

void write_record_into_fifo( RECORD * r , void * baseaddr_p) {

  Xuint32 baseaddr ;
  //XASSERT_NONVOID(baseaddr_p != XNULL);
  baseaddr = (Xuint32)baseaddr_p ;

  //Write fifo with r->f1
  HUFFMAN_ENCODE_TESTHARNESS_mWriteToFIFO(baseaddr, r->f1);
  
  //Write fifo with r->f2
  HUFFMAN_ENCODE_TESTHARNESS_mWriteToFIFO(baseaddr, r->f2);
  
  //Write fifo with r->f3
  HUFFMAN_ENCODE_TESTHARNESS_mWriteToFIFO(baseaddr, r->f3);
  
  //Write fifo with r->f4
  HUFFMAN_ENCODE_TESTHARNESS_mWriteToFIFO(baseaddr, r->f4);
}


void read_record_from_fifo( RECORD * r , void * baseaddr_p) {

  Xuint32 baseaddr ;
  //  XASSERT_NONVOID(baseaddr_p != XNULL);
  baseaddr = (Xuint32)baseaddr_p ;

  //Read fifo with r.f1
  r->f1 = HUFFMAN_ENCODE_TESTHARNESS_mReadFromFIFO(baseaddr);
  
  //Read fifo with r->f2
  r->f2 = HUFFMAN_ENCODE_TESTHARNESS_mReadFromFIFO(baseaddr);

  //Read fifo with r->f3
  r->f3 = HUFFMAN_ENCODE_TESTHARNESS_mReadFromFIFO(baseaddr);
  
  //Read fifo with r->f4
  r->f4 = HUFFMAN_ENCODE_TESTHARNESS_mReadFromFIFO(baseaddr);
}

