#define artir PORTC.RC0
#define azalt PORTC.RC1
short display=0;
void main() {

  ADCON1 |= 0x0F;    // A/D Se�imi yap�ld�.
  CMCON  |= 0x07;   // Kar��la�t�rmalar kapat�ld�.
  
  TRISB=0;
  PORTB=0;
  
  TRISC=0x03;
  PORTC=0;
  
  
  for(;;)
  {
    if(artir)
    {
    display++;
    while(artir);
    }
    if(azalt)
    {
    display--;
    while(azalt);
    }
    if ( (display>9) | (display<0) )
    display=0;
    
    PORTB=display;
  }

}