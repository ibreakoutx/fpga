#################################################################
# Makefile generated by Xilinx Platform Studio 
# Project:G:\work\dcc_v5\system.xmp
#
# WARNING : This file will be re-generated every time a command
# to run a make target is invoked. So, any changes made to this  
# file manually, will be lost when make is invoked next. 
#################################################################

XILINX_EDK_DIR = /cygdrive/g/Xilinx/10.1/EDK
NON_CYG_XILINX_EDK_DIR = g:/Xilinx/10.1/EDK

SYSTEM = system

MHSFILE = system.mhs

MSSFILE = system.mss

FPGA_ARCH = virtex5

DEVICE = xc5vlx110tff1136-1

LANGUAGE = vhdl

SEARCHPATHOPT = 

SUBMODULE_OPT = 

PLATGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(SUBMODULE_OPT)

LIBGEN_OPTIONS = -mhs $(MHSFILE) -p $(DEVICE) $(SEARCHPATHOPT) \
                   $(MICROBLAZE_0_LIBG_OPT)

VPGEN_OPTIONS = -p $(DEVICE) $(SEARCHPATHOPT)

MANAGE_FASTRT_OPTIONS = -reduce_fanout no

OBSERVE_PAR_OPTIONS = -error yes

TESTAPP_MEMORY_OUTPUT_DIR = TestApp_Memory
TESTAPP_MEMORY_OUTPUT = $(TESTAPP_MEMORY_OUTPUT_DIR)/executable.elf

TESTAPP_PERIPHERAL_OUTPUT_DIR = TestApp_Peripheral
TESTAPP_PERIPHERAL_OUTPUT = $(TESTAPP_PERIPHERAL_OUTPUT_DIR)/executable.elf

ENCRYPT_APP_OUTPUT_DIR = encrypt_app
ENCRYPT_APP_OUTPUT = $(ENCRYPT_APP_OUTPUT_DIR)/executable.elf

MICROBLAZE_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/microblaze/mb_bootloop.elf
PPC405_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc405/ppc_bootloop.elf
PPC440_BOOTLOOP = $(XILINX_EDK_DIR)/sw/lib/ppc440/ppc440_bootloop.elf
BOOTLOOP_DIR = bootloops

MICROBLAZE_0_BOOTLOOP = $(BOOTLOOP_DIR)/microblaze_0.elf
MICROBLAZE_0_XMDSTUB = microblaze_0/code/xmdstub.elf

BRAMINIT_ELF_FILES =   $(MICROBLAZE_0_BOOTLOOP) 
BRAMINIT_ELF_FILE_ARGS =   -pe microblaze_0  $(MICROBLAZE_0_BOOTLOOP) 

ALL_USER_ELF_FILES = $(TESTAPP_MEMORY_OUTPUT) $(TESTAPP_PERIPHERAL_OUTPUT) $(ENCRYPT_APP_OUTPUT) 

SIM_CMD = vsim

BEHAVIORAL_SIM_SCRIPT = simulation/behavioral/$(SYSTEM)_setup.do

STRUCTURAL_SIM_SCRIPT = simulation/structural/$(SYSTEM)_setup.do

TIMING_SIM_SCRIPT = simulation/timing/$(SYSTEM)_setup.do

DEFAULT_SIM_SCRIPT = $(BEHAVIORAL_SIM_SCRIPT)

MIX_LANG_SIM_OPT = -mixed yes

SIMGEN_OPTIONS = -p $(DEVICE) -lang $(LANGUAGE) $(SEARCHPATHOPT) $(BRAMINIT_ELF_FILE_ARGS) $(MIX_LANG_SIM_OPT)  -s mti -X G:/work/dcc_v5/ -E G:/work/dcc_v5/


LIBRARIES =  \
       microblaze_0/lib/libxil.a 
VPEXEC = virtualplatform/vpexec.exe

LIBSCLEAN_TARGETS = microblaze_0_libsclean 

PROGRAMCLEAN_TARGETS = TestApp_Memory_programclean TestApp_Peripheral_programclean encrypt_app_programclean 

CORE_STATE_DEVELOPMENT_FILES = 

WRAPPER_NGC_FILES = implementation/microblaze_0_wrapper.ngc \
implementation/mb_plb_wrapper.ngc \
implementation/ilmb_wrapper.ngc \
implementation/dlmb_wrapper.ngc \
implementation/dlmb_cntlr_wrapper.ngc \
implementation/ilmb_cntlr_wrapper.ngc \
implementation/lmb_bram_wrapper.ngc \
implementation/rs232_uart_1_wrapper.ngc \
implementation/ddr2_sdram_wrapper.ngc \
implementation/clock_generator_0_wrapper.ngc \
implementation/debug_module_wrapper.ngc \
implementation/proc_sys_reset_0_wrapper.ngc \
implementation/aes_accel_0_to_microblaze_0_wrapper.ngc \
implementation/aes_accel_0_wrapper.ngc \
implementation/microblaze_0_to_aes_accel_0_wrapper.ngc \
implementation/tlb_bram_0_to_microblaze_0_wrapper.ngc \
implementation/tlb_bram_0_wrapper.ngc \
implementation/microblaze_0_to_tlb_bram_0_wrapper.ngc

POSTSYN_NETLIST = implementation/$(SYSTEM).ngc

SYSTEM_BIT = implementation/$(SYSTEM).bit

DOWNLOAD_BIT = implementation/download.bit

SYSTEM_ACE = implementation/$(SYSTEM).ace

UCF_FILE = data/system.ucf

BMM_FILE = implementation/$(SYSTEM).bmm

BITGEN_UT_FILE = etc/bitgen.ut

XFLOW_OPT_FILE = etc/fast_runtime.opt
XFLOW_DEPENDENCY = __xps/xpsxflow.opt $(XFLOW_OPT_FILE)

XPLORER_DEPENDENCY = __xps/xplorer.opt
XPLORER_OPTIONS = -p $(DEVICE) -uc $(SYSTEM).ucf -bm $(SYSTEM).bmm -max_runs 7

FPGA_IMP_DEPENDENCY = $(BMM_FILE) $(POSTSYN_NETLIST) $(UCF_FILE) $(XFLOW_DEPENDENCY)

#################################################################
# SOFTWARE APPLICATION TESTAPP_MEMORY
#################################################################

TESTAPP_MEMORY_SOURCES = /cygdrive/g/work/dcc_v5/TestApp_Memory/src/TestApp_Memory.c 

TESTAPP_MEMORY_HEADERS = 

TESTAPP_MEMORY_CC = mb-gcc
TESTAPP_MEMORY_CC_SIZE = mb-size
TESTAPP_MEMORY_CC_OPT = -O2
TESTAPP_MEMORY_CFLAGS = 
TESTAPP_MEMORY_CC_SEARCH = # -B
TESTAPP_MEMORY_LIBPATH = -L./microblaze_0/lib/ # -L
TESTAPP_MEMORY_INCLUDES = -I./microblaze_0/include/ # -I
TESTAPP_MEMORY_LFLAGS = # -l
TESTAPP_MEMORY_LINKER_SCRIPT = /cygdrive/g/work/dcc_v5/TestApp_Memory/src/TestApp_Memory_LinkScr.ld
TESTAPP_MEMORY_LINKER_SCRIPT_FLAG = -Wl,-T -Wl,$(TESTAPP_MEMORY_LINKER_SCRIPT) 
TESTAPP_MEMORY_CC_DEBUG_FLAG =  -g 
TESTAPP_MEMORY_CC_PROFILE_FLAG = # -pg
TESTAPP_MEMORY_CC_GLOBPTR_FLAG= # -mxl-gp-opt
TESTAPP_MEMORY_MODE = executable
TESTAPP_MEMORY_LIBG_OPT = -$(TESTAPP_MEMORY_MODE) microblaze_0
TESTAPP_MEMORY_CC_INFERRED_FLAGS= -mno-xl-soft-mul -mxl-pattern-compare -mcpu=v7.10.d 
TESTAPP_MEMORY_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
TESTAPP_MEMORY_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
TESTAPP_MEMORY_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
TESTAPP_MEMORY_OTHER_CC_FLAGS= $(TESTAPP_MEMORY_CC_GLOBPTR_FLAG)  \
                  $(TESTAPP_MEMORY_CC_START_ADDR_FLAG) $(TESTAPP_MEMORY_CC_STACK_SIZE_FLAG) $(TESTAPP_MEMORY_CC_HEAP_SIZE_FLAG)  \
                  $(TESTAPP_MEMORY_CC_INFERRED_FLAGS)  \
                  $(TESTAPP_MEMORY_LINKER_SCRIPT_FLAG) $(TESTAPP_MEMORY_CC_DEBUG_FLAG) $(TESTAPP_MEMORY_CC_PROFILE_FLAG) 

#################################################################
# SOFTWARE APPLICATION TESTAPP_PERIPHERAL
#################################################################

TESTAPP_PERIPHERAL_SOURCES = /cygdrive/g/work/dcc_v5/TestApp_Peripheral/src/TestApp_Peripheral.c /cygdrive/g/work/dcc_v5/TestApp_Peripheral/src/xuartlite_selftest_example.c 

TESTAPP_PERIPHERAL_HEADERS = /cygdrive/g//work/dcc_v5/TestApp_Peripheral/src/uartlite_header.h 

TESTAPP_PERIPHERAL_CC = mb-gcc
TESTAPP_PERIPHERAL_CC_SIZE = mb-size
TESTAPP_PERIPHERAL_CC_OPT = -O2
TESTAPP_PERIPHERAL_CFLAGS = 
TESTAPP_PERIPHERAL_CC_SEARCH = # -B
TESTAPP_PERIPHERAL_LIBPATH = -L./microblaze_0/lib/ # -L
TESTAPP_PERIPHERAL_INCLUDES = -I./microblaze_0/include/  -ITestApp_Peripheral/src/ # -I
TESTAPP_PERIPHERAL_LFLAGS = # -l
TESTAPP_PERIPHERAL_LINKER_SCRIPT = /cygdrive/g/work/dcc_v5/TestApp_Peripheral/src/TestApp_Peripheral_LinkScr.ld
TESTAPP_PERIPHERAL_LINKER_SCRIPT_FLAG = -Wl,-T -Wl,$(TESTAPP_PERIPHERAL_LINKER_SCRIPT) 
TESTAPP_PERIPHERAL_CC_DEBUG_FLAG =  -g 
TESTAPP_PERIPHERAL_CC_PROFILE_FLAG = # -pg
TESTAPP_PERIPHERAL_CC_GLOBPTR_FLAG= # -mxl-gp-opt
TESTAPP_PERIPHERAL_MODE = executable
TESTAPP_PERIPHERAL_LIBG_OPT = -$(TESTAPP_PERIPHERAL_MODE) microblaze_0
TESTAPP_PERIPHERAL_CC_INFERRED_FLAGS= -mno-xl-soft-mul -mxl-pattern-compare -mcpu=v7.10.d 
TESTAPP_PERIPHERAL_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
TESTAPP_PERIPHERAL_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
TESTAPP_PERIPHERAL_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
TESTAPP_PERIPHERAL_OTHER_CC_FLAGS= $(TESTAPP_PERIPHERAL_CC_GLOBPTR_FLAG)  \
                  $(TESTAPP_PERIPHERAL_CC_START_ADDR_FLAG) $(TESTAPP_PERIPHERAL_CC_STACK_SIZE_FLAG) $(TESTAPP_PERIPHERAL_CC_HEAP_SIZE_FLAG)  \
                  $(TESTAPP_PERIPHERAL_CC_INFERRED_FLAGS)  \
                  $(TESTAPP_PERIPHERAL_LINKER_SCRIPT_FLAG) $(TESTAPP_PERIPHERAL_CC_DEBUG_FLAG) $(TESTAPP_PERIPHERAL_CC_PROFILE_FLAG) 

#################################################################
# SOFTWARE APPLICATION ENCRYPT_APP
#################################################################

ENCRYPT_APP_SOURCES = /cygdrive/g/work/dcc_v5/encrypt_app/src/check_result.c /cygdrive/g/work/dcc_v5/encrypt_app/src/host_setup.c /cygdrive/g/work/dcc_v5/encrypt_app/src/main.c /cygdrive/g/work/dcc_v5/encrypt_app/src/queue.c /cygdrive/g/work/dcc_v5/drivers/aes_accel_v1_00_a/src/aes_accel_fsl.c /cygdrive/g/work/dcc_v5/drivers/aes_accel_v1_00_a/src/aes_core.c /cygdrive/g/work/dcc_v5/drivers/aes_accel_v1_00_a/src/encryption_work_item.c /cygdrive/g/work/dcc_v5/drivers/aes_accel_v1_00_a/src/work_setup.c /cygdrive/g/work/dcc_v5/drivers/aes_accel_v1_00_a/src/lfsr_random.c /cygdrive/g/work/dcc_v5/drivers/tlb_bram_v1_00_a/src/tlb_bram_fsl.c /cygdrive/g/work/dcc_v5/drivers/tlb_bram_v1_00_a/src/mmu.c 

ENCRYPT_APP_HEADERS = /cygdrive/g//work/dcc_v5/encrypt_app/src/check_result.h /cygdrive/g//work/dcc_v5/encrypt_app/src/host_setup.h /cygdrive/g//work/dcc_v5/encrypt_app/src/queue.h /cygdrive/g//work/dcc_v5/drivers/aes_accel_v1_00_a/src/aes_core.h /cygdrive/g//work/dcc_v5/drivers/aes_accel_v1_00_a/src/encryption_work_item.h /cygdrive/g//work/dcc_v5/drivers/aes_accel_v1_00_a/src/lfsr_random.h /cygdrive/g//work/dcc_v5/drivers/aes_accel_v1_00_a/src/work_setup.h /cygdrive/g//work/dcc_v5/drivers/aes_accel_v1_00_a/src/aes_accel_fsl.h /cygdrive/g//work/dcc_v5/drivers/tlb_bram_v1_00_a/src/tlb_bram_fsl.h /cygdrive/g//work/dcc_v5/drivers/tlb_bram_v1_00_a/src/mmu.h 

ENCRYPT_APP_CC = mb-gcc
ENCRYPT_APP_CC_SIZE = mb-size
ENCRYPT_APP_CC_OPT = -O2
ENCRYPT_APP_CFLAGS = 
ENCRYPT_APP_CC_SEARCH = # -B
ENCRYPT_APP_LIBPATH = -L./microblaze_0/lib/ # -L
ENCRYPT_APP_INCLUDES = -I./microblaze_0/include/  -Iencrypt_app/src/ -Idrivers/aes_accel_v1_00_a/src/ -Idrivers/tlb_bram_v1_00_a/src/ # -I
ENCRYPT_APP_LFLAGS = # -l
ENCRYPT_APP_LINKER_SCRIPT = /cygdrive/g/work/dcc_v5/encrypt_app/encrypt_app_linker_script.ld
ENCRYPT_APP_LINKER_SCRIPT_FLAG = -Wl,-T -Wl,$(ENCRYPT_APP_LINKER_SCRIPT) 
ENCRYPT_APP_CC_DEBUG_FLAG =  -g 
ENCRYPT_APP_CC_PROFILE_FLAG = # -pg
ENCRYPT_APP_CC_GLOBPTR_FLAG= # -mxl-gp-opt
ENCRYPT_APP_MODE = executable
ENCRYPT_APP_LIBG_OPT = -$(ENCRYPT_APP_MODE) microblaze_0
ENCRYPT_APP_CC_INFERRED_FLAGS= -mno-xl-soft-mul -mxl-pattern-compare -mcpu=v7.10.d 
ENCRYPT_APP_CC_START_ADDR_FLAG=  #  # -Wl,-defsym -Wl,_TEXT_START_ADDR=
ENCRYPT_APP_CC_STACK_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_STACK_SIZE=
ENCRYPT_APP_CC_HEAP_SIZE_FLAG=  #  # -Wl,-defsym -Wl,_HEAP_SIZE=
ENCRYPT_APP_OTHER_CC_FLAGS= $(ENCRYPT_APP_CC_GLOBPTR_FLAG)  \
                  $(ENCRYPT_APP_CC_START_ADDR_FLAG) $(ENCRYPT_APP_CC_STACK_SIZE_FLAG) $(ENCRYPT_APP_CC_HEAP_SIZE_FLAG)  \
                  $(ENCRYPT_APP_CC_INFERRED_FLAGS)  \
                  $(ENCRYPT_APP_LINKER_SCRIPT_FLAG) $(ENCRYPT_APP_CC_DEBUG_FLAG) $(ENCRYPT_APP_CC_PROFILE_FLAG) 