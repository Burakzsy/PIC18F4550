
_main:

;display.c,4 :: 		void main() {
;display.c,6 :: 		ADCON1 |= 0x0F;    // A/D Seçimi yapıldı.
	MOVLW       15
	IORWF       ADCON1+0, 1 
;display.c,7 :: 		CMCON  |= 0x07;   // Karşılaştırmalar kapatıldı.
	MOVLW       7
	IORWF       CMCON+0, 1 
;display.c,9 :: 		TRISB=0;
	CLRF        TRISB+0 
;display.c,10 :: 		PORTB=0;
	CLRF        PORTB+0 
;display.c,12 :: 		TRISC=0x03;
	MOVLW       3
	MOVWF       TRISC+0 
;display.c,13 :: 		PORTC=0;
	CLRF        PORTC+0 
;display.c,16 :: 		for(;;)
L_main0:
;display.c,18 :: 		if(artir)
	BTFSS       PORTC+0, 0 
	GOTO        L_main3
;display.c,20 :: 		display++;
	INCF        _display+0, 1 
;display.c,21 :: 		while(artir);
L_main4:
	BTFSS       PORTC+0, 0 
	GOTO        L_main5
	GOTO        L_main4
L_main5:
;display.c,22 :: 		}
L_main3:
;display.c,23 :: 		if(azalt)
	BTFSS       PORTC+0, 1 
	GOTO        L_main6
;display.c,25 :: 		display--;
	DECF        _display+0, 1 
;display.c,26 :: 		while(azalt);
L_main7:
	BTFSS       PORTC+0, 1 
	GOTO        L_main8
	GOTO        L_main7
L_main8:
;display.c,27 :: 		}
L_main6:
;display.c,28 :: 		if ( (display>9) | (display<0) )
	MOVLW       128
	XORLW       9
	MOVWF       R1 
	MOVLW       128
	XORWF       _display+0, 0 
	SUBWF       R1, 0 
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       128
	XORWF       _display+0, 0 
	MOVWF       R0 
	MOVLW       128
	XORLW       0
	SUBWF       R0, 0 
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R1, 0 
	IORWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
;display.c,29 :: 		display=0;
	CLRF        _display+0 
L_main9:
;display.c,31 :: 		PORTB=display;
	MOVF        _display+0, 0 
	MOVWF       PORTB+0 
;display.c,32 :: 		}
	GOTO        L_main0
;display.c,34 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
