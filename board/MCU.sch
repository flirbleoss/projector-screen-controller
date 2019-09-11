EESchema Schematic File Version 4
LIBS:projector-screen-controller-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "Projector Screen Controller"
Date "2019-09-07"
Rev "0.2"
Comp "Flirble Open Source"
Comment1 "https://github.com/flirbleoss/projector-screen-controller"
Comment2 "Copyright (c) 2019 Chris Luke; licensed under SHL-2.0"
Comment3 ""
Comment4 "Microcontroller and communications"
$EndDescr
$Comp
L Interface_UART:MAX232I U?
U 1 1 5D68B6C6
P 9200 3900
AR Path="/5D68B6C6" Ref="U?"  Part="1" 
AR Path="/5D6871CF/5D68B6C6" Ref="U2"  Part="1" 
F 0 "U2" H 8650 4950 50  0000 C CNN
F 1 "MAX232I" H 8900 4950 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 9250 2850 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/max232.pdf" H 9200 4000 50  0001 C CNN
	1    9200 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5D68DC97
P 4700 5400
F 0 "#PWR03" H 4700 5150 50  0001 C CNN
F 1 "GND" H 4705 5227 50  0000 C CNN
F 2 "" H 4700 5400 50  0001 C CNN
F 3 "" H 4700 5400 50  0001 C CNN
	1    4700 5400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5D68E061
P 9200 5650
F 0 "#PWR06" H 9200 5400 50  0001 C CNN
F 1 "GND" H 9205 5477 50  0000 C CNN
F 2 "" H 9200 5650 50  0001 C CNN
F 3 "" H 9200 5650 50  0001 C CNN
	1    9200 5650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5D68E693
P 4700 2900
F 0 "#PWR02" H 4700 2750 50  0001 C CNN
F 1 "+5V" H 4715 3073 50  0000 C CNN
F 2 "" H 4700 2900 50  0001 C CNN
F 3 "" H 4700 2900 50  0001 C CNN
	1    4700 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 5D68EF1E
P 9200 2400
F 0 "#PWR05" H 9200 2250 50  0001 C CNN
F 1 "+5V" H 9215 2573 50  0000 C CNN
F 2 "" H 9200 2400 50  0001 C CNN
F 3 "" H 9200 2400 50  0001 C CNN
	1    9200 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2900 4700 3200
Wire Wire Line
	9200 2400 9200 2700
$Comp
L Device:C C1
U 1 1 5D68F853
P 4250 5200
F 0 "C1" H 4365 5246 50  0000 L CNN
F 1 "0.1uF" H 4365 5155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4288 5050 50  0001 C CNN
F 3 "~" H 4250 5200 50  0001 C CNN
	1    4250 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5D690768
P 8750 5400
F 0 "C2" H 8865 5446 50  0000 L CNN
F 1 "1uF" H 8865 5355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8788 5250 50  0001 C CNN
F 3 "~" H 8750 5400 50  0001 C CNN
	1    8750 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 5550 9200 5550
Wire Wire Line
	9200 5550 9200 5650
$Comp
L power:+5V #PWR04
U 1 1 5D692E30
P 8750 5200
F 0 "#PWR04" H 8750 5050 50  0001 C CNN
F 1 "+5V" H 8765 5373 50  0000 C CNN
F 2 "" H 8750 5200 50  0001 C CNN
F 3 "" H 8750 5200 50  0001 C CNN
	1    8750 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5D69678B
P 4250 5000
F 0 "#PWR01" H 4250 4850 50  0001 C CNN
F 1 "+5V" H 4265 5173 50  0000 C CNN
F 2 "" H 4250 5000 50  0001 C CNN
F 3 "" H 4250 5000 50  0001 C CNN
	1    4250 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 5350 4700 5350
Wire Wire Line
	4700 5350 4700 5400
Wire Wire Line
	4250 5000 4250 5050
Wire Wire Line
	9200 5100 9200 5550
Connection ~ 9200 5550
Wire Wire Line
	8750 5200 8750 5250
Text HLabel 10600 4000 2    50   Output ~ 0
TX1
Text HLabel 10600 4200 2    50   Output ~ 0
TX2
Text HLabel 10600 4400 2    50   Input ~ 0
RX1
Text HLabel 10600 4600 2    50   Input ~ 0
RX2
Wire Wire Line
	10000 4000 10600 4000
Wire Wire Line
	10000 4200 10600 4200
Wire Wire Line
	10000 4400 10600 4400
Wire Wire Line
	10000 4600 10600 4600
$Comp
L Device:Crystal Y1
U 1 1 5D69B112
P 1000 4250
F 0 "Y1" H 1000 4518 50  0000 C CNN
F 1 "8MHz" H 1000 4427 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 1000 4250 50  0001 C CNN
F 3 "~" H 1000 4250 50  0001 C CNN
	1    1000 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5D69CCF0
P 850 4550
F 0 "C3" H 650 4600 50  0000 L CNN
F 1 "20pF" H 550 4500 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 888 4400 50  0001 C CNN
F 3 "~" H 850 4550 50  0001 C CNN
	1    850  4550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5D69D3F0
P 1150 4550
F 0 "C4" H 1250 4600 50  0000 L CNN
F 1 "20pF" H 1250 4500 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1188 4400 50  0001 C CNN
F 3 "~" H 1150 4550 50  0001 C CNN
	1    1150 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5D69D840
P 1000 4850
F 0 "#PWR07" H 1000 4600 50  0001 C CNN
F 1 "GND" H 1005 4677 50  0000 C CNN
F 2 "" H 1000 4850 50  0001 C CNN
F 3 "" H 1000 4850 50  0001 C CNN
	1    1000 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  4700 850  4750
Wire Wire Line
	850  4750 1000 4750
Wire Wire Line
	1150 4750 1150 4700
Wire Wire Line
	1000 4850 1000 4750
Connection ~ 1000 4750
Wire Wire Line
	1000 4750 1150 4750
$Comp
L Device:C C5
U 1 1 5D6AB415
P 8100 3150
F 0 "C5" H 8215 3196 50  0000 L CNN
F 1 "1uF" H 8215 3105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8138 3000 50  0001 C CNN
F 3 "~" H 8100 3150 50  0001 C CNN
	1    8100 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5D6ABEC1
P 10300 3150
F 0 "C8" H 10415 3196 50  0000 L CNN
F 1 "1uF" H 10415 3105 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10338 3000 50  0001 C CNN
F 3 "~" H 10300 3150 50  0001 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 3000 8400 3000
Wire Wire Line
	8100 3300 8400 3300
Wire Wire Line
	10000 3000 10300 3000
Wire Wire Line
	10000 3300 10300 3300
$Comp
L Device:C C6
U 1 1 5D6AE816
P 10250 3500
F 0 "C6" V 10200 3400 50  0000 C CNN
F 1 "1uF" V 10300 3350 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10288 3350 50  0001 C CNN
F 3 "~" H 10250 3500 50  0001 C CNN
	1    10250 3500
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 5D6AF2F1
P 10250 3800
F 0 "C7" V 10200 3700 50  0000 C CNN
F 1 "1uF" V 10300 3650 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 10288 3650 50  0001 C CNN
F 3 "~" H 10250 3800 50  0001 C CNN
	1    10250 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	10000 3500 10100 3500
Wire Wire Line
	10000 3800 10100 3800
Wire Wire Line
	10400 3500 10400 3800
Wire Wire Line
	10400 3800 10400 5550
Wire Wire Line
	10400 5550 9200 5550
Connection ~ 10400 3800
Text HLabel 1950 4200 0    50   Output ~ 0
D1_UP_TTL
Text HLabel 1950 4300 0    50   Output ~ 0
D1_DN_TTL
Text HLabel 1950 4400 0    50   Output ~ 0
D2_UP_TTL
Text HLabel 1950 4500 0    50   Output ~ 0
D2_DN_TTL
Wire Wire Line
	1950 4400 2500 4400
Text HLabel 7150 2700 1    50   Input ~ 0
BUT1_UP
Text HLabel 7250 2700 1    50   Input ~ 0
BUT1_DN
Wire Wire Line
	7150 2700 7150 3500
Wire Wire Line
	7150 3500 6900 3500
Wire Wire Line
	7250 2700 7250 3600
Wire Wire Line
	7250 3600 6900 3600
$Comp
L Connector_Generic:Conn_01x06 J1
U 1 1 5D6BA874
P 1050 1900
F 0 "J1" H 968 2317 50  0000 C CNN
F 1 "ICSP" H 968 2226 50  0000 C CNN
F 2 "Connectors:PINHEAD1-6" H 1050 1900 50  0001 C CNN
F 3 "~" H 1050 1900 50  0001 C CNN
	1    1050 1900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1250 1700 1700 1700
Wire Wire Line
	1250 2100 1800 2100
Wire Wire Line
	1250 2000 1900 2000
$Comp
L power:+5V #PWR08
U 1 1 5D6C2565
P 1550 1050
F 0 "#PWR08" H 1550 900 50  0001 C CNN
F 1 "+5V" H 1565 1223 50  0000 C CNN
F 2 "" H 1550 1050 50  0001 C CNN
F 3 "" H 1550 1050 50  0001 C CNN
	1    1550 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1050 1550 1200
Wire Wire Line
	1550 1800 1250 1800
$Comp
L power:GND #PWR09
U 1 1 5D6C54CD
P 1550 2600
F 0 "#PWR09" H 1550 2350 50  0001 C CNN
F 1 "GND" H 1555 2427 50  0000 C CNN
F 2 "" H 1550 2600 50  0001 C CNN
F 3 "" H 1550 2600 50  0001 C CNN
	1    1550 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1900 1550 1900
Wire Wire Line
	1550 1900 1550 2600
$Comp
L Device:R R1
U 1 1 5D6C83EE
P 1700 1450
F 0 "R1" H 1770 1496 50  0000 L CNN
F 1 "10K" H 1770 1405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1630 1450 50  0001 C CNN
F 3 "~" H 1700 1450 50  0001 C CNN
	1    1700 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1600 1700 1700
Connection ~ 1700 1700
Wire Wire Line
	1700 1700 2000 1700
Wire Wire Line
	1700 1300 1700 1200
Wire Wire Line
	1700 1200 1550 1200
Connection ~ 1550 1200
Wire Wire Line
	1550 1200 1550 1800
Wire Notes Line
	850  1100 2100 1100
Wire Notes Line
	2100 1100 2100 2350
Wire Notes Line
	2100 2350 850  2350
Wire Notes Line
	850  2350 850  1100
Text Notes 900  1100 1    0    ~ 0
Optional programming header
Text Notes 2300 1250 0    0    ~ 0
Optional programming header
NoConn ~ 1250 2200
$Comp
L Chris_Microcontrollers:PIC16F15345-IP U1
U 1 1 5D79A023
P 4700 4000
F 0 "U1" H 2700 4700 50  0000 C CNN
F 1 "PIC16F15345-IP" H 3100 4700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4700 4000 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40001865B.pdf" H 4700 4000 50  0001 C CNN
	1    4700 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4500 2500 4500
Wire Wire Line
	1950 4300 2500 4300
Wire Wire Line
	1950 4200 2500 4200
Wire Wire Line
	2000 1700 2000 3800
Wire Wire Line
	2000 3800 2500 3800
Wire Wire Line
	1900 2000 1900 3500
Wire Wire Line
	1900 3500 2500 3500
Wire Wire Line
	1800 2100 1800 3600
Wire Wire Line
	1800 3600 2500 3600
Wire Wire Line
	6900 4200 7450 4200
Wire Wire Line
	7450 4200 7450 4600
Wire Wire Line
	7450 4600 8400 4600
Wire Wire Line
	6900 4100 7550 4100
Wire Wire Line
	7550 4100 7550 4400
Wire Wire Line
	7550 4400 8400 4400
Wire Wire Line
	6900 4000 7650 4000
Wire Wire Line
	7650 4000 7650 4200
Wire Wire Line
	7650 4200 8400 4200
Wire Wire Line
	6900 3900 7750 3900
Wire Wire Line
	7750 3900 7750 4000
Wire Wire Line
	7750 4000 8400 4000
Wire Wire Line
	4700 4800 4700 5350
Connection ~ 4700 5350
Wire Wire Line
	850  4400 850  4250
Wire Wire Line
	1150 4400 1150 4250
Wire Wire Line
	1150 4250 1150 4000
Wire Wire Line
	1150 4000 2500 4000
Connection ~ 1150 4250
Wire Wire Line
	850  4250 850  3900
Wire Wire Line
	850  3900 2500 3900
Connection ~ 850  4250
Text HLabel 7350 2700 1    50   Input ~ 0
BUT2_UP
Text HLabel 7450 2700 1    50   Input ~ 0
BUT2_DN
Wire Wire Line
	7350 2700 7350 3700
Wire Wire Line
	7350 3700 6900 3700
Wire Wire Line
	7450 2700 7450 3800
Wire Wire Line
	7450 3800 6900 3800
$Comp
L Device:LED D12
U 1 1 5D733225
P 2300 5600
F 0 "D12" V 2339 5483 50  0000 R CNN
F 1 "LED" V 2248 5483 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 2300 5600 50  0001 C CNN
F 3 "~" H 2300 5600 50  0001 C CNN
	1    2300 5600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R8
U 1 1 5D73555C
P 2300 5250
F 0 "R8" H 2370 5296 50  0000 L CNN
F 1 "330R" H 2370 5205 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2230 5250 50  0001 C CNN
F 3 "~" H 2300 5250 50  0001 C CNN
	1    2300 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5D735E3D
P 2300 5950
F 0 "#PWR0111" H 2300 5700 50  0001 C CNN
F 1 "GND" H 2305 5777 50  0000 C CNN
F 2 "" H 2300 5950 50  0001 C CNN
F 3 "" H 2300 5950 50  0001 C CNN
	1    2300 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3700 2300 3700
Wire Wire Line
	2300 3700 2300 5100
Wire Wire Line
	2300 5400 2300 5450
Wire Wire Line
	2300 5750 2300 5950
Text Notes 2300 2000 1    50   ~ 0
Optional programming\nheader components
$EndSCHEMATC
