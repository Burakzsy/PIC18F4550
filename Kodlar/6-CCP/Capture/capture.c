#define loop_led PORTB.RB1
#define interrupt_led PORTB.RB2

void interrupt()
{
     if(PIR1.CCP1IF)
     {
       interrupt_led = ~interrupt_led;
     }

   PIR1.CCP1IF=0;
}


void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISC.RC2=1;
PORTC.RC2=0;
TRISB=0;
PORTB=0;

TMR1L=0x00;
TMR1H=0x00;
T1CON=0x83;

CCPR1L=0x00;
CCPR1H=0x00;
CCP1CON=0x05;
PIE1.CCP1IE=1;

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