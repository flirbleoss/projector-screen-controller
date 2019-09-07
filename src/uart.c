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

struct uart {
    // UART transmit circular buffer
    volatile unsigned char tx[UART_TX_BUF];
    volatile char tx_lo;
    volatile char tx_hi;

    // UART receive circular buffer
    volatile unsigned char rx[UART_RX_BUF];
    volatile char rx_lo;
    volatile char rx_hi;

};

volatile struct uart uarts[2];

// Equivalent to "u = &uarts[uart]" but avoids bmul function
#define UARTP(uart) (((uart) == UART_1) ? &uarts[UART_1] : &uarts[UART_2])

// Ring buffer handling
// tx_lo is where we start reading the buffer
// tx_hi is where we start adding to the buffer
#define _RB_SIZE_tx (UART_TX_BUF)
#define _RB_SIZE_rx (UART_RX_BUF)
#define _RB_MAX_tx (UART_TX_BUF-1)
#define _RB_MAX_rx (UART_RX_BUF-1)
#define RB_LO(U, D) ((U)->D ## _lo)
#define RB_HI(U, D) ((U)->D ## _hi)
#define RB_SIZE(D) (_RB_SIZE_ ## D)
#define RB_MAX(D) (_RB_MAX_ ## D)
#define RB_FULL(U, D) (RB_LO(U, D) == RB_MAX(D) ? RB_HI(U, D) == 0 : \
        RB_LO(U, D) == (RB_HI(U, D)+1))
#define RB_EMPTY(U, D) (RB_LO(U, D) == RB_HI(U, D))
#define RB_COUNT(U, D) ( \
    RB_HI(U, D) < RB_LO(U, D) \
    ? (RB_SIZE(D) - RB_LO(U, D)) + RB_HI(U, D) \
    : RB_HI(U, D) - RB_LO(U, D) \
)

#define RB_PUT(U, D, C) do { \
    (U)->D[RB_HI(U, D)] = (C); \
    RB_HI(U, D)++; \
    if (RB_HI(U, D) >= RB_MAX(D)) RB_HI(U, D) = 0; \
    } while(0)

// UART handling

void uart_init(void) {
    uarts[UART_1].tx_lo = uarts[UART_1].rx_lo = 0;
    uarts[UART_2].tx_lo = uarts[UART_2].rx_lo = 0;
}

void uart_sendch(char uart, unsigned char ch) {
    volatile struct uart *u = UARTP(uart);

    while (RB_FULL(u, tx)) {
        // Buffer full, wait
        // If the transmit buffer interrupt is not running, this will
        // lock indefinitely
        __delay_ms(100);
    }

    di();
    RB_PUT(u, tx, ch);
    ei();

    // Tell UART to interrupt when we can send
    if (uart == UART_1) TX1IE = 1;
    else TX2IE = 1;
}

void uart_send(char uart, unsigned char *ch) {
    while (*ch) {
        uart_sendch(uart, *ch);
        ch++;
    }
}

unsigned char uart_recvch(char uart, char block) {
    volatile struct uart *u = UARTP(uart);

    if (block) {
        while (RB_EMPTY(u, rx)) {
            // Wait
            __delay_ms(100);
        }
    } else if (RB_EMPTY(u, rx)) {
        // Nothing available
        return ~0;
    }

    di();
    unsigned char c = u->rx[u->rx_lo];
    u->rx_lo++;
    if (u->rx_lo >= UART_RX_BUF) u->rx_lo = 0;
    ei();

    return c;
}

char uart_recvempty(char uart) {
    volatile struct uart *u = UARTP(uart);

    return (char) RB_EMPTY(u, rx);
}

char uart_recvcount(char uart) {
    volatile struct uart *u = UARTP(uart);

    return (char) RB_COUNT(u, rx);
}

// Interrupt-driven functions

void uart_int_send(char uart) {
    volatile struct uart *u = UARTP(uart);

    if (!RB_EMPTY(u, tx)) {
        unsigned char c = u->tx[u->tx_lo];
        u->tx_lo++;
        if (u->tx_lo >= UART_TX_BUF) u->tx_lo = 0;

        if (uart == UART_1) TX1REG = c;
        else TX2REG = c;
    }

    if (!RB_EMPTY(u, tx)) {
        // Buffer still has content, tell UART to interrupt when we can send
        if (uart == UART_1) TX1IE = 1;
        else TX2IE = 1;
    }
}

void uart_int_recv(char uart) {
    volatile struct uart *u = UARTP(uart);

    while ((uart == UART_1 && RC1IF) || (uart == UART_2 && RC2IF)) {
        unsigned char c;

        if (uart == UART_1) c = RC1REG;
        else c = RC2REG;

        // Add byte to the buffer; drop if buffer full
        if (!RB_FULL(u, rx)) {
            RB_PUT(u, rx, c);
        }
    }
}