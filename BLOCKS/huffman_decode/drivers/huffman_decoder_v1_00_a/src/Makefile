##############################################################################
##
## ***************************************************************************
## **                                                                       **
## ** Copyright (c) 1995-2005 Xilinx, Inc.  All rights reserved.            **
## **                                                                       **
## ** You may copy and modify these files for your own internal use solely  **
## ** with Xilinx programmable logic devices and Xilinx EDK system or       **
## ** create IP modules solely for Xilinx programmable logic devices and    **
## ** Xilinx EDK system. No rights are granted to distribute any files      **
## ** unless they are distributed in Xilinx programmable logic devices.     **
## **                                                                       **
## ***************************************************************************
##
##############################################################################
## Filename:          F:\fpga\proj\huffman_decode\drivers\huffman_decoder_v1_00_a\src\Makefile
## Description:       Microprocessor Driver Makefile
## Date:              Fri Apr 22 16:41:35 2005 (by Create and Import Peripheral Wizard)
##############################################################################

COMPILER=
ARCHIVER=
CP=cp
COMPILER_FLAGS=
EXTRA_COMPILER_FLAGS=
LIB=libxil.a

RELEASEDIR=../../../lib
INCLUDEDIR=../../../include
INCLUDES=-I./. -I${INCLUDEDIR}

INCLUDEFILES=*.h
LIBSOURCES=*.c
OUTS = *.o

libs:
	echo "Compiling huffman_decoder"
	$(COMPILER) $(COMPILER_FLAGS) $(EXTRA_COMPILER_FLAGS) $(INCLUDES) $(LIBSOURCES)
	$(ARCHIVER) -r ${RELEASEDIR}/${LIB} ${OUTS}
	make clean

include:
	${CP} $(INCLUDEFILES) $(INCLUDEDIR)

clean:
	rm -rf ${OUTS}
