/*
 * Projector Screen Controller
 * 
 * Copyright (c) 2019 Chris Luke. Licensed under SHL-2.0.
 * https://github.com/flirbleoss/projector-screen-controller
 */

#ifndef _CONFIG_H
#define _CONFIG_H

#include <stdint.h>

#define VERSION "0.1"

// Which version of the board to target
#define BOARD_REV_0_1
//#define BOARD_REV_0_2

#ifndef __DEBUG
// Whether we want to use the watchdog timer
#define USE_WATCHDOG
#endif

// Basic test code; not for production use
//#define TEST1   // Alternating LED/Relay pattern
//#define TEST2   // UART1/2 echoback
//#define TEST3   // Timer rollover

#define _XTAL_FREQ      (32000000)  // 32MHz

// Values for Timer1
#define LFINTOSC_FREQ   (31000)
#define SET_TMR1_CS     (0b0100)    // LFINTOSC = 31KHz
#define SET_TMR1_SYNC    (1)        // Use clock directly (no sync)
#define SET_TMR1_PS     (0b00)      // 1:1 prescaler
#define TMR1_COUNT_MAX  (62000)     // Interrupt every 2 seconds
#define TMR1_INTERVAL   (TMR1_COUNT_MAX/LFINTOSC_FREQ)

#define SET_TMR1_RESET_LSB ((uint8_t)((65536-TMR1_COUNT_MAX) & 0x00ff))
#define SET_TMR1_RESET_MSB ((uint8_t)((65536-TMR1_COUNT_MAX) >> 8))

#define RESET_TMR1() do { \
        TMR1H = SET_TMR1_RESET_MSB; \
        TMR1L = SET_TMR1_RESET_LSB; \
        TMR1IF = 0; \
    } while (0)

#define DISABLE_TMR1() do { \
        TMR1IE = 0; \
        TMR1IF = 0; \
    } while (0)


// Values for Timer0
#define SET_TMR0_CS (0b010)     // Internal clock (Fosc/4)
#define SET_TMR0_PS (0b1111)    // 1:32768 prescaler (~4ms?)

#define RESET_TMR0() do { \
        TMR0H = 0xff; \
        TMR0L = 0xff; \
        TMR0IF = 0; \
        TMR0IE = 1; \
    } while (0)

#define DISABLE_TMR0() do { \
        TMR0IE = 0; \
        TMR0IF = 0; \
    } while (0)


// UART settings
#define UART_BRGH 1     // low/high baud rate
#define UART_BRG16 1    // 8/16 bit timer
#define UART_SPBRG 832  // 9600 baud with 32MHz fOSC

// UART handling settings
#define UART_TX_BUF 16  // Send buffer size, per-UART
#define UART_RX_BUF 8   // Receive buffer size, per-UART

// Optional functions
//#define WANT_UART_RECVCOUNT

#endif	/* _CONFIG_H */