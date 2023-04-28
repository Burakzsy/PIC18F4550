/*
//BLINK
#define led PORTB.B0
void main() {
    ADCON1 |=0x0F;
    CMCON  |=0x00;
    
    TRISB=0x00;
    PORTB=0x00;
    
    for(;;){
     led=1;
     delay_ms(1000);
     led=0;
     delay_ms(1000);
    }

}                       */
//BUTON
#define led PORTA.RA4
#define button PORTB.RB7
void main() {
    ADCON1 |=0x0F;
    CMCON  |=0x00;

    TRISA=0;
    TRISB=0b11000001;
    PORTB=0x00;

  while(1){
   if(button)
   {
   led=1;
   while(button){}
   }

   led=0;
  }

}