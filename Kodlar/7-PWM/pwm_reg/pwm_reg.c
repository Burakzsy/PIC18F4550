#define loop_led PORTB.RB1
#define interrupt_led PORTB.RB2

unsigned short duty1_value;


void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISB=0x03;
PORTB=0;

TRISC=0;

CCPR1L=10;
CCPR1H=0;
CCP1CON=0x0C;

PR2=249;

T2CON=0x05;

INTCON=0xC0;

}

void main() {
  kurulum();
  duty1_value=0;
  while(1)
  {
    if(PORTB.RB0)        //arttýr butonu
    {
    delay_ms(30);
    duty1_value++;
    if(duty1_value>=PR2)
    duty1_value=249;
    CCPR1L=duty1_value;
    }

     if(PORTB.RB1)      //azalt butonu
    {
    delay_ms(30);
    duty1_value--;
    if(duty1_value<1)
    duty1_value=1;
    CCPR1L=duty1_value;
    }
  }

}