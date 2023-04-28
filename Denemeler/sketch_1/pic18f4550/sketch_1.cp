#line 1 "C:/Users/Burak/Desktop/Mikroişlemci/Trudyo PIC18F4550/Denemeler/sketch_1/pic18f4550/sketch_1.c"




unsigned short toplam,onlar,birler;
unsigned short display1=0;
unsigned short display2=0;
unsigned short numbers1[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
unsigned short numbers2[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

void kurulum() {

 ADCON1 |=0x0F;
 CMCON |=0x07;

 TRISB=0;
 PORTB=0;

 TRISD=0;
 PORTD=0;

 TRISC=0x07;
 PORTC=0;

}
void main() {
 kurulum();

 for(;;)
 {
 if( PORTC.RC0 )
 {
 display1++;
 LATD=numbers1[display1];
 while( PORTC.RC0 );
 }
 if( PORTC.RC1 )
 {
 display2++;
 LATB=numbers2[display2];
 while( PORTC.RC1 );
 }
 if ( (display1>9) | (display1<0) )
 display1=0;
 if ( (display2>9) | (display2<0) )
 display2=0;

 if( PORTC.RC2 )
 {
 toplam=display1+display2;
 onlar=toplam/10;
 birler=(toplam-(onlar*10));
 LATD=numbers1[onlar];
 LATB=numbers2[birler];
 }
 }
}
