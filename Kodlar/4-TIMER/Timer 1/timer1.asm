
_interrupt:

;timer1.c,6 :: 		void interrupt()
;timer1.c,8 :: 		if(PIR1.TMR1IF) //  Her 500us de bir flag aktif olacak.
	BTFSS       PIR1+0, 0 
	GOTO        L_interrupt0
;timer1.c,10 :: 		sayac++;
	INFSNZ      _sayac+0, 1 
	INCF        _sayac+1, 1 
;timer1.c,11 :: 		TMR1L=0x06;
	MOVLW       6
	MOVWF       TMR1L+0 
;timer1.c,12 :: 		TMR1H=0xFF;
	MOVLW       255
	MOVWF       TMR1H+0 
;timer1.c,13 :: 		if(sayac>=200)    // Her 100 ms de bir iþlem görecek
	MOVLW       0
	SUBWF       _sayac+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt9
	MOVLW       200
	SUBWF       _sayac+0, 0 
L__interrupt9:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt1
;timer1.c,15 :: 		interrupt_led = ~interrupt_led;
	BTG         PORTB+0, 1 
;timer1.c,16 :: 		sayac=0;
	CLRF        _sayac+0 
	CLRF        _sayac+1 
;timer1.c,17 :: 		}
L_interrupt1:
;timer1.c,19 :: 		PIR1.TMR1IF=0;
	BCF         PIR1+0, 0 
;timer1.c,20 :: 		}
L_interrupt0:
;timer1.c,21 :: 		}
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_kurulum:

;timer1.c,23 :: 		void kurulum()
;timer1.c,25 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;timer1.c,28 :: 		TRISB=0;  //B portu çýkýr olarak ayarlandý.
	CLRF        TRISB+0 
;timer1.c,29 :: 		PORTB=0; // Sinyal seviyesi low'a çekildi
	CLRF        PORTB+0 
;timer1.c,31 :: 		T1CON=0xD9;
	MOVLW       217
	MOVWF       T1CON+0 
;timer1.c,32 :: 		INTCON=0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;timer1.c,33 :: 		PIE1.TMR1IE=1;
	BSF         PIE1+0, 0 
;timer1.c,34 :: 		PIR1.TMR1IF=0;
	BCF         PIR1+0, 0 
;timer1.c,36 :: 		sayac=0;
	CLRF        _sayac+0 
	CLRF        _sayac+1 
;timer1.c,37 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;timer1.c,39 :: 		void main() {
;timer1.c,40 :: 		kurulum();
	CALL        _kurulum+0, 0
;timer1.c,42 :: 		for(;;)
L_main2:
;timer1.c,44 :: 		loop_led=1;
	BSF         PORTB+0, 0 
;timer1.c,45 :: 		delay_ms(1000);
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
;timer1.c,46 :: 		loop_led=0;
	BCF         PORTB+0, 0 
;timer1.c,47 :: 		delay_ms(1000);
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
;timer1.c,49 :: 		}
	GOTO        L_main2
;timer1.c,50 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
