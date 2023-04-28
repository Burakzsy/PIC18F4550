#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/8-ADC/ADC.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

unsigned int adc_value;
float gerilim,akim;
char gerilim_text[10];
char akim_text[10];

void kurulum() {
 ADCON0 |= 0x01;
 ADCON1 |= 0x0E;
 ADCON2 |= 0x81;

 CMCON |= 0x07;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
}


void main() {
 kurulum();

 while(1)
 {
 adc_value=ADC_read(0);
 gerilim=(0.00488281*adc_value)*11;
 akim=gerilim/11e3;

 sprintf(gerilim_text,"%2.1f",gerilim);
 sprintf(akim_text,"%.1e",akim);

 lcd_out(1,1,"volt:");
 delay_ms(20);
 lcd_out(1,7,gerilim_text);
 delay_ms(20);
 lcd_out(2,1,"akim:");
 delay_ms(20);
 lcd_out(2,7,akim_text);
 delay_ms(500);

 }

}
