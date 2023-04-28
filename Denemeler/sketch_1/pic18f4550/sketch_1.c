#define arttir1 PORTC.RC0
#define arttir2 PORTC.RC1
#define topla   PORTC.RC2

unsigned short toplam,onlar,birler;
unsigned short display1=0;
unsigned short display2=0;
unsigned short numbers1[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};
unsigned short numbers2[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

void kurulum() {

  ADCON1 |=0x0F;
  CMCON  |=0x07;

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
 if(arttir1)
 {
   display1++;
   LATD=numbers1[display1];
   while(arttir1);
 }
  if(arttir2)
 {
   display2++;
   LATB=numbers2[display2];
   while(arttir2);
 }
   if ( (display1>9) | (display1<0) )
   display1=0;
   if ( (display2>9) | (display2<0) )
   display2=0;

  if(topla)
  {
   toplam=display1+display2;
   onlar=toplam/10;
   birler=(toplam-(onlar*10));
   LATD=numbers1[onlar];
   LATB=numbers2[birler];
  }
 }
}