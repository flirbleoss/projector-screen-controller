EESchema Schematic File Version 4
LIBS:projector-screen-controller-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "Projector Screen Controller"
Date "2019-09-22"
Rev "0.2"
Comp "Flirble Open Source"
Comment1 "https://github.com/flirbleoss/projector-screen-controller"
Comment2 "Copyright (c) 2019 Chris Luke; licensed under SHL-2.0"
Comment3 ""
Comment4 "Relays and drivers"
$EndDescr
$Comp
L Transistor_Array:ULN2003A U4
U 1 1 5D6FD156
P 3150 2700
F 0 "U4" H 3150 3367 50  0000 C CNN
F 1 "ULN2003A" H 3150 3276 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 3200 2150 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 3250 2500 50  0001 C CNN
F 4 "ST" H 3150 2700 50  0001 C CNN "mfr"
F 5 "ULN2003A" H 3150 2700 50  0001 C CNN "mpn"
F 6 "Mouser" H 3150 2700 50  0001 C CNN "Src1"
F 7 "511-ULN2003A" H 3150 2700 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/511-ULN2003A" H 3150 2700 50  0001 C CNN "Src1 URL"
	1    3150 2700
	1    0    0    -1  
$EndComp
Text HLabel 1050 2500 0    50   Input ~ 0
D1_UP_TTL
Text HLabel 1050 2600 0    50   Input ~ 0
D1_DN_TTL
Text HLabel 1050 2700 0    50   Input ~ 0
D2_UP_TTL
Text HLabel 1050 2800 0    50   Input ~ 0
D2_DN_TTL
$Comp
L power:+12V #PWR0107
U 1 1 5D701C71
P 3700 1900
F 0 "#PWR0107" H 3700 1750 50  0001 C CNN
F 1 "+12V" H 3715 2073 50  0000 C CNN
F 2 "" H 3700 1900 50  0001 C CNN
F 3 "" H 3700 1900 50  0001 C CNN
	1    3700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 2300 3700 2300
Wire Wire Line
	3700 2300 3700 1900
Wire Wire Line
	2750 2900 2750 3000
Wire Wire Line
	2750 3000 2750 3100
Connection ~ 2750 3000
NoConn ~ 3550 2900
NoConn ~ 3550 3000
NoConn ~ 3550 3100
Text HLabel 8700 2300 2    50   Output ~ 0
D1_UP_AC
Text HLabel 8700 2400 2    50   Output ~ 0
D1_DN_AC
Text HLabel 8700 2500 2    50   Output ~ 0
D2_UP_AC
Text HLabel 8700 2600 2    50   Output ~ 0
D2_DN_AC
$Comp
L Relay:SANYOU_SRD_Form_C K1
U 1 1 5D71C787
P 6450 2050
F 0 "K1" H 6880 2096 50  0000 L CNN
F 1 "JS1-12V-F" H 6880 2005 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6900 2000 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/cdn/e/control/relay/power/catalog/mech_eng_js.pdf" H 6450 2050 50  0001 C CNN
F 4 "Panasonic" H 6450 2050 50  0001 C CNN "mfr"
F 5 "JS1-12V-F" H 6450 2050 50  0001 C CNN "mpn"
F 6 "Mouser" H 6450 2050 50  0001 C CNN "Src1"
F 7 "769-JS1-12V-F" H 6450 2050 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/769-JS1-12V-F" H 6450 2050 50  0001 C CNN "Src1 URL"
	1    6450 2050
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K2
U 1 1 5D71E187
P 6450 3000
F 0 "K2" H 6880 3046 50  0000 L CNN
F 1 "JS1-12V-F" H 6880 2955 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6900 2950 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/cdn/e/control/relay/power/catalog/mech_eng_js.pdf" H 6450 3000 50  0001 C CNN
F 4 "https://www.mouser.com/ProductDetail/769-JS1-12V-F" H 6450 3000 50  0001 C CNN "Src1 URL"
F 5 "Panasonic" H 6450 3000 50  0001 C CNN "mfr"
F 6 "JS1-12V-F" H 6450 3000 50  0001 C CNN "mpn"
F 7 "Mouser" H 6450 3000 50  0001 C CNN "Src1"
F 8 "769-JS1-12V-F" H 6450 3000 50  0001 C CNN "Src1 Part"
	1    6450 3000
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K3
U 1 1 5D71EA70
P 6450 4000
F 0 "K3" H 6880 4046 50  0000 L CNN
F 1 "JS1-12V-F" H 6880 3955 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6900 3950 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/cdn/e/control/relay/power/catalog/mech_eng_js.pdf" H 6450 4000 50  0001 C CNN
F 4 "https://www.mouser.com/ProductDetail/769-JS1-12V-F" H 6450 4000 50  0001 C CNN "Src1 URL"
F 5 "Panasonic" H 6450 4000 50  0001 C CNN "mfr"
F 6 "JS1-12V-F" H 6450 4000 50  0001 C CNN "mpn"
F 7 "Mouser" H 6450 4000 50  0001 C CNN "Src1"
F 8 "769-JS1-12V-F" H 6450 4000 50  0001 C CNN "Src1 Part"
	1    6450 4000
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K4
U 1 1 5D72022B
P 6450 5050
F 0 "K4" H 6880 5096 50  0000 L CNN
F 1 "JS1-12V-F" H 6880 5005 50  0000 L CNN
F 2 "Relay_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6900 5000 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/cdn/e/control/relay/power/catalog/mech_eng_js.pdf" H 6450 5050 50  0001 C CNN
F 4 "Panasonic" H 6450 5050 50  0001 C CNN "mfr"
F 5 "JS1-12V-F" H 6450 5050 50  0001 C CNN "mpn"
F 6 "Mouser" H 6450 5050 50  0001 C CNN "Src1"
F 7 "769-JS1-12V-F" H 6450 5050 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/769-JS1-12V-F" H 6450 5050 50  0001 C CNN "Src1 URL"
	1    6450 5050
	1    0    0    -1  
$EndComp
$Comp
L power:LINE #PWR016
U 1 1 5D720E65
P 7850 1350
F 0 "#PWR016" H 7850 1200 50  0001 C CNN
F 1 "LINE" H 7867 1523 50  0000 C CNN
F 2 "" H 7850 1350 50  0001 C CNN
F 3 "" H 7850 1350 50  0001 C CNN
	1    7850 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 1350 7850 2350
Wire Wire Line
	7850 2350 6650 2350
Connection ~ 7850 2350
Wire Wire Line
	6650 4300 7850 4300
Wire Wire Line
	6650 5350 7850 5350
Wire Wire Line
	7850 5350 7850 4300
Connection ~ 7850 4300
Wire Wire Line
	6750 1750 8350 1750
Wire Wire Line
	8350 1750 8350 2300
Wire Wire Line
	8350 2300 8700 2300
Wire Wire Line
	6750 2700 8350 2700
Wire Wire Line
	8350 2700 8350 2400
Wire Wire Line
	8350 2400 8700 2400
Wire Wire Line
	6750 3700 8450 3700
Wire Wire Line
	8450 3700 8450 2500
Wire Wire Line
	8450 2500 8700 2500
Wire Wire Line
	6750 4750 8550 4750
Wire Wire Line
	8550 4750 8550 2600
Wire Wire Line
	8550 2600 8700 2600
Wire Wire Line
	6250 4300 5650 4300
Wire Wire Line
	6250 3300 5650 3300
Wire Wire Line
	6250 2350 5650 2350
Wire Wire Line
	6250 2600 6250 2700
$Comp
L Diode:1N4004 D1
U 1 1 5D728894
P 5650 2050
F 0 "D1" V 5604 2129 50  0000 L CNN
F 1 "1N4004" V 5695 2129 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 1875 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5650 2050 50  0001 C CNN
	1    5650 2050
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4004 D2
U 1 1 5D7295EA
P 5650 2950
F 0 "D2" V 5604 3029 50  0000 L CNN
F 1 "1N4004" V 5695 3029 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 2775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5650 2950 50  0001 C CNN
	1    5650 2950
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4004 D3
U 1 1 5D72A997
P 5650 4000
F 0 "D3" V 5604 4079 50  0000 L CNN
F 1 "1N4004" V 5695 4079 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 3825 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5650 4000 50  0001 C CNN
	1    5650 4000
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4004 D4
U 1 1 5D72B65B
P 5650 5050
F 0 "D4" V 5604 5129 50  0000 L CNN
F 1 "1N4004" V 5695 5129 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 4875 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 5650 5050 50  0001 C CNN
	1    5650 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 1900 5650 1750
Wire Wire Line
	5650 1750 6250 1750
Wire Wire Line
	5650 2200 5650 2350
Wire Wire Line
	5650 2800 5650 2600
Wire Wire Line
	5650 2600 6250 2600
Wire Wire Line
	5650 3100 5650 3300
Wire Wire Line
	5650 3850 5650 3700
Wire Wire Line
	5650 3700 6250 3700
Wire Wire Line
	5650 4150 5650 4300
Wire Wire Line
	5650 4900 5650 4750
Wire Wire Line
	5650 4750 6250 4750
Wire Wire Line
	5650 5200 5650 5350
Wire Wire Line
	5650 5350 6250 5350
Wire Wire Line
	5650 2350 4500 2350
Wire Wire Line
	4500 2350 4500 2500
Connection ~ 5650 2350
Wire Wire Line
	5650 5350 4400 5350
Wire Wire Line
	4400 2800 4400 5350
Connection ~ 5650 5350
Wire Wire Line
	5650 4300 4500 4300
Wire Wire Line
	4500 4300 4500 2700
Connection ~ 5650 4300
Wire Wire Line
	5650 3300 4600 3300
Wire Wire Line
	4600 3300 4600 2600
Connection ~ 5650 3300
$Comp
L power:+12V #PWR0108
U 1 1 5D7394F2
P 5450 1550
F 0 "#PWR0108" H 5450 1400 50  0001 C CNN
F 1 "+12V" H 5465 1723 50  0000 C CNN
F 2 "" H 5450 1550 50  0001 C CNN
F 3 "" H 5450 1550 50  0001 C CNN
	1    5450 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1550 5450 1750
Wire Wire Line
	5450 1750 5650 1750
Connection ~ 5650 1750
Wire Wire Line
	5650 2600 5450 2600
Wire Wire Line
	5450 2600 5450 1750
Connection ~ 5650 2600
Connection ~ 5450 1750
Wire Wire Line
	5650 3700 5450 3700
Wire Wire Line
	5450 3700 5450 2600
Connection ~ 5650 3700
Connection ~ 5450 2600
Wire Wire Line
	5650 4750 5450 4750
Wire Wire Line
	5450 4750 5450 3700
Connection ~ 5650 4750
Connection ~ 5450 3700
Wire Wire Line
	7850 2350 7850 3300
Wire Wire Line
	6650 3300 7850 3300
Connection ~ 7850 3300
Wire Wire Line
	7850 3300 7850 4300
Wire Wire Line
	1050 2500 1150 2500
Wire Wire Line
	1050 2600 1400 2600
Wire Wire Line
	1050 2700 1650 2700
Wire Wire Line
	1050 2800 1900 2800
$Comp
L Device:R R7
U 1 1 5D6E4821
P 1900 3050
F 0 "R7" H 1970 3096 50  0000 L CNN
F 1 "330R" V 2000 2850 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1830 3050 50  0001 C CNN
F 3 "~" H 1900 3050 50  0001 C CNN
	1    1900 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5D6E54AB
P 1650 3050
F 0 "R6" H 1720 3096 50  0000 L CNN
F 1 "330R" V 1750 2850 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1580 3050 50  0001 C CNN
F 3 "~" H 1650 3050 50  0001 C CNN
	1    1650 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D6E6CF6
P 1400 3050
F 0 "R5" H 1470 3096 50  0000 L CNN
F 1 "330R" V 1500 2850 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1330 3050 50  0001 C CNN
F 3 "~" H 1400 3050 50  0001 C CNN
	1    1400 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D8
U 1 1 5D6E9A8E
P 1150 3450
F 0 "D8" V 1200 3400 50  0000 R CNN
F 1 "LED" V 1100 3400 50  0000 R CNN
F 2 "LEDs:LED_D3.0mm" H 1150 3450 50  0001 C CNN
F 3 "~" H 1150 3450 50  0001 C CNN
	1    1150 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D9
U 1 1 5D6EA810
P 1400 3450
F 0 "D9" V 1450 3400 50  0000 R CNN
F 1 "LED" V 1350 3400 50  0000 R CNN
F 2 "LEDs:LED_D3.0mm" H 1400 3450 50  0001 C CNN
F 3 "~" H 1400 3450 50  0001 C CNN
	1    1400 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D10
U 1 1 5D6EC3F0
P 1650 3450
F 0 "D10" V 1700 3400 50  0000 R CNN
F 1 "LED" V 1600 3400 50  0000 R CNN
F 2 "LEDs:LED_D3.0mm" H 1650 3450 50  0001 C CNN
F 3 "~" H 1650 3450 50  0001 C CNN
	1    1650 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D11
U 1 1 5D6EE0A2
P 1900 3450
F 0 "D11" V 1950 3400 50  0000 R CNN
F 1 "LED" V 1850 3400 50  0000 R CNN
F 2 "LEDs:LED_D3.0mm" H 1900 3450 50  0001 C CNN
F 3 "~" H 1900 3450 50  0001 C CNN
	1    1900 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 2500 1150 2900
Wire Wire Line
	1400 2600 1400 2900
Wire Wire Line
	1650 2700 1650 2900
Wire Wire Line
	1900 2800 1900 2900
Wire Wire Line
	1150 3200 1150 3300
Wire Wire Line
	1400 3200 1400 3300
Wire Wire Line
	1650 3200 1650 3300
Wire Wire Line
	1900 3200 1900 3300
$Comp
L power:GND #PWR0110
U 1 1 5D700BE5
P 1150 3750
F 0 "#PWR0110" H 1150 3500 50  0001 C CNN
F 1 "GND" H 1155 3577 50  0000 C CNN
F 2 "" H 1150 3750 50  0001 C CNN
F 3 "" H 1150 3750 50  0001 C CNN
	1    1150 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 3600 1150 3650
Wire Wire Line
	1400 3600 1400 3650
Wire Wire Line
	1400 3650 1150 3650
Connection ~ 1150 3650
Wire Wire Line
	1150 3650 1150 3750
Wire Wire Line
	1650 3600 1650 3650
Wire Wire Line
	1650 3650 1400 3650
Connection ~ 1400 3650
Wire Wire Line
	1900 3600 1900 3650
Wire Wire Line
	1900 3650 1650 3650
Connection ~ 1650 3650
$Comp
L Device:R R4
U 1 1 5D6E8437
P 1150 3050
F 0 "R4" H 1220 3096 50  0000 L CNN
F 1 "330R" V 1250 2850 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1080 3050 50  0001 C CNN
F 3 "~" H 1150 3050 50  0001 C CNN
	1    1150 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5D758D65
P 2750 3750
F 0 "#PWR0112" H 2750 3500 50  0001 C CNN
F 1 "GND" H 2755 3577 50  0000 C CNN
F 2 "" H 2750 3750 50  0001 C CNN
F 3 "" H 2750 3750 50  0001 C CNN
	1    2750 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3300 3150 3550
Wire Wire Line
	2750 3100 2750 3750
Connection ~ 2750 3100
Wire Wire Line
	3550 2500 4500 2500
Wire Wire Line
	3550 2600 4600 2600
Wire Wire Line
	3550 2700 4500 2700
Wire Wire Line
	3550 2800 4400 2800
Wire Wire Line
	2750 2500 1150 2500
Connection ~ 1150 2500
Wire Wire Line
	2750 2600 1400 2600
Connection ~ 1400 2600
Wire Wire Line
	2750 2700 1650 2700
Connection ~ 1650 2700
Wire Wire Line
	2750 2800 1900 2800
Connection ~ 1900 2800
$Comp
L Device:C C13
U 1 1 5D7871B3
P 3700 3350
F 0 "C13" H 3815 3396 50  0000 L CNN
F 1 "0.1uF" H 3815 3305 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3738 3200 50  0001 C CNN
F 3 "~" H 3700 3350 50  0001 C CNN
	1    3700 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2300 3700 3200
Connection ~ 3700 2300
Wire Wire Line
	3700 3500 3700 3550
Wire Wire Line
	3700 3550 3150 3550
Connection ~ 3150 3550
Wire Wire Line
	3150 3550 3150 3750
$Comp
L power:GNDPWR #PWR012
U 1 1 5D7B0E70
P 3150 3750
F 0 "#PWR012" H 3150 3550 50  0001 C CNN
F 1 "GNDPWR" H 3154 3596 50  0000 C CNN
F 2 "" H 3150 3700 50  0001 C CNN
F 3 "" H 3150 3700 50  0001 C CNN
	1    3150 3750
	1    0    0    -1  
$EndComp
NoConn ~ 6550 1750
NoConn ~ 6550 2700
NoConn ~ 6550 3700
NoConn ~ 6550 4750
$EndSCHEMATC
