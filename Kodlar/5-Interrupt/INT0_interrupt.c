#define loop_led PORTB.RB1
#define interrupt_led PORTB.RB2

void interrupt()
{
     if(INTCON.INT0IF)
     {
       interrupt_led = ~interrupt_led;
     }

    INTCON.INT0IF=0;
}


void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISB=0x01;
PORTB=0;

INTCON=0x80;
INTCON.INT0IE=1;
INTCON.INT0IF=0;

INTCON2.INTEDG0=1;

RCON.IPEN=1;

}

void main() {
  kurulum();

  do
  {
     loop_led=1;
     delay_ms(1000);
     loop_led=0;
     delay_ms(1000);
  }
  while(1) ;
}