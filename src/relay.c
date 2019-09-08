/*
 * Projector Screen Controller
 *
 * Copyright (c) 2019 Chris Luke. Licensed under SHL-2.0.
 * https://github.com/flirbleoss/projector-screen-controller
 */

#include "config.h"
#include <xc.h>
#include "pjs.h"

static volatile unsigned char channel1_timer;
static volatile unsigned char channel2_timer;

#define RELAY_TIME (30 / TMR1_INTERVAL)

// Relay handling

void relay_init(void) {
    channel1_timer = channel2_timer = 0;
}

void relay_report(char uart, unsigned char cmdch) {
    // Report current relay status to given UART
    uart_sendch(uart, cmdch);

    uart_sendch(uart, '1');
    if (!LATBbits.LATB4 && !LATBbits.LATB5) uart_sendch(uart, 'S');
    else if (LATBbits.LATB4 && !LATBbits.LATB5) uart_sendch(uart, 'U');
    else if (!LATBbits.LATB4 && LATBbits.LATB5) uart_sendch(uart, 'D');
    else uart_sendch(uart, '?');

    uart_sendch(uart, '2');
    if (!LATBbits.LATB6 && !LATBbits.LATB7) uart_sendch(uart, 'S');
    else if (LATBbits.LATB6 && !LATBbits.LATB7) uart_sendch(uart, 'U');
    else if (!LATBbits.LATB6 && LATBbits.LATB7) uart_sendch(uart, 'D');
    else uart_sendch(uart, '?');

    uart_sendch(uart, '\n');
    uart_sendch(uart, '\r');
}

void relay_control(relay_channel_t channel, relay_direction_t direction) {
    unsigned char time = (direction == RELAY_STOP ? 0 : RELAY_TIME);
    unsigned char a = (direction == RELAY_UP);
    unsigned char b = (direction == RELAY_DOWN);

    switch (channel) {
    case RELAY_CH1:
        LATBbits.LATB4 = a;
        LATBbits.LATB5 = b;
        di();
        channel1_timer = time;
        ei();
        break;

    case RELAY_CH2:
        LATBbits.LATB6 = a;
        LATBbits.LATB7 = b;
        di();
        channel2_timer = time;
        ei();
        break;
    }
}

// Interrupt handler

void relay_tick(void) {
    if (channel1_timer) {
        --channel1_timer;
        if(!channel1_timer) {
            // Stop everything on channel 1
            LATBbits.LATB4 = 0;
            LATBbits.LATB5 = 0;
        }
    }

    if (channel2_timer) {
        --channel2_timer;
        if(!channel2_timer) {
            // Stop everything on channel 2
            LATBbits.LATB6 = 0;
            LATBbits.LATB7 = 0;
        }
    }
}
