######################################################################
# Copyright (c) 2004 Xilinx, Inc.  All rights reserved. 
# 
# Xilinx, Inc. 
# XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
# COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS 
# ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
# STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
# IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
# FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION. 
# XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
# THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
# ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
# FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
# AND FITNESS FOR A PARTICULAR PURPOSE. 
# 
# $Id: Makefile,v 1.5.4.1 2005/02/09 02:50:06 rajn Exp $
######################################################################

# The following are defined in config.make
# LIBS - Do Build Profile Libraries 
include config.make

COMPILER=
ARCHIVER=
CP=cp
MV=mv
COMPILER_FLAGS=
EXTRA_COMPILER_FLAGS=
LIB=libxil.a

RELEASEDIR=../../../lib
INCLUDEDIR=../../../include
INCLUDES=-I./. -I${INCLUDEDIR}
BOOTOBJ = boot.o crt0.o

OUTS = *.o 

LIB_CSOURCES=*.c
LIB_SSOURCES=*.S
INCLUDEFILES=*.h

libs: $(LIBS)

standalone_libs:
	echo "Compiling bsp"
	$(COMPILER) $(COMPILER_FLAGS) $(EXTRA_COMPILER_FLAGS) $(INCLUDES) $(LIB_CSOURCES)
	$(COMPILER) $(COMPILER_FLAGS) $(EXTRA_COMPILER_FLAGS) $(INCLUDES) $(LIB_SSOURCES)
	$(ARCHIVER) -r ${RELEASEDIR}/${LIB} ${OUTS} 
	$(MV) ${BOOTOBJ} ${RELEASEDIR}
	make clean

profile_libs:
	(cd profile; $(MAKE) COMPILER_FLAGS="$(COMPILER_FLAGS)" EXTRA_COMPILER_FLAGS="$(EXTRA_COMPILER_FLAGS)" COMPILER="$(COMPILER)" ARCHIVER="$(ARCHIVER)" libs)

include: standalone_includes profile_includes

standalone_includes:
	${CP} ${INCLUDEFILES} ${INCLUDEDIR}

profile_includes:
	(cd profile; $(MAKE) COMPILER_FLAGS="$(COMPILER_FLAGS)" EXTRA_COMPILER_FLAGS="$(EXTRA_COMPILER_FLAGS)" COMPILER="$(COMPILER)" ARCHIVER="$(ARCHIVER)" include)

clean:
	rm -rf ${OUTS}
	(cd profile; $(MAKE) COMPILER_FLAGS="$(COMPILER_FLAGS)" EXTRA_COMPILER_FLAGS="$(EXTRA_COMPILER_FLAGS)" COMPILER="$(COMPILER)" ARCHIVER="$(ARCHIVER)" clean)
