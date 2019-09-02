/*
 * Projector Screen Controller
 * 
 * Copyright (c) 2019 Chris Luke. Licensed under SHL-2.0.
 * https://github.com/flirbleoss/projector-screen-controller
 */

#ifndef _CONFIG_H
#define _CONFIG_H

#include <stdint.h>

#ifdef	__cplusplus
extern "C" {
#endif

// Whether we want to use the watchdog timer
//#define USE_WATCHDOG


//#define _XTAL_FREQ (32000000)    // 32MHz

// Values for Timer1
#define SET_TMR1_CS (0b11)      // LFINTOSC = 31KHz
#define SET_TMR1_SYNC (0b1)     // Use clock directly (no sync)
#define SET_TMR1_PS (0b00)      // 1:1 prescaler
#define TMR1_COUNT_MAX (62000)  // Interrupt every 2 seconds
#define TMR1_INTERVAL (TMR1_COUNT_MAX/31000)
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
#define SET_TMR0_PS (0b1111)     // 1:32768 prescaler (~4ms?)

#define RESET_TMR0() do { \
        TMR0 = 0; \
        TMR0IF = 0; \
        TMR0IE = 1; \
    } while (0)

#define DISABLE_TMR0() do { \
        TMR0IE = 0; \
        TMR0IF = 0; \
    } while (0)


#ifdef	__cplusplus
}
#endif

#endif	/* _CONFIG_H */