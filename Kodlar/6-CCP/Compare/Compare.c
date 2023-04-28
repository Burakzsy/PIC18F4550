#define loop_led PORTB.RB1
#define interrupt_led PORTB.RB2

void interrupt()
{
     if(PIR1.CCP1IF)
     {
       interrupt_led = 1;
       delay_ms(100);
       interrupt_led = 0;
       delay_ms(100);
     }

   PIR1.CCP1IF=0;
   TMR1L=2;
}


void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISB=0;
PORTB=0;

TMR1L=0x00;
TMR1H=0x00;
T1CON=0x03;

CCPR1L=0x01;
CCPR1H=0x00;
CCP1CON=0x0A;
PIE1.CCP1IE=1;
PIR1.CCP1IF=0;

INTCON=0xC0;

}

void main() {
  kurulum();

  while(1)
  {
     loop_led=1;
     delay_ms(1000);
     loop_led=0;
     delay_ms(1000);
  }

}