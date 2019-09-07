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

// Button de-bounce
volatile bit b_1up, b_1dn, b_2up, b_2dn;

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
static void hardware_init(void) {
    // Disable unused modules
    PMD2 = 0xff;        // DAC, ADC, CMP, ZCD
    PMD3 = 0xff;        // PWM, CCP
    PMD5 = 0xff;        // CLC

    // Disable ADC inputs; these are enabled by default
    ANSELA = 0;
    ANSELB = 0;
    ANSELC = 0;

    // Pin re-mapping
    SSP1SSPPS = 0x00;   // Move SS1 away from RC6
    RC4PPS = 0x0f;      // RC4 -> UART 1 TX
    RC5PPS = 0x11;      // RC5 -> UART 2 TX
    RX1DTPPS = 0x16;    // RC6 -> UART 1 RX
    RX2DTPPS = 0x17;    // RC7 -> UART 2 RX
    TX1CKPPS = 0x14;    // Not used, but aligns with UART 1 RX
    TX2CKPPS = 0x15;    // Not used, but aligns with UART 2 RX

    // Disable any further more port re-mapping
    PPSLOCK = 0x55;     // Unlock the register
    PPSLOCK = 0xaa;     // Unlock the register
    PPSLOCKbits.PPSLOCKED = 1;  // Lock port maps

    // I/O setup
    LATB = 0x00;        // Make sure all outputs low (relays are off at start)
    WPUC = 0x0f;        // RC0,1,2,3 have weak pull-ups
    TRISA = 0xfb;       // RA2 is output
    TRISB = 0x00;       // Port B is all outputs
    TRISC = 0xcf;       // Port C is all inputs except UART TX pins

    // Setup interrupt-on-change for RC0,1,2,3
    IOCCP = 0x0f;       // IOC on rising edge of RC0,1,2,3
    IOCCN = 0x00;       // No IOC on any falling edge
    IOCCF = 0;
    IOCIF = 0;
    IOCIE = 1;          // IOC on

    // Setup UART1
    SP1BRG = UART_SPBRG;
    TX1STAbits.BRGH = UART_BRGH;
    BAUD1CONbits.BRG16 = UART_BRG16;
    TX1STAbits.TXEN = 1;    // Enable transmitter
    TX1STAbits.SYNC = 0;    // Asynchronous
    RC1STAbits.CREN = 1;    // Enable receiver
    RC1STAbits.SPEN = 1;    // Enable UART
    RC1IE = 1;              // Interrupt on receive

    // Setup UART2
    SP2BRG = UART_SPBRG;
    TX2STAbits.BRGH = UART_BRGH;
    BAUD2CONbits.BRG16 = UART_BRG16;
    TX2STAbits.TXEN = 1;    // Enable transmitter
    TX2STAbits.SYNC = 0;    // Asynchronous
    RC2STAbits.CREN = 1;    // Enable receiver
    RC2STAbits.SPEN = 1;    // Enable UART
    RC2IE = 1;              // Interrupt on receive

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
    hardware_init();
    uart_init();

    uart_send(UART_1, (char *) "#PJSC " VERSION " UART1\r\n");
    uart_send(UART_2, (char *) "#PJSC " VERSION " UART2\r\n");
#ifdef __DEBUG
    uart_send(UART_1, (char *) "#DEBUG\r\n");
    uart_send(UART_2, (char *) "#DEBUG\r\n");
#endif

    while (1) {
        // Iterate on controller operations
        // do_controller();

#ifdef USE_WATCHDOG
        // Let the puppy know we're alive
        CLRWDT();
#endif /* USE_WATCHDOG */

#ifdef TEST1
        // Test 1: Alternating pattern on the LEDs/Relays
        LATB = 0xaa;
        __delay_ms(100);
        LATB = 0x55;
        __delay_ms(100);
#endif /* TEST1 */

#ifdef TEST2
        // Test 2: Echo back characters received on UART1
        while (!uart_recvempty(UART_1)) {
            unsigned char ch = uart_recvch(UART_1, 0);
            uart_sendch(UART_1, ch);
        }
        while (!uart_recvempty(UART_2)) {
            unsigned char ch = uart_recvch(UART_2, 0);
            uart_sendch(UART_2, ch);
        }
#endif /* TEST 2 */
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
        // Check which buttons are still pressed
        b_1up = RC0;
        b_1dn = RC1;
        b_2up = RC2;
        b_2dn = RC3;
    }

    // Input line changed?
    if (IOCIE && IOCIF) {
        // Button pressed?
        if (IOCCF) {
            // Reset timer0. This is to de-bounce the press
            RESET_TMR0();

            // Record which buttons are currently pressed
            b_1up = RC0;  // TODO Can we see which input lines triggered IRQ?
            b_1dn = RC1;  // IOCCFbits.IOCCF0 etc
            b_2up = RC2;
            b_2dn = RC3;

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
        // Reading all the buffered bytes clears the interrupt flag
        uart_int_recv(UART_1);
    }

    // UART1 can transmit?
    if (TX1IE && TX1IF) {
        // Disable further TX-ready interrupts; will re-enable later if needed
        TX1IE = 0;
        TX1IF = 0;

        uart_int_send(UART_1);
    }

    // UART2 receive?
    if (RC2IE && RC2IF) {
        // Reading all the buffered bytes clears the flag
        uart_int_recv(UART_2);
    }

    // UART2 can transmit?
    if (TX2IE && TX2IF) {
        // Disable further TX-ready interrupts; will re-enable later if needed
        TX2IE = 0;
        TX2IF = 0;

        uart_int_send(UART_2);
    }

}
