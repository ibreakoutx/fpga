
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

#include <assert.h>

#define NUM_CACHE_INDEX_ENTRIES 2048

typedef struct {
	unsigned char valid:1 ;
	unsigned char rank:2;
	unsigned int tag:9;
	unsigned int pa:20 ;
} raw_cache_data ;

//#define DEBUG true 

typedef struct {
  raw_cache_data way[4][NUM_CACHE_INDEX_ENTRIES];
} tlb_cache ;
	
//Update LRU after hit 
void lru_update( tlb_cache * cache ,char way, unsigned int cache_index) {
  int i;
  for ( i=0;i<4;i++) {

    //Zero out rank in way that was hit
    if ( cache->way[i][cache_index].valid && i == way ) {
      cache->way[i][cache_index].rank = 0;
      continue;
    }

    //For all ranks < way that was hit , increment
    if ( cache->way[i][cache_index].valid && (cache->way[i][cache_index].rank < cache->way[way][cache_index].rank ) )
      cache->way[i][cache_index].rank++;
  }
}

//Start of page table
void setup_page_tables(unsigned int * pt_base_addr ) {

  unsigned int i,j;
  
  //pt_base_addr must be 4 byte aligned
  assert( ((unsigned int)pt_base_addr & 0x03) == 0 ) ;

  for (i=0;i<1024;i++) {

    //Pointer arithmetic is based on the size of variable (4 bytes)
    //but not arithmetic that uses the value of the pointer as an integer,
    //hence on the rhs, must multiply increments by 4 (int = 4 bytes)
    *(pt_base_addr + i) = (unsigned int)pt_base_addr + 1024*4 + i*1024*4;

    for (j=0;j<1024;j++) {
      *(pt_base_addr + 1024 + i*1024 + j) = j + i*1024;
    }
  }
}

//Returns PA
unsigned int va_to_pa( unsigned int va_addr , unsigned int * pt_base_addr ) {

  //                              10 bits ( 31:22 )
  unsigned int * pde_ptr      = pt_base_addr + (va_addr>>22) ;

  unsigned int * pte_base_ptr = (unsigned int *)(*(pde_ptr));

  unsigned int * pte_ptr      = pte_base_ptr + (va_addr>>12 & 0x03ff) ;

  return (*(pte_ptr) << 12 ) | ( va_addr & 0x0fff) ;
}

//Returns way if cache hit (0-3), -1 if no hit
//pa in location pointed by pa_addr
int cache_read( unsigned int va_addr ,
		tlb_cache * cache
		, unsigned int * pa_addr ) {
				 
  unsigned int cache_index = (va_addr>>12) & 0x07ff ;
  unsigned int va_tag = va_addr >> 23 ;
  unsigned char i = 0;
  
  for ( i=0;i<4;i++) 
    if ( cache->way[i][cache_index].valid && cache->way[i][cache_index].tag == va_tag ) {
      *(pa_addr) = (cache->way[i][cache_index].pa << 12) | (va_addr & 0x0fff) ;
      lru_update( cache, i ,cache_index );
      #ifdef DEBUG
      printf("Cache Hit:Index=0x%x,way=%d\n",cache_index,i);
      #endif
      return i;
    }
  
  //No hit
  return -1;
}


//Returns way to which cache was written
int cache_write( unsigned int va_addr,
		 tlb_cache * cache,
                 unsigned int pa_addr ) {

  int i;
  unsigned int cache_index = (va_addr>>12) & 0x07ff ;
  unsigned int va_tag = va_addr >> 23 ;

  //Any ways that are free
  for ( i=0;i<4;i++) {
    if ( cache->way[i][cache_index].valid != 1 ) {
      cache->way[i][cache_index].valid = 1 ;
      cache->way[i][cache_index].tag = va_tag ;
      cache->way[i][cache_index].pa = pa_addr >> 12 ;
      cache->way[i][cache_index].rank = i;
      #ifdef DEBUG
      printf("Cache Write:Empty:Index=0x%x,way=%d\n",cache_index,i);
      #endif
      return i ;
    }
  }

  //Write into rank == 3 (LRU) and LRU update
  for ( i=0;i<4;i++) {
    if ( cache->way[i][cache_index].rank == 3 ) {
      cache->way[i][cache_index].valid = 1 ;
      cache->way[i][cache_index].tag = va_tag ;
      cache->way[i][cache_index].pa = pa_addr >> 12 ;
      lru_update(cache, i,cache_index );
      #ifdef DEBUG
      printf("Cache Write:Replacement:Index=0x%x,way=%d\n",cache_index,i);
      #endif
      return i ;
    }
  }
}

void init_cache(tlb_cache * cache ) {
  int i , j ;
  
  for (i=0;i<4;i++)
    for (j=0;j<NUM_CACHE_INDEX_ENTRIES;j++)
      cache->way[i][j].valid = 0;
  
}

int main () {

  unsigned int  * pt_base_addr ;
  unsigned int va_addr ,pa;
  int i;
  pt_base_addr = (unsigned int *)malloc( sizeof(unsigned int) * (1024+1024*1024));
  tlb_cache * cache = (tlb_cache *)malloc(sizeof(tlb_cache));
  int way ;
  int pa_addr ;

  init_cache(cache);
  setup_page_tables( pt_base_addr );

  va_addr = 0xdeadbeef ;
  way = cache_read( va_addr, cache, &pa_addr);

  if ( way == -1 ) 
    cache_write( va_addr, cache, va_to_pa(va_addr,pt_base_addr));
  else
    printf("va = %x, pa = %x, way = %d\n", va_addr, pa_addr,way);    

  va_addr = 0xdeadbeef ;
  way = cache_read( va_addr, cache, &pa_addr);

  if ( way == -1 ) 
    cache_write( va_addr, cache, va_to_pa(va_addr,pt_base_addr));
  else
    printf("va = %x, pa = %x, way = %d\n", va_addr, pa_addr,way);    

  while(1) {
    i++;
    if (( i % 10000000 ) == 0 )
      printf ( "count = %d\n",i);
    if ( i>100000000 ) break ;

    va_addr = random() ;

    way = cache_read( va_addr, cache, &pa_addr);

    if ( way == -1 ) {
      pa_addr = va_to_pa(va_addr,pt_base_addr);
      way=cache_write( va_addr, cache, pa_addr);
      //printf("Cache Miss:va = %x, pa = %x, way = %d\n", va_addr, pa_addr,way);    
    }
    //    else
    //printf("Cache Hit:va = %x, pa = %x, way = %d\n", va_addr, pa_addr,way);    

        assert ( va_addr == pa_addr ) ;
  }

  return 0;
}

