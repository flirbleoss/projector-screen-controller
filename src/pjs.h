/*
 * Projector Screen Controller
 *
 * Copyright (c) 2019 Chris Luke. Licensed under SHL-2.0.
 * https://github.com/flirbleoss/projector-screen-controller
 */

#ifndef _PJS_H
#define	_PJS_H

#ifdef	__cplusplus
extern "C" {
#endif

// UART handling
#define UART_1 0
#define UART_2 1

void uart_init(void);
void uart_sendch(char uart, unsigned char ch);
void uart_send(char uart, unsigned char *ch);
unsigned char uart_recvch(char uart, char block);
char uart_recvempty(char uart);
char uart_recvcount(char uart);
void uart_int_send(char uart);
void uart_int_recv(char uart);


#ifdef	__cplusplus
}
#endif

#endif	/* _PJS_H */

