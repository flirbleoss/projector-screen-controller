EESchema Schematic File Version 4
LIBS:projector-screen-controller-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "Projector Screen Controller"
Date "2019-09-16"
Rev "0.2"
Comp "Flirble Open Source"
Comment1 "https://github.com/flirbleoss/projector-screen-controller"
Comment2 "Copyright (c) 2019 Chris Luke; licensed under SHL-2.0"
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3750 2200 1650 1350
U 5D6871CF
F0 "MCU" 50
F1 "MCU.sch" 50
F2 "TX1" O L 3750 2350 50 
F3 "TX2" O L 3750 2550 50 
F4 "RX1" I L 3750 2450 50 
F5 "RX2" I L 3750 2650 50 
F6 "D1_UP_TTL" O R 5400 2350 50 
F7 "D1_DN_TTL" O R 5400 2450 50 
F8 "D2_UP_TTL" O R 5400 2550 50 
F9 "D2_DN_TTL" O R 5400 2650 50 
F10 "BUT1_UP" I L 3750 3250 50 
F11 "BUT1_DN" I L 3750 3150 50 
F12 "BUT2_UP" I L 3750 3450 50 
F13 "BUT2_DN" I L 3750 3350 50 
$EndSheet
$Sheet
S 6600 2200 1700 1250
U 5D68B982
F0 "Relay" 50
F1 "Relay.sch" 50
F2 "D1_UP_TTL" I L 6600 2350 50 
F3 "D1_DN_TTL" I L 6600 2450 50 
F4 "D2_UP_TTL" I L 6600 2550 50 
F5 "D2_DN_TTL" I L 6600 2650 50 
F6 "D1_UP_AC" O R 8300 2350 50 
F7 "D1_DN_AC" O R 8300 2450 50 
F8 "D2_UP_AC" O R 8300 2550 50 
F9 "D2_DN_AC" O R 8300 2650 50 
$EndSheet
$Sheet
S 3750 4850 1700 1200
U 5D68B9FF
F0 "Power" 50
F1 "Power.sch" 50
F2 "LINE" I L 3750 5200 50 
F3 "NEUT" I L 3750 5400 50 
F4 "+12V" O R 5450 5200 50 
F5 "+5V" O R 5450 5300 50 
F6 "GND" B R 5450 5650 50 
F7 "EARTH" U L 3750 5300 50 
F8 "GNDPWR" B R 5450 5750 50 
$EndSheet
$Comp
L power:NEUT #PWR0101
U 1 1 5D6F959E
P 2400 5000
F 0 "#PWR0101" H 2400 4850 50  0001 C CNN
F 1 "NEUT" H 2417 5173 50  0000 C CNN
F 2 "" H 2400 5000 50  0001 C CNN
F 3 "" H 2400 5000 50  0001 C CNN
	1    2400 5000
	1    0    0    -1  
$EndComp
$Comp
L power:LINE #PWR0102
U 1 1 5D6F9E72
P 2100 5000
F 0 "#PWR0102" H 2100 4850 50  0001 C CNN
F 1 "LINE" H 2117 5173 50  0000 C CNN
F 2 "" H 2100 5000 50  0001 C CNN
F 3 "" H 2100 5000 50  0001 C CNN
	1    2100 5000
	1    0    0    -1  
$EndComp
$Comp
L power:Earth_Protective #PWR0103
U 1 1 5D6FA28C
P 2250 5900
F 0 "#PWR0103" H 2500 5650 50  0001 C CNN
F 1 "Earth_Protective" H 2700 5750 50  0001 C CNN
F 2 "" H 2250 5800 50  0001 C CNN
F 3 "~" H 2250 5800 50  0001 C CNN
	1    2250 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 5300 2250 5300
Wire Wire Line
	2100 5200 2100 5000
Wire Wire Line
	1600 5400 2400 5400
Wire Wire Line
	5400 2350 6600 2350
Wire Wire Line
	5400 2450 6600 2450
Wire Wire Line
	5400 2550 6600 2550
Wire Wire Line
	5400 2650 6600 2650
$Comp
L Connector:Screw_Terminal_01x03 J3
U 1 1 5D704346
P 1350 2050
F 0 "J3" H 1268 2367 50  0000 C CNN
F 1 "MCV-3-G" H 1268 2276 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MCV_1,5_3-G-3.5_1x03_P3.50mm_Vertical" H 1350 2050 50  0001 C CNN
F 3 "~" H 1350 2050 50  0001 C CNN
	1    1350 2050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J4
U 1 1 5D705965
P 1350 2600
F 0 "J4" H 1268 2917 50  0000 C CNN
F 1 "MCV-3-G" H 1268 2826 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MCV_1,5_3-G-3.5_1x03_P3.50mm_Vertical" H 1350 2600 50  0001 C CNN
F 3 "~" H 1350 2600 50  0001 C CNN
	1    1350 2600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J5
U 1 1 5D7067C7
P 1350 3150
F 0 "J5" H 1268 3467 50  0000 C CNN
F 1 "MCV-3-G" H 1268 3376 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MCV_1,5_3-G-3.5_1x03_P3.50mm_Vertical" H 1350 3150 50  0001 C CNN
F 3 "~" H 1350 3150 50  0001 C CNN
	1    1350 3150
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5D70709B
P 1800 3950
F 0 "#PWR013" H 1800 3700 50  0001 C CNN
F 1 "GND" H 1805 3777 50  0000 C CNN
F 2 "" H 1800 3950 50  0001 C CNN
F 3 "" H 1800 3950 50  0001 C CNN
	1    1800 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2600 1800 2600
Wire Wire Line
	1550 2050 1800 2050
Wire Wire Line
	1800 2050 1800 2600
Connection ~ 1800 2600
Wire Wire Line
	1550 1950 2650 1950
Wire Wire Line
	2650 1950 2650 2350
Wire Wire Line
	2650 2350 3750 2350
Wire Wire Line
	1550 2150 2550 2150
Wire Wire Line
	2550 2150 2550 2450
Wire Wire Line
	2550 2450 3750 2450
Wire Wire Line
	1550 2500 2450 2500
Wire Wire Line
	2450 2500 2450 2550
Wire Wire Line
	2450 2550 3750 2550
Wire Wire Line
	1550 2700 2450 2700
Wire Wire Line
	2450 2700 2450 2650
Wire Wire Line
	2450 2650 3750 2650
$Comp
L Connector:Screw_Terminal_01x06 J6
U 1 1 5D70A607
P 9850 2550
F 0 "J6" H 9930 2542 50  0000 L CNN
F 1 "MSTBVA-6-G" H 9930 2451 50  0000 L CNN
F 2 "Connector_Phoenix_MSTB:PhoenixContact_MSTBVA_2,5_6-G_1x06_P5.00mm_Vertical" H 9850 2550 50  0001 C CNN
F 3 "~" H 9850 2550 50  0001 C CNN
	1    9850 2550
	1    0    0    -1  
$EndComp
$Comp
L power:NEUT #PWR014
U 1 1 5D70C4BA
P 9450 2000
F 0 "#PWR014" H 9450 1850 50  0001 C CNN
F 1 "NEUT" H 9467 2173 50  0000 C CNN
F 2 "" H 9450 2000 50  0001 C CNN
F 3 "" H 9450 2000 50  0001 C CNN
	1    9450 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 2000 9450 2550
Wire Wire Line
	9450 2550 9650 2550
Wire Wire Line
	9650 2850 9450 2850
Wire Wire Line
	9450 2850 9450 2550
Connection ~ 9450 2550
Wire Wire Line
	8300 2350 9650 2350
Wire Wire Line
	8300 2450 9650 2450
Wire Wire Line
	8300 2550 8900 2550
Wire Wire Line
	8900 2550 8900 2650
Wire Wire Line
	8900 2650 9650 2650
Wire Wire Line
	8300 2650 8800 2650
Wire Wire Line
	8800 2650 8800 2750
Wire Wire Line
	8800 2750 9650 2750
$Comp
L Device:Fuse F1
U 1 1 5D765C3A
P 1850 5200
F 0 "F1" V 1653 5200 50  0000 C CNN
F 1 "5A" V 1744 5200 50  0000 C CNN
F 2 "Fuse_Holders_and_Fuses:Fuseholder5x20_horiz_open_inline_Type-I" V 1780 5200 50  0001 C CNN
F 3 "~" H 1850 5200 50  0001 C CNN
	1    1850 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 5200 1700 5200
Wire Wire Line
	2000 5200 2100 5200
Connection ~ 2100 5200
Text Notes 850  2100 0    50   ~ 0
RS232 #1
Text Notes 850  2600 0    50   ~ 0
RS232 #2
Text Notes 850  3150 0    50   ~ 0
Buttons #1
$Comp
L Connector:Screw_Terminal_01x03 J7
U 1 1 5D6D108D
P 1350 3700
F 0 "J7" H 1268 4017 50  0000 C CNN
F 1 "MCV-3-G" H 1268 3926 50  0000 C CNN
F 2 "Connector_Phoenix_MC:PhoenixContact_MCV_1,5_3-G-3.5_1x03_P3.50mm_Vertical" H 1350 3700 50  0001 C CNN
F 3 "~" H 1350 3700 50  0001 C CNN
	1    1350 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1800 2600 1800 3050
Wire Wire Line
	1550 3050 1800 3050
Connection ~ 1800 3050
Wire Wire Line
	1550 3150 3750 3150
Wire Wire Line
	1550 3250 3750 3250
Wire Wire Line
	1550 3600 1800 3600
Wire Wire Line
	1800 3050 1800 3600
Connection ~ 1800 3600
Wire Wire Line
	1800 3600 1800 3950
Wire Wire Line
	3750 3450 2650 3450
Wire Wire Line
	2650 3450 2650 3800
Wire Wire Line
	2650 3800 1550 3800
Wire Wire Line
	3750 3350 2550 3350
Wire Wire Line
	2550 3350 2550 3700
Wire Wire Line
	2550 3700 1550 3700
Text Notes 850  3700 0    50   ~ 0
Buttons #2
Wire Wire Line
	2400 5000 2400 5400
Connection ~ 2400 5400
$Comp
L power:GND #PWR0104
U 1 1 5D6F4A37
P 6100 6050
F 0 "#PWR0104" H 6100 5800 50  0001 C CNN
F 1 "GND" H 6105 5877 50  0000 C CNN
F 2 "" H 6100 6050 50  0001 C CNN
F 3 "" H 6100 6050 50  0001 C CNN
	1    6100 6050
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0105
U 1 1 5D6F727B
P 5750 5000
F 0 "#PWR0105" H 5750 4850 50  0001 C CNN
F 1 "+12V" H 5765 5173 50  0000 C CNN
F 2 "" H 5750 5000 50  0001 C CNN
F 3 "" H 5750 5000 50  0001 C CNN
	1    5750 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 5D6F7C73
P 6000 5000
F 0 "#PWR0109" H 6000 4850 50  0001 C CNN
F 1 "+5V" H 6015 5173 50  0000 C CNN
F 2 "" H 6000 5000 50  0001 C CNN
F 3 "" H 6000 5000 50  0001 C CNN
	1    6000 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5000 5750 5200
Wire Wire Line
	5750 5200 5450 5200
Wire Wire Line
	6000 5000 6000 5300
Wire Wire Line
	6000 5300 5450 5300
Wire Wire Line
	2100 5200 2950 5200
Wire Wire Line
	2400 5400 2950 5400
Wire Wire Line
	2250 5300 2250 5900
Wire Wire Line
	2250 5300 3350 5300
Connection ~ 2250 5300
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5D799A5F
P 8600 4550
F 0 "H2" H 8700 4599 50  0000 L CNN
F 1 "MountingHole_Pad" V 8450 4500 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.7mm_Pad_Via" H 8600 4550 50  0001 C CNN
F 3 "~" H 8600 4550 50  0001 C CNN
	1    8600 4550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5D79A14C
P 8150 4550
F 0 "H1" H 8250 4599 50  0000 L CNN
F 1 "MountingHole_Pad" V 8000 4500 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_3.7mm_Pad_Via" H 8150 4550 50  0001 C CNN
F 3 "~" H 8150 4550 50  0001 C CNN
	1    8150 4550
	1    0    0    -1  
$EndComp
$Comp
L power:Earth_Protective #PWR010
U 1 1 5D79B95E
P 8600 4850
F 0 "#PWR010" H 8850 4600 50  0001 C CNN
F 1 "Earth_Protective" H 9050 4700 50  0001 C CNN
F 2 "" H 8600 4750 50  0001 C CNN
F 3 "~" H 8600 4750 50  0001 C CNN
	1    8600 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4650 8600 4750
Wire Wire Line
	8150 4650 8150 4750
Wire Wire Line
	8150 4750 8600 4750
Connection ~ 8600 4750
Wire Wire Line
	8600 4750 8600 4850
$Comp
L power:GNDPWR #PWR0106
U 1 1 5D7560D9
P 5800 6050
F 0 "#PWR0106" H 5800 5850 50  0001 C CNN
F 1 "GNDPWR" H 5804 5896 50  0000 C CNN
F 2 "" H 5800 6000 50  0001 C CNN
F 3 "" H 5800 6000 50  0001 C CNN
	1    5800 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5650 6100 5650
Wire Wire Line
	6100 5650 6100 6050
Wire Wire Line
	5450 5750 5800 5750
Wire Wire Line
	5800 5750 5800 6050
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5D7958CA
P 2950 5000
F 0 "#FLG0101" H 2950 5075 50  0001 C CNN
F 1 "PWR_FLAG" H 2950 5173 50  0000 C CNN
F 2 "" H 2950 5000 50  0001 C CNN
F 3 "~" H 2950 5000 50  0001 C CNN
	1    2950 5000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5D796A16
P 2950 5900
F 0 "#FLG0102" H 2950 5975 50  0001 C CNN
F 1 "PWR_FLAG" V 2900 5750 50  0000 C CNN
F 2 "" H 2950 5900 50  0001 C CNN
F 3 "~" H 2950 5900 50  0001 C CNN
	1    2950 5900
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5D797EE8
P 3350 5900
F 0 "#FLG0103" H 3350 5975 50  0001 C CNN
F 1 "PWR_FLAG" V 3300 5750 50  0000 C CNN
F 2 "" H 3350 5900 50  0001 C CNN
F 3 "~" H 3350 5900 50  0001 C CNN
	1    3350 5900
	-1   0    0    1   
$EndComp
Wire Wire Line
	2950 5000 2950 5200
Connection ~ 2950 5200
Wire Wire Line
	2950 5200 3750 5200
Wire Wire Line
	2950 5400 2950 5900
Connection ~ 2950 5400
Wire Wire Line
	2950 5400 3750 5400
Wire Wire Line
	3350 5300 3350 5900
Connection ~ 3350 5300
Wire Wire Line
	3350 5300 3750 5300
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5D79E448
P 6350 6050
F 0 "#FLG0104" H 6350 6125 50  0001 C CNN
F 1 "PWR_FLAG" V 6300 5900 50  0000 C CNN
F 2 "" H 6350 6050 50  0001 C CNN
F 3 "~" H 6350 6050 50  0001 C CNN
	1    6350 6050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6100 5650 6350 5650
Wire Wire Line
	6350 5650 6350 6050
Connection ~ 6100 5650
$Comp
L Connector:Screw_Terminal_01x03 J2
U 1 1 5D6FB32D
P 1400 5300
F 0 "J2" H 1550 5300 50  0000 C CNN
F 1 "MSTBVA-3-G" H 1400 5050 50  0000 C CNN
F 2 "Connector_Phoenix_MSTB:PhoenixContact_MSTBVA_2,5_3-G_1x03_P5.00mm_Vertical" H 1400 5300 50  0001 C CNN
F 3 "~" H 1400 5300 50  0001 C CNN
F 4 "Phoenix Connect" H 1400 5300 50  0001 C CNN "mfr"
F 5 "1924208" H 1400 5300 50  0001 C CNN "part#"
	1    1400 5300
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
