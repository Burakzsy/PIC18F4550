unsigned int adc_value;
unsigned short onlar,birler;
float volt,temp;
unsigned short numbers1[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

void kurulum() {
    ADCON0 |= 0x01;
    ADCON1 |= 0x0E;
    ADCON2 |= 0x81;

    CMCON  |= 0x07;
    
    TRISB=0;
    PORTB=0;

    TRISD=0;
    PORTD=0;
}

void main() {
      kurulum();
      
    while(1){
      adc_value=ADC_read(0);
      delay_ms(20);
      volt=0.00488281*adc_value ;
      temp=volt*100;

      onlar=temp/10;
      birler=(temp-(onlar*10));
      LATD=numbers1[onlar];
      LATB=numbers1[birler];
      delay_ms(500);
      }
}