#define loop_led PORTB.RB0
#define interrupt_led PORTB.RB1

unsigned int sayac;

void interrupt()
{
     if(PIR1.TMR1IF) //  Her 500us de bir flag aktif olacak.
 {
     sayac++;
     TMR1L=0x06;
     TMR1H=0xFF;
     if(sayac>=200)    // Her 100 ms de bir iþlem görecek
     {
     interrupt_led = ~interrupt_led;
     sayac=0;
     }

    PIR1.TMR1IF=0;
  }
}

void kurulum()
{
ADCON1 |= 0x0F;
CMCON |0x07;

TRISB=0;  //B portu çýkýr olarak ayarlandý.
PORTB=0; // Sinyal seviyesi low'a çekildi

T1CON=0xD9;
INTCON=0xC0;
PIE1.TMR1IE=1;
PIR1.TMR1IF=0;

sayac=0;
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