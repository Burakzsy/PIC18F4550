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
    if(PORTB.RB0)        //arttýr butonu
    {
    delay_ms(30);
    duty1_value++;
    PWM1_Set_Duty(duty1_value);
    }

     if(PORTB.RB1)      //azalt butonu
    {
    delay_ms(30);
    duty1_value--;
    PWM1_Set_Duty(duty1_value);
    }
  }

}