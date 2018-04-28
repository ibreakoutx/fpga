#include "aes_core.h"
#include "work_setup.h"
#include "queue.h"
#include "encryption_work_item.h"

unsigned char globalkey[16] = {0xB0, 0x1D, 0xFA, 0xCE, 
                               0x0D, 0xEC, 0x0D, 0xED, 
                               0x0B, 0xA1, 0x1A, 0xDE, 
                               0x0E, 0xFF, 0xEC, 0x70};

int main() {

  printf("Initializing work item\n");

  work_setup(globalkey);

  return 0;
}
