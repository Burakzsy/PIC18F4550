
_kurulum:

;pwm_lib.c,2 :: 		void kurulum()
;pwm_lib.c,4 :: 		ADCON1 |= 0x0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;pwm_lib.c,7 :: 		TRISB=0x03;
	MOVLW       3
	MOVWF       TRISB+0 
;pwm_lib.c,8 :: 		PORTB=0;
	CLRF        PORTB+0 
;pwm_lib.c,10 :: 		TRISC=0;
	CLRF        TRISC+0 
;pwm_lib.c,12 :: 		PWM1_Init(1000);
	BSF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       249
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;pwm_lib.c,14 :: 		}
L_end_kurulum:
	RETURN      0
; end of _kurulum

_main:

;pwm_lib.c,16 :: 		void main() {
;pwm_lib.c,17 :: 		kurulum();
	CALL        _kurulum+0, 0
;pwm_lib.c,18 :: 		duty1_value=10;
	MOVLW       10
	MOVWF       _duty1_value+0 
;pwm_lib.c,20 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;pwm_lib.c,21 :: 		PWM1_Set_Duty(duty1_value);
	MOVF        _duty1_value+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pwm_lib.c,23 :: 		while(1)
L_main0:
;pwm_lib.c,25 :: 		if(PORTB.RB0)        //arttýr butonu
	BTFSS       PORTB+0, 0 
	GOTO        L_main2
;pwm_lib.c,27 :: 		delay_ms(30);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
;pwm_lib.c,28 :: 		duty1_value++;
	INCF        _duty1_value+0, 1 
;pwm_lib.c,29 :: 		PWM1_Set_Duty(duty1_value);
	MOVF        _duty1_value+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pwm_lib.c,30 :: 		}
L_main2:
;pwm_lib.c,32 :: 		if(PORTB.RB1)      //azalt butonu
	BTFSS       PORTB+0, 1 
	GOTO        L_main4
;pwm_lib.c,34 :: 		delay_ms(30);
	MOVLW       39
	MOVWF       R12, 0
	MOVLW       245
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
;pwm_lib.c,35 :: 		duty1_value--;
	DECF        _duty1_value+0, 1 
;pwm_lib.c,36 :: 		PWM1_Set_Duty(duty1_value);
	MOVF        _duty1_value+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;pwm_lib.c,37 :: 		}
L_main4:
;pwm_lib.c,38 :: 		}
	GOTO        L_main0
;pwm_lib.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
