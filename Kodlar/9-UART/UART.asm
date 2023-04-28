
_kurulum:

;UART.c,21 :: 		void kurulum() {
;UART.c,22 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;UART.c,23 :: 		CMCON  |= 0x07;
	MOVLW       7
	IORWF       CMCON+0, 1 
;UART.c,24 :: 		TRISB=0;
	CLRF        TRISB+0 
;UART.c,25 :: 		PORTB=0;
	CLRF        PORTB+0 
;UART.c,26 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;UART.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART.c,28 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART.c,29 :: 		lcd_out(1,1,"Baslatiliyor...");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_UART+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_UART+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART.c,31 :: 		UART1_Init(4800);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;UART.c,32 :: 		delay_ms(500);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_kurulum0:
	DECFSZ      R13, 1, 1
	BRA         L_kurulum0
	DECFSZ      R12, 1, 1
	BRA         L_kurulum0
	DECFSZ      R11, 1, 1
	BRA         L_kurulum0
	NOP
	NOP
;UART.c,33 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_buffer_sifirlama:

;UART.c,34 :: 		void buffer_sifirlama() {
;UART.c,35 :: 		RCREG=0;
	CLRF        RCREG+0 
;UART.c,36 :: 		RCREG=0;
	CLRF        RCREG+0 
;UART.c,37 :: 		}
L_end_buffer_sifirlama:
	RETURN      0
; end of _buffer_sifirlama

_main:

;UART.c,38 :: 		void main() {
;UART.c,39 :: 		kurulum();
	CALL        _kurulum+0, 0
;UART.c,41 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART.c,42 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;UART.c,43 :: 		lcd_out(1,1,"Calistiriliyor...");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_UART+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_UART+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;UART.c,45 :: 		UART1_Write_Text("**************\r\n");       //MCU'dan PC ye string gönderiliyor.
	MOVLW       ?lstr3_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,47 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	NOP
	NOP
;UART.c,48 :: 		UART1_Write_Text("LED ORNEK\r\n");
	MOVLW       ?lstr4_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,49 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	NOP
	NOP
;UART.c,50 :: 		UART1_Write_Text("LED KONTROL\r\n");
	MOVLW       ?lstr5_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,51 :: 		delay_ms(100);
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
;UART.c,52 :: 		UART1_Write_Text("**************\r\n");
	MOVLW       ?lstr6_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,53 :: 		delay_ms(100);
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
;UART.c,55 :: 		while(1)
L_main5:
;UART.c,57 :: 		if(UART1_DATA_READY())                       //Bir data geldiðinde bu koþul iþleyecek
	CALL        _UART1_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main7
;UART.c,59 :: 		UART1_Read_Text(uart_rd,";",6);             //PC den MCU'ya gönderilen string okunuyor.
	MOVLW       _uart_rd+0
	MOVWF       FARG_UART1_Read_Text_Output+0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FARG_UART1_Read_Text_Output+1 
	MOVLW       ?lstr7_UART+0
	MOVWF       FARG_UART1_Read_Text_Delimiter+0 
	MOVLW       hi_addr(?lstr7_UART+0)
	MOVWF       FARG_UART1_Read_Text_Delimiter+1 
	MOVLW       6
	MOVWF       FARG_UART1_Read_Text_Attempts+0 
	CALL        _UART1_Read_Text+0, 0
;UART.c,60 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;UART.c,62 :: 		if(strcmp(uart_rd,"led,1")==0)              //string karþýlatýrma yapýlýyor.
	MOVLW       _uart_rd+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr8_UART+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr8_UART+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main19
	MOVLW       0
	XORWF       R0, 0 
L__main19:
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
;UART.c,64 :: 		led=1;
	BSF         PORTB+0, 0 
;UART.c,65 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	NOP
	NOP
;UART.c,66 :: 		UART1_Write_Text("LED YANDI\r\n");
	MOVLW       ?lstr9_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,67 :: 		buffer_sifirlama();
	CALL        _buffer_sifirlama+0, 0
;UART.c,68 :: 		}
L_main9:
;UART.c,70 :: 		if(strcmp(uart_rd,"led,0")==0)
	MOVLW       _uart_rd+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr10_UART+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr10_UART+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main20
	MOVLW       0
	XORWF       R0, 0 
L__main20:
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
;UART.c,72 :: 		led=0;
	BCF         PORTB+0, 0 
;UART.c,73 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	NOP
	NOP
;UART.c,74 :: 		UART1_Write_Text("LED SONDU\r\n");
	MOVLW       ?lstr11_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,75 :: 		buffer_sifirlama();
	CALL        _buffer_sifirlama+0, 0
;UART.c,76 :: 		}
L_main11:
;UART.c,78 :: 		if(strcmp(uart_rd,"led,?")==0)         //Ledin durumunun öðrenilmesi için koþul bölümü.
	MOVLW       _uart_rd+0
	MOVWF       FARG_strcmp_s1+0 
	MOVLW       hi_addr(_uart_rd+0)
	MOVWF       FARG_strcmp_s1+1 
	MOVLW       ?lstr12_UART+0
	MOVWF       FARG_strcmp_s2+0 
	MOVLW       hi_addr(?lstr12_UART+0)
	MOVWF       FARG_strcmp_s2+1 
	CALL        _strcmp+0, 0
	MOVLW       0
	XORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main21
	MOVLW       0
	XORWF       R0, 0 
L__main21:
	BTFSS       STATUS+0, 2 
	GOTO        L_main13
;UART.c,80 :: 		if(led==1)
	BTFSS       PORTB+0, 0 
	GOTO        L_main14
;UART.c,82 :: 		UART1_Write_Text("LED AKTIF\r\n");
	MOVLW       ?lstr13_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr13_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,83 :: 		buffer_sifirlama();
	CALL        _buffer_sifirlama+0, 0
;UART.c,84 :: 		}
L_main14:
;UART.c,86 :: 		if(led==0)
	BTFSC       PORTB+0, 0 
	GOTO        L_main15
;UART.c,88 :: 		UART1_Write_Text("LED PASIF\r\n");
	MOVLW       ?lstr14_UART+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_UART+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;UART.c,89 :: 		buffer_sifirlama();
	CALL        _buffer_sifirlama+0, 0
;UART.c,90 :: 		}
L_main15:
;UART.c,91 :: 		}
L_main13:
;UART.c,92 :: 		}
L_main7:
;UART.c,93 :: 		}
	GOTO        L_main5
;UART.c,94 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
