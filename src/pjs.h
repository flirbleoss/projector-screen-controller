/*
 * Projector Screen Controller
 *
 * Copyright (c) 2019 Chris Luke. Licensed under SHL-2.0.
 * https://github.com/flirbleoss/projector-screen-controller
 */

#ifndef _PJS_H
#define	_PJS_H

// Relay handling

typedef enum {
    RELAY_STOP,
    RELAY_UP,
    RELAY_DOWN
} relay_direction_t;

typedef enum {
    RELAY_CH1,
    RELAY_CH2
} relay_channel_t;

void relay_init(void);
void relay_report(char uart, unsigned char cmdch);
void relay_check(void);
void relay_control(relay_channel_t channel, relay_direction_t direction);
void relay_tick(void);

// Command loop

void control_init(void);
void command_check(void);
void button_check_channel(relay_channel_t channel, char up, char dn);

// UART handling
typedef enum {
    UART_1 = 0,
    UART_2
} uart_unit_t;

typedef enum {
    UART_NONBLOCK = 0,
    UART_BLOCK
} uart_blocking_t;

void uart_init(void);
void uart_sendch(uart_unit_t uart, unsigned char ch);
void uart_send(uart_unit_t uart, unsigned char *ch);
unsigned char uart_recvch(uart_unit_t uart, uart_blocking_t block);
char uart_recvempty(uart_unit_t uart);
#ifdef WANT_UART_RECVCOUNT
char uart_recvcount(uart_unit_t uart);
#endif /* WANT_UART_RECVCOUNT */
void uart_int_send(uart_unit_t uart);
void uart_int_recv(uart_unit_t uart);

#endif	/* _PJS_H */