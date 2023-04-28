
_interrupt:

;capture.c,4 :: 		void interrupt()
;capture.c,6 :: 		if(PIR1.CCP1IF)
	BTFSS       PIR1+0, 2 
	GOTO        L_interrupt0
;capture.c,8 :: 		interrupt_led = ~interrupt_led;
	BTG         PORTB+0, 2 
;capture.c,9 :: 		}
L_interrupt0:
;capture.c,11 :: 		PIR1.CCP1IF=0;
	BCF         PIR1+0, 2 
;capture.c,12 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_kurulum:

;capture.c,15 :: 		void kurulum()
;capture.c,17 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;capture.c,20 :: 		TRISC.RC2=1;
	BSF         TRISC+0, 2 
;capture.c,21 :: 		PORTC.RC2=0;
	BCF         PORTC+0, 2 
;capture.c,22 :: 		TRISB=0;
	CLRF        TRISB+0 
;capture.c,23 :: 		PORTB=0;
	CLRF        PORTB+0 
;capture.c,25 :: 		TMR1L=0x00;
	CLRF        TMR1L+0 
;capture.c,26 :: 		TMR1H=0x00;
	CLRF        TMR1H+0 
;capture.c,27 :: 		T1CON=0x83;
	MOVLW       131
	MOVWF       T1CON+0 
;capture.c,29 :: 		CCPR1L=0x00;
	CLRF        CCPR1L+0 
;capture.c,30 :: 		CCPR1H=0x00;
	CLRF        CCPR1H+0 
;capture.c,31 :: 		CCP1CON=0x05;
	MOVLW       5
	MOVWF       CCP1CON+0 
;capture.c,32 :: 		PIE1.CCP1IE=1;
	BSF         PIE1+0, 2 
;capture.c,34 :: 		INTCON=0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;capture.c,36 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;capture.c,38 :: 		void main() {
;capture.c,39 :: 		kurulum();
	CALL        _kurulum+0, 0
;capture.c,41 :: 		while(1)
L_main1:
;capture.c,43 :: 		loop_led=1;
	BSF         PORTB+0, 1 
;capture.c,44 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;capture.c,45 :: 		loop_led=0;
	BCF         PORTB+0, 1 
;capture.c,46 :: 		delay_ms(1000);
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
;capture.c,47 :: 		}
	GOTO        L_main1
;capture.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
