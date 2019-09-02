/*
 * Projector Screen Controller
 *
 * Copyright (c) 2019 Chris Luke. Licensed under SHL-2.0.
 * https://github.com/flirbleoss/projector-screen-controller
 */

#include "config.h"
#include <xc.h>
#include <stdint.h>
#include "pjs.h"

// Incremented by a timer. See TMR1_INTERVAL.
volatile uint8_t tick;


/* Initialize the hardware peripherals.
 * 
 * Clock source and speed is set by CONFIG bits in pic_config.c
 *
 * Timers:
 * TMR0: Button de-bouncing.
 * TMR1: Interval timer used to manage motor run-time.
 *
 * Pins:
 * RB4,5,6,7 are outputs that drive 4 relays, that drive motors.
 * RC0,1,2,3 are button inputs. They need weak pull-ups and interrupts.
 * RC4,5,6,7 are two sets of UART rx,tx.
 * RA0,1,3 are attached to the ICSP header.
 * RA4 may be an LED in future.
 */
static void init(void) {
    // Disable unused modules
    PMD2 = 0xff;        // DAC, ADC, CMP, ZCD
    PMD3 = 0xff;        // PWM, CCP
    PMD5 = 0xff;        // CLC

    // Input pin re-mapping
    RX1DTPPS = 0x16;    // UART 1 RX on RC6
    TX1CKPPS = 0x14;    // UART 1 TX on RC4
    RX2DTPPS = 0x17;    // UART 2 RX on RC7
    TX2CKPPS = 0x15;    // UART 2 TX on RC5

    RC4PPS = 0x0f;      // RC4 -> TX1
    RC5PPS = 0x11;      // RC5 -> TX2

    // No more port re-mapping
    PPSLOCK = 0x55;     // Unlock the register
    PPSLOCK = 0xaa;     // Unlock the register
    PPSLOCKbits.PPSLOCKED = 1;  // Lock port maps

    // I/O setup
    LATB = 0x00;        // Make sure all outputs low (relays are off at start)
    WPUC = 0x0f;        // RC0,1,2,3 have weak pull-ups
    TRISA = 0xfb;       // RA2 is output
    TRISB = 0x00;       // Port B is all outputs
    TRISC = 0xff;       // Port C is all inputs (uart will override tx pins))

    // Setup interrupt-on-change for RC0,1,2,3
    IOCCP = 0x0f;       // IOC on rising edge of RC0,1,2,3
    IOCCN = 0x00;       // No IOC on any falling edge
    IOCCF = 0;
    IOCIF = 0;
    IOCIE = 1;          // IOC on

    // Setup UART1
    // TODO
    RC2IE = 1;          // Interrupt on receive

    // Setup UART2
    // TODO
    RC1IE = 1;          // Interrupt on receive

    // Setup Timer1 for our tick
    T1CLKbits.CS = SET_TMR1_CS;
    T1CONbits.CKPS = SET_TMR1_PS;
    T1CONbits.nT1SYNC = SET_TMR1_SYNC;
    RESET_TMR1();
    T1GCONbits.GE = 0;  // no gate
    TMR1IE = 1;         // enable interrupt
    TMR1ON = 1;         // enable timer

    // Setup Timer0 for de-bouncing, but don't start it
    T0CON0bits.T016BIT = 1;
    T0CON1bits.T0CS = SET_TMR0_CS;
    T0CON1bits.T0CKPS = SET_TMR0_PS;

    // Let the interrupts loose
    PEIE = 1;
    GIE = 1;

    // Reset our flags/values
    tick = 0;
}


// Fire it all up. This function is called when the processor starts up.
// It has to program any required peripherals and then run the program loop.
void main(void) {
    // Initialize the peripherals
    init();
    
    while (1) {
        // Iterate on controller operations
        // do_controller();

#ifdef USE_WATCHDOG
        // Let the puppy know we're alive
        CLRWDT();
#endif /* USE_WATCHDOG */
    }
}


// Interrupt handler; invoked by the processor whenever an interrupt
// occurs, here we have to work out which peripheral triggered the
// event and act accordingly.
static void interrupt interrupt_handler(void) {
    // Timer1 expired? This is our tick
    if (TMR1IE && TMR1IF) {
        // Reset the timer
        RESET_TMR1();

        // Tock the tick
        ++tick;

        // TODO check the tick, see if we need to do something
    }

    // Timer0 expired? This is a button de-bounce delay
    if (TMR0IE && TMR0IF) {
        // Disable the timer
        DISABLE_TMR0();

        // Do something with it
        // check_buttons();
    }

    // Input line changed?
    if (IOCIE && IOCIF) {
        // Button pressed?
        if (IOCCF) {
            // Reset timer0. This is to de-bounce the press
            RESET_TMR0();

            // Reset the runtime counter
            tick = 0;

            // Reset our trigger
            // TODO section 17.3.1 (page 211) talks about using xor/and to avoid
            // missing subsequent triggers
            IOCCF = 0;
        }

        // Reset the interrupt flag
        IOCIF = 0;
    }

    // UART1 receive?
    if (RC1IE && RC1IF) {
        // uart_read(1);

        // Read all the buffered bytes to clear the flag
    }

    // UART2 receive?
    if (RC2IE && RC2IF) {
        // uart_read(2);

        // Read all the buffered bytes to clear the flag
    }
}
