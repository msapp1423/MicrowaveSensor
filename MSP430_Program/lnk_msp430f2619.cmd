/******************************************************************************/
/* lnk_msp430f2619.cmd - LINKER COMMAND FILE FOR LINKING MSP430F2619 PROGRAMS     */
/*                                                                            */
/*   Usage:  lnk430 <obj files...>    -o <out file> -m <map file> lnk.cmd     */
/*           cl430  <src files...> -z -o <out file> -m <map file> lnk.cmd     */
/*                                                                            */
/*----------------------------------------------------------------------------*/
/* These linker options are for command line linking only.  For IDE linking,  */
/* you should set your linker options in Project Properties                   */
/* -c                                               LINK USING C CONVENTIONS  */
/* -stack  0x0100                                   SOFTWARE STACK SIZE       */
/* -heap   0x0100                                   HEAP AREA SIZE            */
/*                                                                            */
/*----------------------------------------------------------------------------*/


/****************************************************************************/
/* SPECIFY THE SYSTEM MEMORY MAP                                            */
/****************************************************************************/

MEMORY
{
    SFR                     : origin = 0x0000, length = 0x0010
    PERIPHERALS_8BIT        : origin = 0x0010, length = 0x00F0
    PERIPHERALS_16BIT       : origin = 0x0100, length = 0x0100
    RAM                     : origin = 0x1100, length = 0x1000
    INFOA                   : origin = 0x10C0, length = 0x0040
    INFOB                   : origin = 0x1080, length = 0x0040
    INFOC                   : origin = 0x1040, length = 0x0040
    INFOD                   : origin = 0x1000, length = 0x0040
    FLASH                   : origin = 0x2100, length = 0xDEBE
    FLASH2                  : origin = 0x10000,length = 0x10000
    INT00                   : origin = 0xFFC0, length = 0x0002
    INT01                   : origin = 0xFFC2, length = 0x0002
    INT02                   : origin = 0xFFC4, length = 0x0002
    INT03                   : origin = 0xFFC6, length = 0x0002
    INT04                   : origin = 0xFFC8, length = 0x0002
    INT05                   : origin = 0xFFCA, length = 0x0002
    INT06                   : origin = 0xFFCC, length = 0x0002
    INT07                   : origin = 0xFFCE, length = 0x0002
    INT08                   : origin = 0xFFD0, length = 0x0002
    INT09                   : origin = 0xFFD2, length = 0x0002
    INT10                   : origin = 0xFFD4, length = 0x0002
    INT11                   : origin = 0xFFD6, length = 0x0002
    INT12                   : origin = 0xFFD8, length = 0x0002
    INT13                   : origin = 0xFFDA, length = 0x0002
    INT14                   : origin = 0xFFDC, length = 0x0002
    INT15                   : origin = 0xFFDE, length = 0x0002
    INT16                   : origin = 0xFFE0, length = 0x0002
    INT17                   : origin = 0xFFE2, length = 0x0002
    INT18                   : origin = 0xFFE4, length = 0x0002
    INT19                   : origin = 0xFFE6, length = 0x0002
    INT20                   : origin = 0xFFE8, length = 0x0002
    INT21                   : origin = 0xFFEA, length = 0x0002
    INT22                   : origin = 0xFFEC, length = 0x0002
    INT23                   : origin = 0xFFEE, length = 0x0002
    INT24                   : origin = 0xFFF0, length = 0x0002
    INT25                   : origin = 0xFFF2, length = 0x0002
    INT26                   : origin = 0xFFF4, length = 0x0002
    INT27                   : origin = 0xFFF6, length = 0x0002
    INT28                   : origin = 0xFFF8, length = 0x0002
    INT29                   : origin = 0xFFFA, length = 0x0002
    INT30                   : origin = 0xFFFC, length = 0x0002
    RESET                   : origin = 0xFFFE, length = 0x0002
}

/****************************************************************************/
/* SPECIFY THE SECTIONS ALLOCATION INTO MEMORY                              */
/****************************************************************************/

SECTIONS
{
    .bss        : {} > RAM                /* GLOBAL & STATIC VARS              */
    .data       : {} > RAM                /* GLOBAL & STATIC VARS              */
    .sysmem     : {} > RAM                /* DYNAMIC MEMORY ALLOCATION AREA    */
    .stack      : {} > RAM (HIGH)         /* SOFTWARE SYSTEM STACK             */

    .text       : {}>> FLASH | FLASH2     /* CODE                              */
    .text:_isr  : {} > FLASH              /* ISR CODE SPACE                    */
    .cinit      : {} > FLASH              /* INITIALIZATION TABLES             */
//#ifdef (__LARGE_DATA_MODEL__)
    .const      : {} > FLASH | FLASH2     /* CONSTANT DATA                     */
//#else
//    .const      : {} > FLASH              /* CONSTANT DATA                     */
//#endif
    .cio        : {} > RAM                /* C I/O BUFFER                      */

    .pinit      : {} > FLASH              /* C++ CONSTRUCTOR TABLES            */
    .init_array : {} > FLASH              /* C++ CONSTRUCTOR TABLES            */
    .mspabi.exidx : {} > FLASH            /* C++ CONSTRUCTOR TABLES            */
    .mspabi.extab : {} > FLASH            /* C++ CONSTRUCTOR TABLES            */

    .infoA     : {} > INFOA              /* MSP430 INFO FLASH MEMORY SEGMENTS */
    .infoB     : {} > INFOB
    .infoC     : {} > INFOC
    .infoD     : {} > INFOD

    /* MSP430 INTERRUPT VECTORS          */
    RESERVED0    : { * ( .int00 ) } > INT00 type = VECT_INIT
    RESERVED1    : { * ( .int01 ) } > INT01 type = VECT_INIT
    RESERVED2    : { * ( .int02 ) } > INT02 type = VECT_INIT
    RESERVED3    : { * ( .int03 ) } > INT03 type = VECT_INIT
    RESERVED4    : { * ( .int04 ) } > INT04 type = VECT_INIT
    RESERVED5    : { * ( .int05 ) } > INT05 type = VECT_INIT
    RESERVED6    : { * ( .int06 ) } > INT06 type = VECT_INIT
    RESERVED7    : { * ( .int07 ) } > INT07 type = VECT_INIT
    RESERVED8    : { * ( .int08 ) } > INT08 type = VECT_INIT
    RESERVED9    : { * ( .int09 ) } > INT09 type = VECT_INIT
    RESERVED10   : { * ( .int10 ) } > INT10 type = VECT_INIT
    RESERVED11   : { * ( .int11 ) } > INT11 type = VECT_INIT
    RESERVED12   : { * ( .int12 ) } > INT12 type = VECT_INIT
    RESERVED13   : { * ( .int13 ) } > INT13 type = VECT_INIT
    DAC12        : { * ( .int14 ) } > INT14 type = VECT_INIT
    DMA          : { * ( .int15 ) } > INT15 type = VECT_INIT
    USCIAB1TX    : { * ( .int16 ) } > INT16 type = VECT_INIT
    USCIAB1RX    : { * ( .int17 ) } > INT17 type = VECT_INIT
    PORT1        : { * ( .int18 ) } > INT18 type = VECT_INIT
    PORT2        : { * ( .int19 ) } > INT19 type = VECT_INIT
    RESERVED20   : { * ( .int20 ) } > INT20 type = VECT_INIT
    ADC12        : { * ( .int21 ) } > INT21 type = VECT_INIT
    USCIAB0TX    : { * ( .int22 ) } > INT22 type = VECT_INIT
    USCIAB0RX    : { * ( .int23 ) } > INT23 type = VECT_INIT
    TIMERA1      : { * ( .int24 ) } > INT24 type = VECT_INIT
    TIMERA0      : { * ( .int25 ) } > INT25 type = VECT_INIT
    WDT          : { * ( .int26 ) } > INT26 type = VECT_INIT
    COMPARATORA   : { * ( .int27 ) } > INT27 type = VECT_INIT
    TIMERB1      : { * ( .int28 ) } > INT28 type = VECT_INIT
    TIMERB0      : { * ( .int29 ) } > INT29 type = VECT_INIT
    NMI          : { * ( .int30 ) } > INT30 type = VECT_INIT
    .reset       : {}               > RESET  /* MSP430 RESET VECTOR         */ 
}

/****************************************************************************/
/* INCLUDE PERIPHERALS MEMORY MAP                                           */
/****************************************************************************/

-l msp430f2619.cmd

