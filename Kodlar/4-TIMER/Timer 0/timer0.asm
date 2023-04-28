
_interrupt:

;timer0.c,6 :: 		void interrupt()
;timer0.c,8 :: 		if(INTCON.TMR0IF) //  Her 500us de bir flag aktif olacak.
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;timer0.c,10 :: 		sayac++;
	INFSNZ      _sayac+0, 1 
	INCF        _sayac+1, 1 
;timer0.c,11 :: 		TMR0L=0x06;
	MOVLW       6
	MOVWF       TMR0L+0 
;timer0.c,12 :: 		if(sayac>=200)    // Her 100 ms de bir iþlem görecek
	MOVLW       0
	SUBWF       _sayac+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt9
	MOVLW       200
	SUBWF       _sayac+0, 0 
L__interrupt9:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt1
;timer0.c,14 :: 		interrupt_led = ~interrupt_led;
	BTG         PORTB+0, 1 
;timer0.c,15 :: 		sayac=0;
	CLRF        _sayac+0 
	CLRF        _sayac+1 
;timer0.c,16 :: 		}
L_interrupt1:
;timer0.c,18 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;timer0.c,19 :: 		}
L_interrupt0:
;timer0.c,20 :: 		}
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_kurulum:

;timer0.c,25 :: 		void kurulum()
;timer0.c,27 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;timer0.c,30 :: 		TRISB=0;  //B portu çýkýr olarak ayarlandý.
	CLRF        TRISB+0 
;timer0.c,31 :: 		PORTB=0; // Sinyal seviyesi low'a çekildi
	CLRF        PORTB+0 
;timer0.c,33 :: 		T0CON=0xC0;
	MOVLW       192
	MOVWF       T0CON+0 
;timer0.c,34 :: 		INTCON=0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;timer0.c,35 :: 		INTCON.TMR0IE=1;
	BSF         INTCON+0, 5 
;timer0.c,36 :: 		INTCON.TMR0IF=0;
	BCF         INTCON+0, 2 
;timer0.c,39 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;timer0.c,41 :: 		void main() {
;timer0.c,42 :: 		kurulum();
	CALL        _kurulum+0, 0
;timer0.c,44 :: 		for(;;)
L_main2:
;timer0.c,46 :: 		loop_led=1;
	BSF         PORTB+0, 0 
;timer0.c,47 :: 		delay_ms(1000);
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
;timer0.c,48 :: 		loop_led=0;
	BCF         PORTB+0, 0 
;timer0.c,49 :: 		delay_ms(1000);
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
;timer0.c,51 :: 		}
	GOTO        L_main2
;timer0.c,52 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
