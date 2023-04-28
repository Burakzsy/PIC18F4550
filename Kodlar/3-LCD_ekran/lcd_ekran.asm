
_CustomChar0:

;lcd_ekran.c,19 :: 		void CustomChar0() {
;lcd_ekran.c,21 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_ekran.c,22 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character0[i]);
	CLRF        CustomChar0_i_L0+0 
L_CustomChar00:
	MOVF        CustomChar0_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar01
	MOVLW       _character0+0
	ADDWF       CustomChar0_i_L0+0, 0 
	MOVWF       TBLPTR+0 
	MOVLW       hi_addr(_character0+0)
	MOVWF       TBLPTR+1 
	MOVLW       0
	ADDWFC      TBLPTR+1, 1 
	MOVLW       higher_addr(_character0+0)
	MOVWF       TBLPTR+2 
	MOVLW       0
	ADDWFC      TBLPTR+2, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar0_i_L0+0, 1 
	GOTO        L_CustomChar00
L_CustomChar01:
;lcd_ekran.c,23 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_ekran.c,25 :: 		}
L_end_CustomChar0:
	RETURN      0
; end of _CustomChar0

_main:

;lcd_ekran.c,27 :: 		void main() {
;lcd_ekran.c,28 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;lcd_ekran.c,29 :: 		CMCON |= 0x07;
	MOVLW       7
	IORWF       CMCON+0, 1 
;lcd_ekran.c,31 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;lcd_ekran.c,32 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_ekran.c,33 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_ekran.c,34 :: 		LCD_out(1,1,"1.satir");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_lcd_ekran+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_lcd_ekran+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd_ekran.c,35 :: 		LCD_out(2,1,"2.satir");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_lcd_ekran+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_lcd_ekran+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd_ekran.c,36 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	NOP
	NOP
;lcd_ekran.c,37 :: 		Lcd_Cmd(_LCD_TURN_OFF);
	MOVLW       8
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_ekran.c,38 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;lcd_ekran.c,39 :: 		Lcd_Cmd(_LCD_TURN_ON);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_ekran.c,40 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;lcd_ekran.c,42 :: 		CustomChar0();
	CALL        _CustomChar0+0, 0
;lcd_ekran.c,43 :: 		Lcd_Chr(1,16,0);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       16
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_ekran.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
