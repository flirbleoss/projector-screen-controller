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
void relay_control(relay_channel_t channel, relay_direction_t direction);
void relay_tick(void);

// Command loop

void control_init(void);
void command_check(void);
void button_check_channel(relay_channel_t channel, char up, char dn);

// UART handling
#define UART_1 0
#define UART_2 1

#define UART_NONBLOCK 0
#define UART_BLOCK 1

void uart_init(void);
void uart_sendch(char uart, unsigned char ch);
void uart_send(char uart, unsigned char *ch);
unsigned char uart_recvch(char uart, char block);
char uart_recvempty(char uart);
#ifdef WANT_UART_RECVCOUNT
char uart_recvcount(char uart);
#endif /* WANT_UART_RECVCOUNT */
void uart_int_send(char uart);
void uart_int_recv(char uart);

#endif	/* _PJS_H */