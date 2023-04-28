#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/1-Blink_Buton/blink_buton.c"
#line 22 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/1-Blink_Buton/blink_buton.c"
void main() {
 ADCON1 |=0x0F;
 CMCON |=0x00;

 TRISA=0;
 TRISB=0b11000001;
 PORTB=0x00;

 while(1){
 if( PORTB.RB7 )
 {
  PORTA.RA4 =1;
 while( PORTB.RB7 ){}
 }

  PORTA.RA4 =0;
 }

}
