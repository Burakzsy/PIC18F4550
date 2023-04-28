#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/7-PWM/pwm_lib/pwm_lib.c"
unsigned short duty1_value;
void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISB=0x03;
PORTB=0;

TRISC=0;

PWM1_Init(1000);

}

void main() {
 kurulum();
 duty1_value=10;

 PWM1_Start();
 PWM1_Set_Duty(duty1_value);

 while(1)
 {
 if(PORTB.RB0)
 {
 delay_ms(30);
 duty1_value++;
 PWM1_Set_Duty(duty1_value);
 }

 if(PORTB.RB1)
 {
 delay_ms(30);
 duty1_value--;
 PWM1_Set_Duty(duty1_value);
 }
 }

}
