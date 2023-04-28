#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/6-CCP/Compare/Compare.c"



void interrupt()
{
 if(PIR1.CCP1IF)
 {
  PORTB.RB2  = 1;
 delay_ms(100);
  PORTB.RB2  = 0;
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
  PORTB.RB1 =1;
 delay_ms(1000);
  PORTB.RB1 =0;
 delay_ms(1000);
 }

}
