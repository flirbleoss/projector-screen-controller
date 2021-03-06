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

#ifdef USE_STDIO
#include <stdio.h>
#endif /* USE_STDIO */

#ifdef CLOCK_DEBUG
void clock_debug(void);
#endif /* CLOCK_DEBUG */

#ifdef TEST3
// Tick flag
volatile __bit ticked;
#endif

// Button de-bounce
static volatile __bit b_1upt, b_1dnt, b_2upt, b_2dnt;
static volatile __bit b_1upi, b_1dni, b_2upi, b_2dni;
static volatile __bit b_1up, b_1dn, b_2up, b_2dn;

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
    // Clock setup
    OSCENbits.EXTOEN = 1;
    OSCENbits.LFOEN = 1;

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
    IOCCN = 0x0f;       // IOC on falling edge of RC0,1,2,3
    IOCCP = 0x00;
    IOCCF = 0;
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
    T1GCONbits.GE = 0;  // No gate
    RESET_TMR1();       // Load the counter, reset the seen flag
    ENABLE_TMR1();      // Turn it on with interrupts

    // Setup Timer0 for button reading and de-bouncing
    T0CON0bits.T016BIT = 1; // 16-bit counter mode
    T0CON1bits.T0CS = SET_TMR0_CS;
    T0CON1bits.T0CKPS = SET_TMR0_PS;
    T0CON1bits.T0ASYNC = 1; // Don't synchronize with fOSC/4
    RESET_TMR0();       // Load the counter
    PAUSE_TMR0();       // Reset the flags (not seen, no interrupts)
    ENABLE_TMR0();      // Turn it on (do not touch flags)

    // Let the interrupts loose
    PEIE = 1;
    GIE = 1;
}


// Fire it all up. This function is called when the processor starts up.
// It has to program any required peripherals and then run the program loop.

void main(void) {
    // Initialize the peripherals
    hardware_init();
    uart_init();
    relay_init();
    control_init();

    uart_send(UART_1, (unsigned char *) "#PJSC " VERSION " UART1\r\n");
    uart_send(UART_2, (unsigned char *) "#PJSC " VERSION " UART2\r\n");
#ifdef CLOCK_DEBUG
    // Work out and print the current clock situation
    clock_debug();
#endif /* CLOCK_DEBUG */
#ifdef __DEBUG
    uart_send(UART_1, (unsigned char *) "#DEBUG\r\n");
    uart_send(UART_2, (unsigned char *) "#DEBUG\r\n");
#endif

#ifdef TEST3
    unsigned char t3 = 0;
#endif

    while (1) {
        // Iterate on controller operations
        command_check();
        relay_check();

        // Latch a copy of channel 1 buttons; this keeps us interrupt friendly
        char up, dn;
        di();
        up = b_1up; b_1up = 0;
        dn = b_1dn; b_1dn = 0;
        ei();

        // Check channel 1 buttons
        button_check_channel(RELAY_CH1, up, dn);

        // Latch a copy of channel 2 buttons; this keeps us interrupt friendly
        di();
        up = b_2up; b_2up = 0;
        dn = b_2dn; b_2dn = 0;
        ei();

        // Check channel 2 buttons
        button_check_channel(RELAY_CH2, up, dn);

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
            unsigned char ch = uart_recvch(UART_1, UART_NONBLOCK);
            uart_sendch(UART_1, ch);
        }
        while (!uart_recvempty(UART_2)) {
            unsigned char ch = uart_recvch(UART_2, UART_NONBLOCK);
            uart_sendch(UART_2, ch);
        }
#endif /* TEST 2 */

#ifdef TEST3
        // Test 3: Timer timing
        if (ticked) {
            t3++;
            LATB = t3 << 4;

            ticked = 0;
        }
#endif /* TEST3 */
    }
}


// Interrupt handler; invoked by the processor whenever an interrupt
// occurs, here we have to work out which peripheral triggered the
// event and act accordingly.

static void __interrupt() interrupt_handler(void) {
    // Timer1 expired? This is our tick
    if (TMR1IE && TMR1IF) {
        // Reset the timer
        RESET_TMR1();

#ifdef TEST3
        ticked = 1;
#endif

        // Relays, when enabled, run for a period of time
        relay_tick();
    }

    // Timer0 expired? This is a button de-bounce delay
    if (TMR0IE && TMR0IF) {
        // Disable the timer
        RESET_TMR0();
        PAUSE_TMR0();

        // For each input that was triggered, AND the current value of that
        // input with that at the time of trigger.
#define BT_TMR_CHECK(N, F) do { \
        if (b_ ## N ## t) { \
            b_ ## N = b_ ## N ## i; \
            b_ ## N &= ~(RC ## F); \
            b_ ## N ## t = b_ ## N ## i = 0; \
        } \
} while(0)

        BT_TMR_CHECK(1up, 0);
        BT_TMR_CHECK(1dn, 1);
#ifdef BOARD_REV_0_1
        // Board rev 0.1 has channel 2 buttons backwards
        BT_TMR_CHECK(2up, 3);
        BT_TMR_CHECK(2dn, 2);
#else
        BT_TMR_CHECK(2up, 2);
        BT_TMR_CHECK(2dn, 3);
#endif /* BOARD_REV_0_1 */
    }

    // Input line changed?
    if (IOCIE && IOCIF) {
        // Button pressed?
        if (IOCCF) {
            // Reset timer0. This is to de-bounce the press
            RESET_TMR0();
            RESUME_TMR0();

            // Record the state of any button that triggered an interrupt
            // TODO: Since we only interrupt on one edge, do we need to track
            // the value here or can we infer from the fact we saw an interrupt?
            // Avoids a race condition where bouncy inputs may trigger but read
            // 0 when we read it here.
#define BT_IOC_READ(N, F) do { \
            if (IOCCFbits.IOCCF ## F) { \
                b_ ## N ## t = 1; \
                b_ ## N ## i = ~(RC ## F); \
                IOCCFbits.IOCCF ## F = 0; \
            } \
} while(0)

            BT_IOC_READ(1up, 0);
            BT_IOC_READ(1dn, 1);
#ifdef BOARD_REV_0_1
            // Board rev 0.1 has channel 2 buttons backwards
            BT_IOC_READ(2up, 3);
            BT_IOC_READ(2dn, 2);
#else
            BT_IOC_READ(2up, 2);
            BT_IOC_READ(2dn, 3);
#endif /* BOARD_REV_0_1 */
        }
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

#ifdef CLOCK_DEBUG

void clock_debug(void) {
    // Work out and print the current clock situation
    char *str;
    int val;

    printf("#DBG Main osccilator: %s\r\n",
            (OSCCON3bits.ORDY ? "Ready" : "Not Ready"));

    switch (OSCCON2bits.COSC) {
    case 0b111:
        str = "EXTOSC";
        break;
    case 0b110:
        str = "HFINTOSC (1MHz)";
        break;
    case 0b101:
        str = "LFINTOSC";
        break;
    case 0b100:
        str = "SOSC";
        break;
    case 0b010:
        str = "EXTOSC with 4x PLL";
        break;
    case 0b001:
        str = "HFINTOSC with 2x PLL (32 MHz)";
        break;
    case 0b011:
    case 0b000:
    default:
        str = "Reserved";
        break;
    }
    printf("#DBG Clock source: %s\r\n", str);

    if (OSCCON2bits.CDIV <= 0b1001) {
        val = (int)(1 << OSCCON2bits.CDIV);
        printf("#DBG Clock divider: 1:%d\r\n", val);
    } else {
        printf("#DBG Clock divider: Reserved value\r\n");
    }

#define ISEN(e)  ((OSCENbits.e)   ? "Enabled," : "        " )
#define ISRDY(r) ((OSCSTATbits.r) ? "Ready"    : "Not ready")

    printf("#DBG EXTOSC:   %s %s\r\n", ISEN(EXTOEN), ISRDY(EXTOR));
    printf("#DBG HFINTOSC: %s %s\r\n", ISEN(HFOEN),  ISRDY(HFOR));
    printf("#DBG MFINTOSC: %s %s\r\n", ISEN(MFOEN),  ISRDY(MFOR));
    printf("#DBG LFINTOSC: %s %s\r\n", ISEN(LFOEN),  ISRDY(LFOR));
    printf("#DBG SOC:      %s %s\r\n", ISEN(SOSCEN), ISRDY(SOR));
    printf("#DBG CRCOSC:   %s %s\r\n", ISEN(ADOEN),  ISRDY(ADOR));

    if (OSCFRQbits.HFFRQ == 0b111) {
        printf("#DBG HFINTOSC Frequency: Reserved\r\n");
    } else {
        printf("#DBG HFINTOSC Frequency: %dMHz\r\n", (1 << OSCFRQbits.HFFRQ));
    }

}
#endif /* CLOCK_DEBUG */
