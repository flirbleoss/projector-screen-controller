/*
 * Projector Screen Controller
 *
 * Copyright (c) 2019 Chris Luke. Licensed under SHL-2.0.
 * https://github.com/flirbleoss/projector-screen-controller
 */

#include "config.h"
#include <xc.h>
#include "pjs.h"
#include <ctype.h>

#define CMD_BUF_SIZ 4

struct ser_control {
    char uart;  // Reference to the associated UART
    char len;   // Number of accumulated characters
    char buf[CMD_BUF_SIZ];  // character buffer
};

enum {
    SER_CTRL_1,
    SER_CTRL_2,
};

volatile struct ser_control ser_controls[] = {
    {
        .uart = UART_1,
        .len = 0,
    },
    {
        .uart = UART_2,
        .len = 0,
    }
};

// Control handling

void control_init(void) {
    ser_controls[0].len = 0;
    ser_controls[1].len = 0;
}

static void command_check_ser(char ctrl) {
    volatile struct ser_control *c = &ser_controls[ctrl];
    char uart = c->uart;

    if (!uart_recvempty(uart)) {
        unsigned char ch = uart_recvch(uart, UART_NONBLOCK);

        if (!isprint(ch))
            return; // skip non-printable chars quickly

        if (!isalnum(ch)) {
            // Command characters always reset the accumulation
            // Any non-alphanumeric is considered a command character
            c->buf[0] = ch;
            c->len = 1;

        } else if (c->len) {
            // Accumulate characters until a valid command is found.
            c->buf[c->len] = ch;
            c->len++;

            // Look for valid commands
            if (c->len == 2) {
                switch (c->buf[1]) {
                case 'P':
                case 'p':
                    // Report current status
                    relay_report(c->uart, c->buf[0]);
                    c->len = 0;
                    break;
                }
            } else if(c->len == 3) {
                relay_channel_t channel;
                relay_direction_t direction;
                char valid = 0;

                switch (c->buf[1]) {
                case '1':
                    channel = RELAY_CH1;
                    ++valid;
                    break;
                case '2':
                    channel = RELAY_CH2;
                    ++valid;
                    break;
                }

                switch (c->buf[2]) {
                case 'S':
                case 's':
                    direction = RELAY_STOP;
                    ++valid;
                    break;
                case 'U':
                case 'u':
                    direction = RELAY_UP;
                    ++valid;
                    break;
                case 'D':
                case 'd':
                    direction = RELAY_DOWN;
                    ++valid;
                    break;
                }

                if (valid == 2) {
                    relay_control(channel, direction);
                    c->len = 0;
                    relay_report(c->uart, c->buf[0]);
                }

            } else {
                // Command too long; reset
                c->len = 0;
            }
        } // else { drop character }
    }
}

void command_check(void) {
    command_check_ser(SER_CTRL_1);
    command_check_ser(SER_CTRL_1);
}

void button_check_channel(relay_channel_t channel, char up, char dn) {
    relay_direction_t direction;

    if (!up && !dn) return; // Test first; most common case
    else if(up && !dn) direction = RELAY_UP;
    else if(!up && dn) direction = RELAY_DOWN;
    else direction = RELAY_STOP;

    relay_control(channel, direction);

    relay_report(UART_1, '#');
    relay_report(UART_2, '#');
}