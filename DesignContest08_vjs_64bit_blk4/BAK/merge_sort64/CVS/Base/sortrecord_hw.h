#ifndef __sortrecord_hw_h__
#define __sortrecord_hw_h__

#include "recordio.h"
#include "xparameters.h"
#include "huffman_encode_testharness.h"

#include "msort.h"

void sortrecord_hw(const unsigned char * gkey) ;

void write_record_into_fifo( RECORD * r , void * baseaddr_p) ;

void read_record_from_fifo( RECORD * r , void * baseaddr_p) ;

#endif
