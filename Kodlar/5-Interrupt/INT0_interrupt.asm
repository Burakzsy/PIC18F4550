
_interrupt:

;INT0_interrupt.c,4 :: 		void interrupt()
;INT0_interrupt.c,6 :: 		if(INTCON.INT0IF)
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt0
;INT0_interrupt.c,8 :: 		interrupt_led = ~interrupt_led;
	BTG         PORTB+0, 2 
;INT0_interrupt.c,9 :: 		}
L_interrupt0:
;INT0_interrupt.c,11 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;INT0_interrupt.c,12 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_kurulum:

;INT0_interrupt.c,15 :: 		void kurulum()
;INT0_interrupt.c,17 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;INT0_interrupt.c,20 :: 		TRISB=0x01;
	MOVLW       1
	MOVWF       TRISB+0 
;INT0_interrupt.c,21 :: 		PORTB=0;
	CLRF        PORTB+0 
;INT0_interrupt.c,23 :: 		INTCON=0x80;
	MOVLW       128
	MOVWF       INTCON+0 
;INT0_interrupt.c,24 :: 		INTCON.INT0IE=1;
	BSF         INTCON+0, 4 
;INT0_interrupt.c,25 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;INT0_interrupt.c,27 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;INT0_interrupt.c,29 :: 		RCON.IPEN=1;
	BSF         RCON+0, 7 
;INT0_interrupt.c,31 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;INT0_interrupt.c,33 :: 		void main() {
;INT0_interrupt.c,34 :: 		kurulum();
	CALL        _kurulum+0, 0
;INT0_interrupt.c,36 :: 		do
L_main1:
;INT0_interrupt.c,38 :: 		loop_led=1;
	BSF         PORTB+0, 1 
;INT0_interrupt.c,39 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
	NOP
;INT0_interrupt.c,40 :: 		loop_led=0;
	BCF         PORTB+0, 1 
;INT0_interrupt.c,41 :: 		delay_ms(1000);
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
;INT0_interrupt.c,43 :: 		while(1) ;
	GOTO        L_main1
;INT0_interrupt.c,44 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
