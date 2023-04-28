#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/4-TIMER/Timer 2/timer2.c"



unsigned int sayac;

void interrupt()
{
 if(PIR1.TMR2IF)
 {
 sayac++;
 TMR2=0x06;
 if(sayac>=100)
 {
  PORTB.RB1  = ~ PORTB.RB1 ;
 sayac=0;
 }

 PIR1.TMR2IF=0;
 }
}

void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISB=0;
PORTB=0;

T2CON=0x05;
INTCON=0xC0;
PIE1.TMR2IE=1;
PIR1.TMR2IF=0;

sayac=0;
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
