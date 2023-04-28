#line 1 "C:/Users/Burak/Desktop/Mikroiþlemci/Trudyo PIC18F4550/Kodlar/9-UART/UART.c"



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

char uart_rd[10];

void kurulum() {
 ADCON1 |= 0x0F;
 CMCON |= 0x07;
 TRISB=0;
 PORTB=0;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"Baslatiliyor...");

 UART1_Init(4800);
 delay_ms(500);
}
void buffer_sifirlama() {
 RCREG=0;
 RCREG=0;
}
void main() {
 kurulum();

 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"Calistiriliyor...");

 UART1_Write_Text("**************\r\n");

 delay_ms(100);
 UART1_Write_Text("LED ORNEK\r\n");
 delay_ms(100);
 UART1_Write_Text("LED KONTROL\r\n");
 delay_ms(100);
 UART1_Write_Text("**************\r\n");
 delay_ms(100);

 while(1)
 {
 if(UART1_DATA_READY())
 {
 UART1_Read_Text(uart_rd,";",6);
 delay_ms(100);

 if(strcmp(uart_rd,"led,1")==0)
 {
  PORTB.RB0 =1;
 delay_ms(100);
 UART1_Write_Text("LED YANDI\r\n");
 buffer_sifirlama();
 }

 if(strcmp(uart_rd,"led,0")==0)
 {
  PORTB.RB0 =0;
 delay_ms(100);
 UART1_Write_Text("LED SONDU\r\n");
 buffer_sifirlama();
 }

 if(strcmp(uart_rd,"led,?")==0)
 {
 if( PORTB.RB0 ==1)
 {
 UART1_Write_Text("LED AKTIF\r\n");
 buffer_sifirlama();
 }

 if( PORTB.RB0 ==0)
 {
 UART1_Write_Text("LED PASIF\r\n");
 buffer_sifirlama();
 }
 }
 }
}
}
