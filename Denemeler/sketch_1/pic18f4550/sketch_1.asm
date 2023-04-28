
_kurulum:

;sketch_1.c,11 :: 		void kurulum() {
;sketch_1.c,13 :: 		ADCON1 |=0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;sketch_1.c,14 :: 		CMCON  |=0x07;
	MOVLW       7
	IORWF       CMCON+0, 1 
;sketch_1.c,16 :: 		TRISB=0;
	CLRF        TRISB+0 
;sketch_1.c,17 :: 		PORTB=0;
	CLRF        PORTB+0 
;sketch_1.c,19 :: 		TRISD=0;
	CLRF        TRISD+0 
;sketch_1.c,20 :: 		PORTD=0;
	CLRF        PORTD+0 
;sketch_1.c,22 :: 		TRISC=0x07;
	MOVLW       7
	MOVWF       TRISC+0 
;sketch_1.c,23 :: 		PORTC=0;
	CLRF        PORTC+0 
;sketch_1.c,25 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;sketch_1.c,26 :: 		void main() {
;sketch_1.c,27 :: 		kurulum();
	CALL        _kurulum+0, 0
;sketch_1.c,29 :: 		for(;;)
L_main0:
;sketch_1.c,31 :: 		if(arttir1)
	BTFSS       PORTC+0, 0 
	GOTO        L_main3
;sketch_1.c,33 :: 		display1++;
	INCF        _display1+0, 1 
;sketch_1.c,34 :: 		LATD=numbers1[display1];
	MOVLW       _numbers1+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers1+0)
	MOVWF       FSR0L+1 
	MOVF        _display1+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;sketch_1.c,35 :: 		while(arttir1);
L_main4:
	BTFSS       PORTC+0, 0 
	GOTO        L_main5
	GOTO        L_main4
L_main5:
;sketch_1.c,36 :: 		}
L_main3:
;sketch_1.c,37 :: 		if(arttir2)
	BTFSS       PORTC+0, 1 
	GOTO        L_main6
;sketch_1.c,39 :: 		display2++;
	INCF        _display2+0, 1 
;sketch_1.c,40 :: 		LATB=numbers2[display2];
	MOVLW       _numbers2+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers2+0)
	MOVWF       FSR0L+1 
	MOVF        _display2+0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;sketch_1.c,41 :: 		while(arttir2);
L_main7:
	BTFSS       PORTC+0, 1 
	GOTO        L_main8
	GOTO        L_main7
L_main8:
;sketch_1.c,42 :: 		}
L_main6:
;sketch_1.c,43 :: 		if ( (display1>9) | (display1<0) )
	MOVF        _display1+0, 0 
	SUBLW       9
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	SUBWF       _display1+0, 0 
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	IORWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
;sketch_1.c,44 :: 		display1=0;
	CLRF        _display1+0 
L_main9:
;sketch_1.c,45 :: 		if ( (display2>9) | (display2<0) )
	MOVF        _display2+0, 0 
	SUBLW       9
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	SUBWF       _display2+0, 0 
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	IORWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;sketch_1.c,46 :: 		display2=0;
	CLRF        _display2+0 
L_main10:
;sketch_1.c,48 :: 		if(topla)
	BTFSS       PORTC+0, 2 
	GOTO        L_main11
;sketch_1.c,50 :: 		toplam=display1+display2;
	MOVF        _display2+0, 0 
	ADDWF       _display1+0, 0 
	MOVWF       FLOC__main+0 
	MOVF        FLOC__main+0, 0 
	MOVWF       _toplam+0 
;sketch_1.c,51 :: 		onlar=toplam/10;
	MOVLW       10
	MOVWF       R4 
	MOVF        FLOC__main+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R0, 0 
	MOVWF       _onlar+0 
;sketch_1.c,52 :: 		birler=(toplam-(onlar*10));
	MOVLW       10
	MULWF       R0 
	MOVF        PRODL+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	SUBWF       FLOC__main+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _birler+0 
;sketch_1.c,53 :: 		LATD=numbers1[onlar];
	MOVLW       _numbers1+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers1+0)
	MOVWF       FSR0L+1 
	MOVF        R0, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATD+0 
;sketch_1.c,54 :: 		LATB=numbers2[birler];
	MOVLW       _numbers2+0
	MOVWF       FSR0L+0 
	MOVLW       hi_addr(_numbers2+0)
	MOVWF       FSR0L+1 
	MOVF        R1, 0 
	ADDWF       FSR0L+0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0L+1, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       LATB+0 
;sketch_1.c,55 :: 		}
L_main11:
;sketch_1.c,56 :: 		}
	GOTO        L_main0
;sketch_1.c,57 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
