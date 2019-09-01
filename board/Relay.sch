EESchema Schematic File Version 4
LIBS:projector-screen-controller-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "Projector Screen Controller"
Date "2019-08-31"
Rev "0.1"
Comp "Chris Luke"
Comment1 "https://github.com/flirbleoss/projector-screen-controller"
Comment2 ""
Comment3 ""
Comment4 "Relays and drivers"
$EndDescr
$Comp
L Transistor_Array:ULN2003A U4
U 1 1 5D6FD156
P 2550 2700
F 0 "U4" H 2550 3367 50  0000 C CNN
F 1 "ULN2003A" H 2550 3276 50  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm_LongPads" H 2600 2150 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/uln2003a.pdf" H 2650 2500 50  0001 C CNN
	1    2550 2700
	1    0    0    -1  
$EndComp
Text HLabel 1500 2500 0    50   Input ~ 0
D1_UP_TTL
Text HLabel 1500 2600 0    50   Input ~ 0
D1_DN_TTL
Text HLabel 1500 2700 0    50   Input ~ 0
D2_UP_TTL
Text HLabel 1500 2800 0    50   Input ~ 0
D2_DN_TTL
Wire Wire Line
	1500 2500 2150 2500
Wire Wire Line
	1500 2600 2150 2600
Wire Wire Line
	1500 2700 2150 2700
Wire Wire Line
	1500 2800 2150 2800
$Comp
L power:GND #PWR0106
U 1 1 5D7017FB
P 2550 3500
F 0 "#PWR0106" H 2550 3250 50  0001 C CNN
F 1 "GND" H 2555 3327 50  0000 C CNN
F 2 "" H 2550 3500 50  0001 C CNN
F 3 "" H 2550 3500 50  0001 C CNN
	1    2550 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3300 2550 3400
$Comp
L power:+12V #PWR0107
U 1 1 5D701C71
P 3100 1900
F 0 "#PWR0107" H 3100 1750 50  0001 C CNN
F 1 "+12V" H 3115 2073 50  0000 C CNN
F 2 "" H 3100 1900 50  0001 C CNN
F 3 "" H 3100 1900 50  0001 C CNN
	1    3100 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2300 3100 2300
Wire Wire Line
	3100 2300 3100 1900
Wire Wire Line
	2150 2900 2150 3000
Wire Wire Line
	2150 3000 2150 3100
Connection ~ 2150 3000
Wire Wire Line
	2150 3100 2150 3400
Wire Wire Line
	2150 3400 2550 3400
Connection ~ 2150 3100
Connection ~ 2550 3400
Wire Wire Line
	2550 3400 2550 3500
NoConn ~ 2950 2900
NoConn ~ 2950 3000
NoConn ~ 2950 3100
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
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6900 2000 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/cdn/e/control/relay/power/catalog/mech_eng_js.pdf" H 6450 2050 50  0001 C CNN
	1    6450 2050
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K2
U 1 1 5D71E187
P 6450 3000
F 0 "K2" H 6880 3046 50  0000 L CNN
F 1 "JS1-12V-F" H 6880 2955 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6900 2950 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/cdn/e/control/relay/power/catalog/mech_eng_js.pdf" H 6450 3000 50  0001 C CNN
	1    6450 3000
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K3
U 1 1 5D71EA70
P 6450 4000
F 0 "K3" H 6880 4046 50  0000 L CNN
F 1 "JS1-12V-F" H 6880 3955 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6900 3950 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/cdn/e/control/relay/power/catalog/mech_eng_js.pdf" H 6450 4000 50  0001 C CNN
	1    6450 4000
	1    0    0    -1  
$EndComp
$Comp
L Relay:SANYOU_SRD_Form_C K4
U 1 1 5D72022B
P 6450 5050
F 0 "K4" H 6880 5096 50  0000 L CNN
F 1 "JS1-12V-F" H 6880 5005 50  0000 L CNN
F 2 "Relays_THT:Relay_SPDT_SANYOU_SRD_Series_Form_C" H 6900 5000 50  0001 L CNN
F 3 "https://www3.panasonic.biz/ac/cdn/e/control/relay/power/catalog/mech_eng_js.pdf" H 6450 5050 50  0001 C CNN
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
	2950 2500 4500 2500
Wire Wire Line
	6250 2600 6250 2700
Wire Wire Line
	2950 2700 4500 2700
Wire Wire Line
	2950 2800 4400 2800
$Comp
L Diode:1N4004 D1
U 1 1 5D728894
P 5650 2050
F 0 "D1" V 5604 2129 50  0000 L CNN
F 1 "1N4004" V 5695 2129 50  0000 L CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 1875 50  0001 C CNN
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
F 2 "Diodes_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 2775 50  0001 C CNN
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
F 2 "Diodes_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 3825 50  0001 C CNN
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
F 2 "Diodes_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 4875 50  0001 C CNN
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
Wire Wire Line
	4600 2600 2950 2600
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
$EndSCHEMATC
