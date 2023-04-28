
_interrupt:

;timer2.c,6 :: 		void interrupt()
;timer2.c,8 :: 		if(PIR1.TMR2IF) //  Her 500us de bir flag aktif olacak.
	BTFSS       PIR1+0, 1 
	GOTO        L_interrupt0
;timer2.c,10 :: 		sayac++;
	INFSNZ      _sayac+0, 1 
	INCF        _sayac+1, 1 
;timer2.c,11 :: 		TMR2=0x06;
	MOVLW       6
	MOVWF       TMR2+0 
;timer2.c,12 :: 		if(sayac>=100)    // Her 100 ms de bir iþlem görecek.
	MOVLW       0
	SUBWF       _sayac+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt9
	MOVLW       100
	SUBWF       _sayac+0, 0 
L__interrupt9:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt1
;timer2.c,14 :: 		interrupt_led = ~interrupt_led;
	BTG         PORTB+0, 1 
;timer2.c,15 :: 		sayac=0;
	CLRF        _sayac+0 
	CLRF        _sayac+1 
;timer2.c,16 :: 		}
L_interrupt1:
;timer2.c,18 :: 		PIR1.TMR2IF=0;
	BCF         PIR1+0, 1 
;timer2.c,19 :: 		}
L_interrupt0:
;timer2.c,20 :: 		}
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_kurulum:

;timer2.c,22 :: 		void kurulum()
;timer2.c,24 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;timer2.c,27 :: 		TRISB=0;  //B portu çýkýr olarak ayarlandý.
	CLRF        TRISB+0 
;timer2.c,28 :: 		PORTB=0; // Sinyal seviyesi low'a çekildi
	CLRF        PORTB+0 
;timer2.c,30 :: 		T2CON=0x05;
	MOVLW       5
	MOVWF       T2CON+0 
;timer2.c,31 :: 		INTCON=0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;timer2.c,32 :: 		PIE1.TMR2IE=1;
	BSF         PIE1+0, 1 
;timer2.c,33 :: 		PIR1.TMR2IF=0;
	BCF         PIR1+0, 1 
;timer2.c,35 :: 		sayac=0;
	CLRF        _sayac+0 
	CLRF        _sayac+1 
;timer2.c,36 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;timer2.c,38 :: 		void main() {
;timer2.c,39 :: 		kurulum();
	CALL        _kurulum+0, 0
;timer2.c,41 :: 		for(;;)
L_main2:
;timer2.c,43 :: 		loop_led=1;
	BSF         PORTB+0, 0 
;timer2.c,44 :: 		delay_ms(1000);
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
;timer2.c,45 :: 		loop_led=0;
	BCF         PORTB+0, 0 
;timer2.c,46 :: 		delay_ms(1000);
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
;timer2.c,48 :: 		}
	GOTO        L_main2
;timer2.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
