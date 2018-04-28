
/*******************************************************************
*
* CAUTION: This file is automatically generated by libgen.
* Version: Xilinx EDK 10.1.03 EDK_K_SP3.6
* DO NOT EDIT.
*
* Copyright (c) 2005 Xilinx, Inc.  All rights reserved. 
* 
* Description: Driver parameters
*
*******************************************************************/

#define STDIN_BASEADDRESS 0x40600000
#define STDOUT_BASEADDRESS 0x40600000

/******************************************************************/

/* Definitions for driver OPBARB */
#define XPAR_XOPBARB_NUM_INSTANCES 1

/* Definitions for peripheral OPB */
#define XPAR_OPB_BASEADDR 0xFFFFFFFF
#define XPAR_OPB_HIGHADDR 0x00000000
#define XPAR_OPB_DEVICE_ID 0
#define XPAR_OPB_NUM_MASTERS 1


/******************************************************************/

/* Definitions for driver UARTLITE */
#define XPAR_XUARTLITE_NUM_INSTANCES 1

/* Definitions for peripheral RS232_UART_1 */
#define XPAR_RS232_UART_1_BASEADDR 0x40600000
#define XPAR_RS232_UART_1_HIGHADDR 0x4060FFFF
#define XPAR_RS232_UART_1_DEVICE_ID 0
#define XPAR_RS232_UART_1_BAUDRATE 9600
#define XPAR_RS232_UART_1_USE_PARITY 0
#define XPAR_RS232_UART_1_ODD_PARITY 0
#define XPAR_RS232_UART_1_DATA_BITS 8


/******************************************************************/


/* Canonical definitions for peripheral RS232_UART_1 */
#define XPAR_UARTLITE_0_DEVICE_ID XPAR_RS232_UART_1_DEVICE_ID
#define XPAR_UARTLITE_0_BASEADDR 0x40600000
#define XPAR_UARTLITE_0_HIGHADDR 0x4060FFFF
#define XPAR_UARTLITE_0_BAUDRATE 9600
#define XPAR_UARTLITE_0_USE_PARITY 0
#define XPAR_UARTLITE_0_ODD_PARITY 0
#define XPAR_UARTLITE_0_DATA_BITS 8
#define XPAR_UARTLITE_0_SIO_CHAN 0


/******************************************************************/

/* Definitions for driver GPIO */
#define XPAR_XGPIO_NUM_INSTANCES 2

/* Definitions for peripheral LEDS_4BIT */
#define XPAR_LEDS_4BIT_BASEADDR 0x40000000
#define XPAR_LEDS_4BIT_HIGHADDR 0x4000FFFF
#define XPAR_LEDS_4BIT_DEVICE_ID 0
#define XPAR_LEDS_4BIT_INTERRUPT_PRESENT 0
#define XPAR_LEDS_4BIT_IS_DUAL 0


/* Definitions for peripheral DIPSWS_4BIT */
#define XPAR_DIPSWS_4BIT_BASEADDR 0x40020000
#define XPAR_DIPSWS_4BIT_HIGHADDR 0x4002FFFF
#define XPAR_DIPSWS_4BIT_DEVICE_ID 1
#define XPAR_DIPSWS_4BIT_INTERRUPT_PRESENT 0
#define XPAR_DIPSWS_4BIT_IS_DUAL 0


/******************************************************************/

/* Definitions for driver HUFFMAN_ENCODE_TESTHARNESS */
#define XPAR_HUFFMAN_ENCODE_TESTHARNESS_NUM_INSTANCES 1

/* Definitions for peripheral HUFFMAN_ENCODE_TESTHARNESS_0 */
#define XPAR_HUFFMAN_ENCODE_TESTHARNESS_0_DEVICE_ID 0
#define XPAR_HUFFMAN_ENCODE_TESTHARNESS_0_BASEADDR 0x7EA00000
#define XPAR_HUFFMAN_ENCODE_TESTHARNESS_0_HIGHADDR 0x7EA0FFFF


/******************************************************************/


/* Definitions for peripheral PLB_BRAM_IF_CNTLR_1 */
#define XPAR_PLB_BRAM_IF_CNTLR_1_BASEADDR 0xfffe0000
#define XPAR_PLB_BRAM_IF_CNTLR_1_HIGHADDR 0xffffffff


/******************************************************************/

#define XPAR_CPU_PPC405_CORE_CLOCK_FREQ_HZ 100000000

/******************************************************************/

#define XPAR_CPU_ID 0
#define XPAR_PPC405_ID 0
#define XPAR_PPC405_CORE_CLOCK_FREQ_HZ 100000000
#define XPAR_PPC405_ISOCM_DCR_BASEADDR 0x00000010
#define XPAR_PPC405_ISOCM_DCR_HIGHADDR 0x00000013
#define XPAR_PPC405_DSOCM_DCR_BASEADDR 0x00000020
#define XPAR_PPC405_DSOCM_DCR_HIGHADDR 0x00000023
#define XPAR_PPC405_DISABLE_OPERAND_FORWARDING 1
#define XPAR_PPC405_DETERMINISTIC_MULT 0
#define XPAR_PPC405_MMU_ENABLE 1
#define XPAR_PPC405_DCR_RESYNC 0
#define XPAR_PPC405_HW_VER "2.00.c"

/******************************************************************/

