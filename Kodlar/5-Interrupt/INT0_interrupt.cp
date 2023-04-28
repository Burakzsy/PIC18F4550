#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/5-Interrupt/INT0_interrupt.c"



void interrupt()
{
 if(INTCON.INT0IF)
 {
  PORTB.RB2  = ~ PORTB.RB2 ;
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
  PORTB.RB1 =1;
 delay_ms(1000);
  PORTB.RB1 =0;
 delay_ms(1000);
 }
 while(1) ;
}
