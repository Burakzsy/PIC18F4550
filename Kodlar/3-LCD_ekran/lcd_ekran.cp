#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/3-LCD_ekran/lcd_ekran.c"

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

const char character0[] = {28,24,16,1,3,7,15,31};

void CustomChar0() {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character0[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);

}

void main() {
 ADCON1 |= 0x0F;
 CMCON |= 0x07;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
 LCD_out(1,1,"1.satir");
 LCD_out(2,1,"2.satir");
 delay_ms(100);
 Lcd_Cmd(_LCD_TURN_OFF);
 delay_ms(100);
 Lcd_Cmd(_LCD_TURN_ON);
 delay_ms(1000);

 CustomChar0();
 Lcd_Chr(1,16,0);


}
