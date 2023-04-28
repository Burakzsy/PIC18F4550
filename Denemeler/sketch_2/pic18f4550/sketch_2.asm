
_kurulum:

;sketch_2.c,6 :: 		void kurulum() {
;sketch_2.c,7 :: 		ADCON0 |= 0x01;
	BSF         ADCON0+0, 0 
;sketch_2.c,8 :: 		ADCON1 |= 0x0E;
	MOVLW       14
	IORWF       ADCON1+0, 1 
;sketch_2.c,9 :: 		ADCON2 |= 0x81;
	MOVLW       129
	IORWF       ADCON2+0, 1 
;sketch_2.c,11 :: 		CMCON  |= 0x07;
	MOVLW       7
	IORWF       CMCON+0, 1 
;sketch_2.c,13 :: 		TRISB=0;
	CLRF        TRISB+0 
;sketch_2.c,14 :: 		PORTB=0;
	CLRF        PORTB+0 
;sketch_2.c,16 :: 		TRISD=0;
	CLRF        TRISD+0 
;sketch_2.c,17 :: 		PORTD=0;
	CLRF        PORTD+0 
;sketch_2.c,18 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;sketch_2.c,20 :: 		void main() {
;sketch_2.c,21 :: 		kurulum();
	CALL        _kurulum+0, 0
;sketch_2.c,23 :: 		while(1){
L_main0:
;sketch_2.c,24 :: 		adc_value=ADC_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_value+0 
	MOVF        R1, 0 
	MOVWF       _adc_value+1 
;sketch_2.c,25 :: 		delay_ms(20);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
;sketch_2.c,26 :: 		volt=0.00488281*adc_value ;
	MOVF        _adc_value+0, 0 
	MOVWF       R0 
	MOVF        _adc_value+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       251
	MOVWF       R4 
	MOVLW       255
	MOVWF       R5 
	MOVLW       31
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _volt+0 
	MOVF        R1, 0 
	MOVWF       _volt+1 
	MOVF        R2, 0 
	MOVWF       _volt+2 
	MOVF        R3, 0 
	MOVWF       _volt+3 
;sketch_2.c,27 :: 		temp=volt*100;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	MOVF        R1, 0 
	MOVWF       FLOC__main+2 
	MOVF        R2, 0 
	MOVWF       FLOC__main+3 
	MOVF        R3, 0 
	MOVWF       FLOC__main+4 
	MOVF        FLOC__main+1, 0 
	MOVWF       _temp+0 
	MOVF        FLOC__main+2, 0 
	MOVWF       _temp+1 
	MOVF        FLOC__main+3, 0 
	MOVWF       _temp+2 
	MOVF        FLOC__main+4, 0 
	MOVWF       _temp+3 
;sketch_2.c,29 :: 		onlar=temp/10;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	MOVF        FLOC__main+1, 0 
	MOVWF       R0 
	MOVF        FLOC__main+2, 0 
	MOVWF       R1 
	MOVF        FLOC__main+3, 0 
	MOVWF       R2 
	MOVF        FLOC__main+4, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        FLOC__main+0, 0 
	MOVWF       _onlar+0 
;sketch_2.c,30 :: 		birler=(temp-(onlar*10));
	MOVLW       10
	MULWF       FLOC__main+0 
	MOVF        PRODL+0, 0 
	MOVWF       R0 
	MOVF        PRODH+0, 0 
	MOVWF       R1 
	CALL        _int2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__main+1, 0 
	MOVWF       R0 
	MOVF        FLOC__main+2, 0 
	MOVWF       R1 
	MOVF        FLOC__main+3, 0 
	MOVWF       R2 
	MOVF        FLOC__main+4, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	CALL        _double2byte+0, 0
	MOVF        R0, 0 
	MOVWF       _birler+0 
;sketch_2.c,31 :: 		LATD=numbers1[onlar];
	MOVLW       _numbers1+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers1+0)
	MOVWF       FSR0L+1 
	MOVF        FLOC__main+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;sketch_2.c,32 :: 		LATB=numbers1[birler];
	MOVLW       _numbers1+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers1+0)
	MOVWF       FSR0L+1 
	MOVF        R0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;sketch_2.c,33 :: 		delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
	NOP
;sketch_2.c,34 :: 		}
	GOTO        L_main0
;sketch_2.c,35 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
