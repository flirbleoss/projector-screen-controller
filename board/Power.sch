EESchema Schematic File Version 4
LIBS:projector-screen-controller-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title "Projector Screen Controller"
Date "2019-09-22"
Rev "0.2"
Comp "Flirble Open Source"
Comment1 "https://github.com/flirbleoss/projector-screen-controller"
Comment2 "Copyright (c) 2019 Chris Luke; licensed under SHL-2.0"
Comment3 ""
Comment4 "Power supplies"
$EndDescr
$Comp
L Regulator_Linear:L78L05_TO92 U3
U 1 1 5D6EF6FD
P 7900 3100
F 0 "U3" H 7900 3342 50  0000 C CNN
F 1 "L78L05_TO92" H 7900 3251 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92L" H 7900 3325 50  0001 C CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/15/55/e5/aa/23/5b/43/fd/CD00000446.pdf/files/CD00000446.pdf/jcr:content/translations/en.CD00000446.pdf" H 7900 3050 50  0001 C CNN
F 4 "ST" H 7900 3100 50  0001 C CNN "mfr"
F 5 "L78L05ABZ-TR" H 7900 3100 50  0001 C CNN "mpn"
F 6 "Mouser" H 7900 3100 50  0001 C CNN "Src1"
F 7 "511-L78L05ABZ-TR" H 7900 3100 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/511-L78L05ABZ-TR" H 7900 3100 50  0001 C CNN "Src1 URL"
	1    7900 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3400 7900 3800
Wire Wire Line
	8550 3100 8200 3100
Wire Wire Line
	7250 3100 7600 3100
$Comp
L Device:C C9
U 1 1 5D6F3384
P 7250 3400
F 0 "C9" H 7365 3446 50  0000 L CNN
F 1 "0.33uF" H 7365 3355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7288 3250 50  0001 C CNN
F 3 "~" H 7250 3400 50  0001 C CNN
F 4 "TDK" H 7250 3400 50  0001 C CNN "mfr"
F 5 "FG18X7R1H334KRT00" H 7250 3400 50  0001 C CNN "mpn"
F 6 "Mouser" H 7250 3400 50  0001 C CNN "Src1"
F 7 "810-FG18X7R1H334KRT0" H 7250 3400 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/810-FG18X7R1H334KRT0" H 7250 3400 50  0001 C CNN "Src1 URL"
	1    7250 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5D6F4B58
P 8550 3400
F 0 "C10" H 8665 3446 50  0000 L CNN
F 1 "0.1uF" H 8665 3355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 8588 3250 50  0001 C CNN
F 3 "~" H 8550 3400 50  0001 C CNN
F 4 "TDK" H 8550 3400 50  0001 C CNN "mfr"
F 5 "FG18X7R1H104KNT06" H 8550 3400 50  0001 C CNN "mpn"
F 6 "Mouser" H 8550 3400 50  0001 C CNN "Src1"
F 7 "810-FG18X7R1H104KNT6" H 8550 3400 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/810-FG18X7R1H104KNT6" H 8550 3400 50  0001 C CNN "Src1 URL"
	1    8550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3550 8550 3800
Wire Wire Line
	8550 3800 7900 3800
Wire Wire Line
	7250 3800 7250 3550
Wire Wire Line
	7250 3100 7250 3250
Connection ~ 7250 3100
Wire Wire Line
	8550 3100 8550 3250
Connection ~ 8550 3100
$Comp
L Chris_Power:PSK-S20C-12 PS1
U 1 1 5D779061
P 3650 3350
F 0 "PS1" H 3650 3675 50  0000 C CNN
F 1 "PSK-S20C-12" H 3650 3584 50  0000 C CNN
F 2 "Chris_Power:ACDC-Conv_CUI-PSK-S20C" H 3650 3050 50  0001 C CNN
F 3 "https://www.cui.com/product/resource/psk-s20c.pdf" H 4050 3000 50  0001 C CNN
F 4 "CUI" H 3650 3350 50  0001 C CNN "mfr"
F 5 "PSK-S20C-12" H 3650 3350 50  0001 C CNN "mpn"
F 6 "Mouser" H 3650 3350 50  0001 C CNN "Src1"
F 7 "490-PSK-S20C-12" H 3650 3350 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/490-PSK-S20C-12" H 3650 3350 50  0001 C CNN "Src1 URL"
	1    3650 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5D77B64E
P 4450 3200
F 0 "C11" H 4565 3246 50  0000 L CNN
F 1 "1uF/25V" H 4565 3155 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4488 3050 50  0001 C CNN
F 3 "~" H 4450 3200 50  0001 C CNN
F 4 "TDK" H 4450 3200 50  0001 C CNN "mfr"
F 5 "FG18X7R1E105KRT00" H 4450 3200 50  0001 C CNN "mpn"
F 6 "Mouser" H 4450 3200 50  0001 C CNN "Src1"
F 7 "810-FG18X7R1E105KRT0" H 4450 3200 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/810-FG18X7R1E105KRT0" H 4450 3200 50  0001 C CNN "Src1 URL"
	1    4450 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3450 4150 3450
$Comp
L Device:CP C12
U 1 1 5D77F0B2
P 5150 3200
F 0 "C12" H 5268 3246 50  0000 L CNN
F 1 "470uF/25V" H 5268 3155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P2.50mm_P5.00mm" H 5188 3050 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/293/e-upw-1219485.pdf" H 5150 3200 50  0001 C CNN
F 4 "Nichicon" H 5150 3200 50  0001 C CNN "mfr"
F 5 "UPW1E471MPD" H 5150 3200 50  0001 C CNN "mpn"
F 6 "Mouser" H 5150 3200 50  0001 C CNN "Src1"
F 7 "647-UPW1E471MPD" H 5150 3200 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/647-UPW1E471MPD" H 5150 3200 50  0001 C CNN "Src1 URL"
	1    5150 3200
	1    0    0    -1  
$EndComp
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
	7250 2500 7250 3100
Connection ~ 7250 2500
Wire Wire Line
	7250 2500 8950 2500
Text HLabel 9650 2650 2    50   Output ~ 0
+5V
Wire Wire Line
	8550 2650 8550 3100
Text HLabel 9600 3800 2    50   BiDi ~ 0
GND
Wire Wire Line
	8550 3800 8950 3800
Connection ~ 8550 3800
$Comp
L Device:Varistor RV?
U 1 1 5D700221
P 2250 3650
AR Path="/5D700221" Ref="RV?"  Part="1" 
AR Path="/5D68B9FF/5D700221" Ref="RV1"  Part="1" 
F 0 "RV1" H 2353 3696 50  0000 L CNN
F 1 "360V" H 2353 3605 50  0000 L CNN
F 2 "Varistors:RV_Disc_D15.5_W7.2_P7.5" V 2180 3650 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/427/vdrs-101657.pdf" H 2250 3650 50  0001 C CNN
F 4 "Vishay" H 2250 3650 50  0001 C CNN "mfr"
F 5 "VDRS14T230BSE" H 2250 3650 50  0001 C CNN "mpn"
F 6 "Mouser" H 2250 3650 50  0001 C CNN "Src1"
F 7 "594-2381-595-52316" H 2250 3650 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/594-2381-595-52316" H 2250 3650 50  0001 C CNN "Src1 URL"
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
F 3 "https://www.mouser.com/datasheet/2/427/vdrs-101657.pdf" H 2800 3650 50  0001 C CNN
F 4 "Vishay" H 2800 3650 50  0001 C CNN "mfr"
F 5 "VDRS14T230BSE" H 2800 3650 50  0001 C CNN "mpn"
F 6 "Mouser" H 2800 3650 50  0001 C CNN "Src1"
F 7 "594-2381-595-52316" H 2800 3650 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/594-2381-595-52316" H 2800 3650 50  0001 C CNN "Src1 URL"
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
P 5900 3200
F 0 "D5" V 5854 3279 50  0000 L CNN
F 1 "15V" V 5945 3279 50  0000 L CNN
F 2 "Diodes_THT:D_DO-41_SOD81_P12.70mm_Horizontal" H 5900 3200 50  0001 C CNN
F 3 "https://www.mouser.com/datasheet/2/427/15ke-240293.pdf" H 5900 3200 50  0001 C CNN
F 4 "Vishay" H 5900 3200 50  0001 C CNN "mfr"
F 5 "1.5KE15CA-E3/54" H 5900 3200 50  0001 C CNN "mpn"
F 6 "Mouser" H 5900 3200 50  0001 C CNN "Src1"
F 7 "625-1.5KE15CA-E3" H 5900 3200 50  0001 C CNN "Src1 Part"
F 8 "https://www.mouser.com/ProductDetail/625-1.5KE15CA-E3" H 5900 3200 50  0001 C CNN "Src1 URL"
	1    5900 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3350 5900 3800
Wire Wire Line
	5900 3050 5900 2500
$Comp
L Device:LED D6
U 1 1 5D70BFF3
P 8950 3400
F 0 "D6" V 8989 3283 50  0000 R CNN
F 1 "LED" V 8898 3283 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 8950 3400 50  0001 C CNN
F 3 "~" H 8950 3400 50  0001 C CNN
	1    8950 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 3550 8950 3800
$Comp
L Device:R R2
U 1 1 5D70D964
P 8950 2950
F 0 "R2" H 9020 2996 50  0000 L CNN
F 1 "1K" H 9020 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 8880 2950 50  0001 C CNN
F 3 "~" H 8950 2950 50  0001 C CNN
	1    8950 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2800 8950 2500
Wire Wire Line
	8950 3100 8950 3250
$Comp
L Device:LED D7
U 1 1 5D70F3A3
P 9300 3400
F 0 "D7" V 9339 3283 50  0000 R CNN
F 1 "LED" V 9248 3283 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 9300 3400 50  0001 C CNN
F 3 "~" H 9300 3400 50  0001 C CNN
	1    9300 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9300 3550 9300 3800
$Comp
L Device:R R3
U 1 1 5D710E5B
P 9300 2950
F 0 "R3" H 9370 2996 50  0000 L CNN
F 1 "330R" H 9370 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9230 2950 50  0001 C CNN
F 3 "~" H 9300 2950 50  0001 C CNN
	1    9300 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 3100 9300 3250
Wire Wire Line
	9300 2800 9300 2650
Wire Wire Line
	4150 3800 4450 3800
Connection ~ 5900 3800
Wire Wire Line
	5150 3350 5150 3800
Connection ~ 5150 3800
Wire Wire Line
	5150 3800 5900 3800
Wire Wire Line
	4450 3350 4450 3800
Connection ~ 4450 3800
Wire Wire Line
	4450 3800 5150 3800
Wire Wire Line
	4150 3450 4150 3800
Wire Wire Line
	4050 3250 4150 3250
Wire Wire Line
	4150 3250 4150 2500
Wire Wire Line
	4150 2500 4450 2500
Connection ~ 5900 2500
Wire Wire Line
	5150 3050 5150 2500
Connection ~ 5150 2500
Wire Wire Line
	5150 2500 5900 2500
Wire Wire Line
	4450 3050 4450 2500
Connection ~ 4450 2500
Wire Wire Line
	4450 2500 5150 2500
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5D7501DC
P 7600 3800
AR Path="/5D7501DC" Ref="JP?"  Part="1" 
AR Path="/5D68B9FF/5D7501DC" Ref="JP1"  Part="1" 
F 0 "JP1" H 7600 3900 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 7900 3700 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged2Bar_RoundedPad1.0x1.5mm" H 7600 3800 50  0001 C CNN
F 3 "~" H 7600 3800 50  0001 C CNN
F 4 "1" H 7600 3800 50  0000 C CNN "DNP"
	1    7600 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3800 7900 3800
Connection ~ 7900 3800
Wire Wire Line
	7450 3800 7250 3800
Connection ~ 7250 3800
Text HLabel 9600 4200 2    50   BiDi ~ 0
GNDPWR
Wire Wire Line
	7250 4200 9600 4200
Connection ~ 8950 2500
Wire Wire Line
	8950 2500 9650 2500
Connection ~ 8950 3800
Wire Wire Line
	5900 3800 7250 3800
Wire Wire Line
	5900 2500 7250 2500
Connection ~ 9300 2650
Wire Wire Line
	9300 2650 9650 2650
Connection ~ 9300 3800
Wire Wire Line
	9300 3800 9600 3800
Wire Wire Line
	8550 2650 9300 2650
Wire Wire Line
	8950 3800 9300 3800
Wire Wire Line
	7250 4200 7250 3800
$Comp
L Jumper:SolderJumper_2_Bridged JP?
U 1 1 5D77C086
P 7600 4050
AR Path="/5D77C086" Ref="JP?"  Part="1" 
AR Path="/5D68B9FF/5D77C086" Ref="JP2"  Part="1" 
F 0 "JP2" H 7600 4150 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 7900 3950 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged2Bar_RoundedPad1.0x1.5mm" H 7600 4050 50  0001 C CNN
F 3 "~" H 7600 4050 50  0001 C CNN
F 4 "1" H 7600 4050 50  0000 C CNN "DNP"
	1    7600 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4050 7450 3800
Connection ~ 7450 3800
Wire Wire Line
	7750 4050 7750 3800
Connection ~ 7750 3800
Text Notes 7800 4050 0    50   ~ 0
These bridges join the 12V and 5V ground\nplanes together on each side of the board
$EndSCHEMATC
