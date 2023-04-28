
_kurulum:

;ADC.c,22 :: 		void kurulum() {
;ADC.c,23 :: 		ADCON0 |= 0x01;
	BSF         ADCON0+0, 0 
;ADC.c,24 :: 		ADCON1 |= 0x0E;
	MOVLW       14
	IORWF       ADCON1+0, 1 
;ADC.c,25 :: 		ADCON2 |= 0x81;
	MOVLW       129
	IORWF       ADCON2+0, 1 
;ADC.c,27 :: 		CMCON  |= 0x07;
	MOVLW       7
	IORWF       CMCON+0, 1 
;ADC.c,29 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;ADC.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ADC.c,31 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ADC.c,32 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;ADC.c,35 :: 		void main() {
;ADC.c,36 :: 		kurulum();
	CALL        _kurulum+0, 0
;ADC.c,38 :: 		while(1)
L_main0:
;ADC.c,40 :: 		adc_value=ADC_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _adc_value+0 
	MOVF        R1, 0 
	MOVWF       _adc_value+1 
;ADC.c,41 :: 		gerilim=(0.00488281*adc_value)*11;
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
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       48
	MOVWF       R6 
	MOVLW       130
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+0 
	MOVF        R1, 0 
	MOVWF       FLOC__main+1 
	MOVF        R2, 0 
	MOVWF       FLOC__main+2 
	MOVF        R3, 0 
	MOVWF       FLOC__main+3 
	MOVF        FLOC__main+0, 0 
	MOVWF       _gerilim+0 
	MOVF        FLOC__main+1, 0 
	MOVWF       _gerilim+1 
	MOVF        FLOC__main+2, 0 
	MOVWF       _gerilim+2 
	MOVF        FLOC__main+3, 0 
	MOVWF       _gerilim+3 
;ADC.c,42 :: 		akim=gerilim/11e3;
	MOVLW       0
	MOVWF       R4 
	MOVLW       224
	MOVWF       R5 
	MOVLW       43
	MOVWF       R6 
	MOVLW       140
	MOVWF       R7 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	MOVF        FLOC__main+1, 0 
	MOVWF       R1 
	MOVF        FLOC__main+2, 0 
	MOVWF       R2 
	MOVF        FLOC__main+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _akim+0 
	MOVF        R1, 0 
	MOVWF       _akim+1 
	MOVF        R2, 0 
	MOVWF       _akim+2 
	MOVF        R3, 0 
	MOVWF       _akim+3 
;ADC.c,44 :: 		sprintf(gerilim_text,"%2.1f",gerilim);
	MOVLW       _gerilim_text+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_gerilim_text+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_1_ADC+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_1_ADC+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_1_ADC+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        FLOC__main+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        FLOC__main+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        FLOC__main+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        FLOC__main+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;ADC.c,45 :: 		sprintf(akim_text,"%.1e",akim);
	MOVLW       _akim_text+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_akim_text+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_2_ADC+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_2_ADC+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_2_ADC+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _akim+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _akim+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _akim+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _akim+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;ADC.c,47 :: 		lcd_out(1,1,"volt:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_ADC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_ADC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC.c,48 :: 		delay_ms(20);
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
;ADC.c,49 :: 		lcd_out(1,7,gerilim_text);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _gerilim_text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_gerilim_text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC.c,50 :: 		delay_ms(20);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
;ADC.c,51 :: 		lcd_out(2,1,"akim:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_ADC+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_ADC+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC.c,52 :: 		delay_ms(20);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
;ADC.c,53 :: 		lcd_out(2,7,akim_text);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _akim_text+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_akim_text+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ADC.c,54 :: 		delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
	NOP
;ADC.c,56 :: 		}
	GOTO        L_main0
;ADC.c,58 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
