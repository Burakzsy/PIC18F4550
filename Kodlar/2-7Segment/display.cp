#line 1 "C:/Users/Burak/Desktop/Mikroişlemci/Trudyo PIC18F4550/Kodlar/2-7Segment/display.c"


short display=0;
void main() {

 ADCON1 |= 0x0F;
 CMCON |= 0x07;

 TRISB=0;
 PORTB=0;

 TRISC=0x03;
 PORTC=0;


 for(;;)
 {
 if( PORTC.RC0 )
 {
 display++;
 while( PORTC.RC0 );
 }
 if( PORTC.RC1 )
 {
 display--;
 while( PORTC.RC1 );
 }
 if ( (display>9) | (display<0) )
 display=0;

 PORTB=display;
 }

}
