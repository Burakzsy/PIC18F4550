#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/4-TIMER/Timer 0/timer0.c"



unsigned int sayac;

void interrupt()
{
 if(INTCON.TMR0IF)
 {
 sayac++;
 TMR0L=0x06;
 if(sayac>=200)
 {
  PORTB.RB1  = ~ PORTB.RB1 ;
 sayac=0;
 }

 INTCON.TMR0IF=0;
 }
}




void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISB=0;
PORTB=0;

T0CON=0xC0;
INTCON=0xC0;
INTCON.TMR0IE=1;
INTCON.TMR0IF=0;


}

void main() {
 kurulum();

 for(;;)
 {
  PORTB.RB0 =1;
 delay_ms(1000);
  PORTB.RB0 =0;
 delay_ms(1000);

 }
}
