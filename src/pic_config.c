/*
 * Projector Screen Controller
 *
 * Copyright (c) 2019 Chris Luke. Licensed under SHL-2.0.
 * https://github.com/flirbleoss/projector-screen-controller
 */

#include "config.h"
#include <xc.h>

// System configuration
// Include only once per project
#if defined(_16F15345)

// Section 5.2 (page 80) of the data sheet

// REGISTER 5-1
#pragma config FCMEN = OFF      // Fail-safe clock monitor enable
#pragma config CSWEN = OFF      // Clock switch enable
#pragma config CLKOUTEN = OFF   // Clock out enable
#pragma config RSTOSC = EXT4X   // Startup up clock; ext with 4x PLL
#pragma config FEXTOSC = HS     // Ext osc is >4MHz crystal

// REGISTER 5-2
#pragma config STVREN = ON      // Stack over/underflow causes reset
#pragma config PPS1WAY = ON     // PPSLOCK set once (ON)/set many (OFF)
#pragma config BORV = LO        // Brown out reset voltage (low trip point)
#pragma config BOREN = ON       // Brown-out detect
#pragma config LPBOREN = OFF    // Low-power brownout
#pragma config ZCD = OFF        // No zero-crossing detect
#pragma config MCLRE = OFF      // !MCLR disable (ignored if LVP=ON)
#ifdef __DEBUG
#pragma config PWRTE = OFF      // Power up timer disabled for debugging
#else
#pragma config PWRTE = ON       // Power up timer enable
#endif

#ifdef USE_WATCHDOG
// REGISTER 5-3
// TODO not tested
#pragma config WDTCCS = LFINTOSC   // 31KHz internal oscillator
#pragma config WDTCWS = WDTCWS_7   // 100% window
#pragma config WDTE = NSLEEP       // Watchdog timer enable (when not in sleep)
#pragma config WDTCPS = WDTCPS_16  // ~64s timeout (TODO: should be tuned lower)
#else /* USE_WATCHDOG */
#pragma config WDTE = OFF          // Watchdog timer disable
#endif /* USE_WATCHDOG */

// REGISTER 5-4
#pragma config LVP = ON         // Low-voltage programming
#pragma config WRTSAF = OFF     // default (Storage flash not write protected)
#pragma config WRTC = OFF       // default (Config register not write protected)
#pragma config WRTB = OFF       // default (Boot block not write protected)
#pragma config WRTAPP = OFF     // default (App block not write protected)
#pragma config SAFEN = OFF      // default (SAF disabled)
#pragma config BBEN = OFF       // default (Boot block disabled)
#pragma config BBSIZE = BB512   // default (ignored if BBEN=1)

// REGISTER 5-5
#pragma config CP = OFF         // Code EEPROM protection

#else
#error This code is designed for a PIC16F15345!
#endif