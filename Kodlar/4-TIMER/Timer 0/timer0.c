#define loop_led PORTB.RB0
#define interrupt_led PORTB.RB1

unsigned int sayac;

void interrupt()
{
     if(INTCON.TMR0IF) //  Her 500us de bir flag aktif olacak.
 {
     sayac++;
     TMR0L=0x06;
     if(sayac>=200)    // Her 100 ms de bir iþlem görecek
     {
     interrupt_led = ~interrupt_led;
     sayac=0;
     }
     
     INTCON.TMR0IF=0;
  }
}




void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISB=0;  //B portu çýkýr olarak ayarlandý.
PORTB=0; // Sinyal seviyesi low'a çekildi

T0CON=0xC0;
INTCON=0xC0;
INTCON.TMR0IE=1;
INTCON.TMR0IF=0;


}

void main() {
  kurulum();
  
  for(;;)
  {
     loop_led=1;
     delay_ms(1000);
     loop_led=0;
     delay_ms(1000);
     
  }
}