
#include "lfsr_random.h"

//Returns the next number in the lfsr sequence
int lfsr_random(int lfsr) {
  return( (lfsr >> 1) ^ (-(signed int)(lfsr & 1) & 0xd0000001u));
}

