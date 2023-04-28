
_interrupt:

;Compare.c,4 :: 		void interrupt()
;Compare.c,6 :: 		if(PIR1.CCP1IF)
	BTFSS       PIR1+0, 2 
	GOTO        L_interrupt0
;Compare.c,8 :: 		interrupt_led = 1;
	BSF         PORTB+0, 2 
;Compare.c,9 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	NOP
	NOP
;Compare.c,10 :: 		interrupt_led = 0;
	BCF         PORTB+0, 2 
;Compare.c,11 :: 		delay_ms(100);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_interrupt2
	NOP
	NOP
;Compare.c,12 :: 		}
L_interrupt0:
;Compare.c,14 :: 		PIR1.CCP1IF=0;
	BCF         PIR1+0, 2 
;Compare.c,15 :: 		TMR1L=2;
	MOVLW       2
	MOVWF       TMR1L+0 
;Compare.c,16 :: 		}
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_kurulum:

;Compare.c,19 :: 		void kurulum()
;Compare.c,21 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Compare.c,24 :: 		TRISB=0;
	CLRF        TRISB+0 
;Compare.c,25 :: 		PORTB=0;
	CLRF        PORTB+0 
;Compare.c,27 :: 		TMR1L=0x00;
	CLRF        TMR1L+0 
;Compare.c,28 :: 		TMR1H=0x00;
	CLRF        TMR1H+0 
;Compare.c,29 :: 		T1CON=0x03;
	MOVLW       3
	MOVWF       T1CON+0 
;Compare.c,31 :: 		CCPR1L=0x01;
	MOVLW       1
	MOVWF       CCPR1L+0 
;Compare.c,32 :: 		CCPR1H=0x00;
	CLRF        CCPR1H+0 
;Compare.c,33 :: 		CCP1CON=0x0A;
	MOVLW       10
	MOVWF       CCP1CON+0 
;Compare.c,34 :: 		PIE1.CCP1IE=1;
	BSF         PIE1+0, 2 
;Compare.c,35 :: 		PIR1.CCP1IF=0;
	BCF         PIR1+0, 2 
;Compare.c,37 :: 		INTCON=0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;Compare.c,39 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;Compare.c,41 :: 		void main() {
;Compare.c,42 :: 		kurulum();
	CALL        _kurulum+0, 0
;Compare.c,44 :: 		while(1)
L_main3:
;Compare.c,46 :: 		loop_led=1;
	BSF         PORTB+0, 1 
;Compare.c,47 :: 		delay_ms(1000);
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
;Compare.c,48 :: 		loop_led=0;
	BCF         PORTB+0, 1 
;Compare.c,49 :: 		delay_ms(1000);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;Compare.c,50 :: 		}
	GOTO        L_main3
;Compare.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
