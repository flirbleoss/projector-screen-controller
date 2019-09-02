EESchema Schematic File Version 4
LIBS:projector-screen-controller-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "Projector Screen Controller"
Date "2019-08-31"
Rev "0.1"
Comp "Flirble Open Source"
Comment1 "https://github.com/flirbleoss/projector-screen-controller"
Comment2 "Copyright (c) 2019 Chris Luke; licensed under SHL-2.0"
Comment3 ""
Comment4 "Power supplies"
$EndDescr
$Comp
L Regulator_Linear:L78L05_TO92 U3
U 1 1 5D6EF6FD
P 7900 3250
F 0 "U3" H 7900 3492 50  0000 C CNN
F 1 "L78L05_TO92" H 7900 3401 50  0000 C CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow_Oval" H 7900 3475 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 7900 3200 50  0001 C CNN
	1    7900 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3550 7900 3800
Wire Wire Line
	8550 3250 8200 3250
Wire Wire Line
	7250 3250 7600 3250
$Comp
L Device:C C9
U 1 1 5D6F3384
P 7250 3550
F 0 "C9" H 7365 3596 50  0000 L CNN
F 1 "0.33uF" H 7365 3505 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7288 3400 50  0001 C CNN
F 3 "~" H 7250 3550 50  0001 C CNN
	1    7250 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5D6F4B58
P 8550 3550
F 0 "C10" H 8665 3596 50  0000 L CNN
F 1 "0.1uF" H 8665 3505 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8588 3400 50  0001 C CNN
F 3 "~" H 8550 3550 50  0001 C CNN
	1    8550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3700 8550 3800
Wire Wire Line
	8550 3800 7900 3800
Connection ~ 7900 3800
Wire Wire Line
	7900 3800 7250 3800
Wire Wire Line
	7250 3800 7250 3700
Wire Wire Line
	7250 3250 7250 3400
Connection ~ 7250 3250
Wire Wire Line
	8550 3250 8550 3400
Connection ~ 8550 3250
$Comp
L Chris_Power:PSK-S20C-12 PS1
U 1 1 5D779061
P 3650 3350
F 0 "PS1" H 3650 3675 50  0000 C CNN
F 1 "PSK-S20C-12" H 3650 3584 50  0000 C CNN
F 2 "Chris_Power:ACDC-Conv_CUI-PSK-S20C" H 3650 3050 50  0001 C CNN
F 3 "https://www.cui.com/product/resource/psk-s20c.pdf" H 4050 3000 50  0001 C CNN
	1    3650 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5D77B64E
P 4300 3400
F 0 "C11" H 4415 3446 50  0000 L CNN
F 1 "1uF/25V" H 4415 3355 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4338 3250 50  0001 C CNN
F 3 "~" H 4300 3400 50  0001 C CNN
	1    4300 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3250 4300 3250
Wire Wire Line
	4050 3450 4150 3450
$Comp
L Device:CP C12
U 1 1 5D77F0B2
P 4900 3400
F 0 "C12" H 5018 3446 50  0000 L CNN
F 1 "470uF/25V" H 5018 3355 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D10.0mm_P2.50mm_P5.00mm" H 4938 3250 50  0001 C CNN
F 3 "~" H 4900 3400 50  0001 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
Connection ~ 4300 3250
Connection ~ 4900 3250
Wire Wire Line
	4300 3250 4900 3250
Text HLabel 1700 3250 0    50   Input ~ 0
LINE
Text HLabel 1700 3450 0    50   Input ~ 0
NEUT
Wire Wire Line
	1700 3250 2250 3250
Wire Wire Line
	1700 3450 2800 3450
Text HLabel 9650 2500 2    50   Output ~ 0
+12V
Wire Wire Line
	7250 2500 7250 3250
Connection ~ 7250 2500
Wire Wire Line
	7250 2500 9650 2500
Text HLabel 9650 2650 2    50   Output ~ 0
+5V
Wire Wire Line
	8550 2650 9150 2650
Wire Wire Line
	8550 2650 8550 3250
Text HLabel 9600 3800 2    50   BiDi ~ 0
GND
Wire Wire Line
	8550 3800 9150 3800
Connection ~ 8550 3800
Wire Wire Line
	7250 3800 6100 3800
Connection ~ 7250 3800
$Comp
L Device:Varistor RV?
U 1 1 5D700221
P 2250 3650
AR Path="/5D700221" Ref="RV?"  Part="1" 
AR Path="/5D68B9FF/5D700221" Ref="RV1"  Part="1" 
F 0 "RV1" H 2353 3696 50  0000 L CNN
F 1 "360V" H 2353 3605 50  0000 L CNN
F 2 "Varistors:RV_Disc_D15.5_W7.2_P7.5" V 2180 3650 50  0001 C CNN
F 3 "~" H 2250 3650 50  0001 C CNN
F 4 "Vishay" H 2250 3650 50  0001 C CNN "mfr"
F 5 "VDRS14T230BSE" H 2250 3650 50  0001 C CNN "part#"
	1    2250 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:Varistor RV?
U 1 1 5D700227
P 2800 3650
AR Path="/5D700227" Ref="RV?"  Part="1" 
AR Path="/5D68B9FF/5D700227" Ref="RV2"  Part="1" 
F 0 "RV2" H 2903 3696 50  0000 L CNN
F 1 "360V" H 2903 3605 50  0000 L CNN
F 2 "Varistors:RV_Disc_D15.5_W7.2_P7.5" V 2730 3650 50  0001 C CNN
F 3 "~" H 2800 3650 50  0001 C CNN
F 4 "VDRS14T230BSE" H 2800 3650 50  0001 C CNN "part#"
	1    2800 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3800 2250 3850
Wire Wire Line
	2800 3800 2800 3850
Wire Wire Line
	2800 3850 2250 3850
Connection ~ 2250 3850
Text HLabel 1700 3850 0    50   UnSpc ~ 0
EARTH
Wire Wire Line
	1700 3850 2250 3850
Wire Wire Line
	2250 3500 2250 3250
Connection ~ 2250 3250
Wire Wire Line
	2250 3250 3250 3250
Wire Wire Line
	2800 3500 2800 3450
Connection ~ 2800 3450
Wire Wire Line
	2800 3450 3250 3450
$Comp
L Device:D_TVS D5
U 1 1 5D7077D8
P 5650 3400
F 0 "D5" V 5604 3479 50  0000 L CNN
F 1 "15V" V 5695 3479 50  0000 L CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 5650 3400 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/427/15ke-240293.pdf" H 5650 3400 50  0001 C CNN
F 4 "Vishay" H 5650 3400 50  0001 C CNN "mfr"
F 5 "1.5KE15CA-E3/54" H 5650 3400 50  0001 C CNN "part#"
	1    5650 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 3550 5650 3800
Wire Wire Line
	5650 3250 5650 2500
Connection ~ 5650 3250
Wire Wire Line
	5650 2500 6100 2500
Wire Wire Line
	4900 3250 5650 3250
$Comp
L Device:LED D6
U 1 1 5D70BFF3
P 6100 3400
F 0 "D6" V 6139 3283 50  0000 R CNN
F 1 "LED" V 6048 3283 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 6100 3400 50  0001 C CNN
F 3 "~" H 6100 3400 50  0001 C CNN
	1    6100 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 3550 6100 3800
Connection ~ 6100 3800
Wire Wire Line
	6100 3800 5650 3800
$Comp
L Device:R R2
U 1 1 5D70D964
P 6100 2950
F 0 "R2" H 6170 2996 50  0000 L CNN
F 1 "R" H 6170 2905 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6030 2950 50  0001 C CNN
F 3 "~" H 6100 2950 50  0001 C CNN
	1    6100 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2800 6100 2500
Connection ~ 6100 2500
Wire Wire Line
	6100 2500 7250 2500
Wire Wire Line
	6100 3100 6100 3250
$Comp
L Device:LED D7
U 1 1 5D70F3A3
P 9150 3400
F 0 "D7" V 9189 3283 50  0000 R CNN
F 1 "LED" V 9098 3283 50  0000 R CNN
F 2 "LEDs:LED_D5.0mm" H 9150 3400 50  0001 C CNN
F 3 "~" H 9150 3400 50  0001 C CNN
	1    9150 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9150 3550 9150 3800
Connection ~ 9150 3800
Wire Wire Line
	9150 3800 9600 3800
$Comp
L Device:R R3
U 1 1 5D710E5B
P 9150 2950
F 0 "R3" H 9220 2996 50  0000 L CNN
F 1 "R" H 9220 2905 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9080 2950 50  0001 C CNN
F 3 "~" H 9150 2950 50  0001 C CNN
	1    9150 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3100 9150 3250
Wire Wire Line
	9150 2800 9150 2650
Connection ~ 9150 2650
Wire Wire Line
	9150 2650 9650 2650
Wire Wire Line
	4150 3800 4300 3800
Connection ~ 5650 3800
Wire Wire Line
	4900 3550 4900 3800
Connection ~ 4900 3800
Wire Wire Line
	4900 3800 5650 3800
Wire Wire Line
	4300 3550 4300 3800
Connection ~ 4300 3800
Wire Wire Line
	4300 3800 4900 3800
Wire Wire Line
	4150 3450 4150 3800
$EndSCHEMATC
