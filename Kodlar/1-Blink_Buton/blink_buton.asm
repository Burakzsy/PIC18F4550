
_main:

;blink_buton.c,22 :: 		void main() {
;blink_buton.c,23 :: 		ADCON1 |=0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;blink_buton.c,24 :: 		CMCON  |=0x00;
;blink_buton.c,26 :: 		TRISA=0;
	CLRF        TRISA+0 
;blink_buton.c,27 :: 		TRISB=0b11000001;
	MOVLW       193
	MOVWF       TRISB+0 
;blink_buton.c,28 :: 		PORTB=0x00;
	CLRF        PORTB+0 
;blink_buton.c,30 :: 		while(1){
L_main0:
;blink_buton.c,31 :: 		if(button)
	BTFSS       PORTB+0, 7 
	GOTO        L_main2
;blink_buton.c,33 :: 		led=1;
	BSF         PORTA+0, 4 
;blink_buton.c,34 :: 		while(button){}
L_main3:
	BTFSS       PORTB+0, 7 
	GOTO        L_main4
	GOTO        L_main3
L_main4:
;blink_buton.c,35 :: 		}
L_main2:
;blink_buton.c,37 :: 		led=0;
	BCF         PORTA+0, 4 
;blink_buton.c,38 :: 		}
	GOTO        L_main0
;blink_buton.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
