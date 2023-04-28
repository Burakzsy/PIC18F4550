
_kurulum:

;pwm.c,7 :: 		void kurulum()
;pwm.c,9 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;pwm.c,12 :: 		TRISB=0x03;
	MOVLW       3
	MOVWF       TRISB+0 
;pwm.c,13 :: 		PORTB=0;
	CLRF        PORTB+0 
;pwm.c,15 :: 		TRISC=0;
	CLRF        TRISC+0 
;pwm.c,17 :: 		CCPR1L=10;
	MOVLW       10
	MOVWF       CCPR1L+0 
;pwm.c,18 :: 		CCPR1H=0;
	CLRF        CCPR1H+0 
;pwm.c,19 :: 		CCP1CON=0x0C;
	MOVLW       12
	MOVWF       CCP1CON+0 
;pwm.c,21 :: 		PR2=249;
	MOVLW       249
	MOVWF       PR2+0 
;pwm.c,23 :: 		T2CON=0x05;
	MOVLW       5
	MOVWF       T2CON+0 
;pwm.c,25 :: 		INTCON=0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;pwm.c,27 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;pwm.c,29 :: 		void main() {
;pwm.c,30 :: 		kurulum();
	CALL        _kurulum+0, 0
;pwm.c,31 :: 		duty1_value=0;
	CLRF        _duty1_value+0 
;pwm.c,32 :: 		while(1)
L_main0:
;pwm.c,34 :: 		if(PORTB.RB0)        //arttýr butonu
	BTFSS       PORTB+0, 0 
	GOTO        L_main2
;pwm.c,36 :: 		delay_ms(30);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
;pwm.c,37 :: 		duty1_value++;
	INCF        _duty1_value+0, 1 
;pwm.c,38 :: 		if(duty1_value>=PR2)
	MOVF        PR2+0, 0 
	SUBWF       _duty1_value+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main4
;pwm.c,39 :: 		duty1_value=249;
	MOVLW       249
	MOVWF       _duty1_value+0 
L_main4:
;pwm.c,40 :: 		CCPR1L=duty1_value;
	MOVF        _duty1_value+0, 0 
	MOVWF       CCPR1L+0 
;pwm.c,41 :: 		}
L_main2:
;pwm.c,43 :: 		if(PORTB.RB1)      //azalt butonu
	BTFSS       PORTB+0, 1 
	GOTO        L_main5
;pwm.c,45 :: 		delay_ms(30);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
;pwm.c,46 :: 		duty1_value--;
	DECF        _duty1_value+0, 1 
;pwm.c,47 :: 		if(duty1_value<1)
	MOVLW       1
	SUBWF       _duty1_value+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main7
;pwm.c,48 :: 		duty1_value=1;
	MOVLW       1
	MOVWF       _duty1_value+0 
L_main7:
;pwm.c,49 :: 		CCPR1L=duty1_value;
	MOVF        _duty1_value+0, 0 
	MOVWF       CCPR1L+0 
;pwm.c,50 :: 		}
L_main5:
;pwm.c,51 :: 		}
	GOTO        L_main0
;pwm.c,53 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
