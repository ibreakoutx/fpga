#ifndef _MMU_H_
#define _MMU_H_
/*
Setup a 2 level page table translation structure
for 32 bit VA to PA, just below top of dram
Level 1 translation : 10 bits
Level 2 translation : 10 bits
4K pages

For now VA = PA translation
*/

/*
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
*/

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "tlb_bram_fsl.h"

//#define DEBUG true 
#define NUM_CACHE_INDEX_ENTRIES 2048

typedef struct {
  unsigned int hits;
  unsigned int misses;
} tlb_stats ;

typedef struct {
	unsigned char valid:1 ;
	unsigned char rank:2;
	unsigned int tag:9;
	unsigned int pa:20 ;
} raw_cache_data ;

//Union to help parse cache line fields
typedef union {
  unsigned int dw ;
  raw_cache_data cache_line ;
} parse_cache_line ;

typedef struct {
  raw_cache_data way[4][NUM_CACHE_INDEX_ENTRIES];
} tlb_cache ;
	
//Update LRU after hit 
void lru_update( tlb_cache * cache ,char way, unsigned int cache_index) ;

//Start of page table
void setup_page_tables(unsigned int * pt_base_addr ) ;

//Returns PA
unsigned int table_walk( unsigned int va_addr , unsigned int * pt_base_addr ) ;

//Returns way if cache hit (0-3), -1 if no hit
//pa in location pointed by pa_addr
int cache_read( unsigned int va_addr ,
		tlb_cache * cache
		,unsigned int * pa_addr ) ;

//Returns way to which cache was written
int cache_write( unsigned int va_addr,
		 tlb_cache * cache,
                 unsigned int pa_addr ) ;

void init_cache(tlb_cache * cache ) ;

int tlb_cache_read( unsigned int va_addr ,
		    unsigned int * pa_addr ) ;

//Returns way to which cache was written
int tlb_cache_write( unsigned int va_addr,
		     unsigned int pa_addr ) ;

//Update LRU after hit 
void tlb_lru_update( char way, unsigned int cache_index) ;

void tlb_test();

//translate va
unsigned int translate_va (unsigned int * pt_base_addr, 
			   unsigned int va_addr, tlb_stats * stats) ;

#endif
