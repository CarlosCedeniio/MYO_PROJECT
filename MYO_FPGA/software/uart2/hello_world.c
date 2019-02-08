#include "system.h"
#include <stdio.h>
#include "altera_avalon_uart_regs.h"
void delay(int a){
	volatile int i = 0;
	while (i<a*1000){
		i++;
	}
}
int main()
{
	 printf("Hello from Nios II!\n");
	 unsigned short int data,status;
	 char a;
	while(a!=122){
	 status = IORD_ALTERA_AVALON_UART_STATUS(UART_0_BASE);
	 while (!(status & ALTERA_AVALON_UART_STATUS_RRDY_MSK))
		 status=IORD_ALTERA_AVALON_UART_STATUS(UART_0_BASE);
		a= IORD_ALTERA_AVALON_UART_RXDATA(UART_0_BASE);
		status=ALTERA_AVALON_UART_STATUS_TRDY_MSK;
		//printf ("numero %c\n",(int)a);
	}
	int cont;
	char linea[88]="";
	while(1){
		cont = 0;
			while(a!=122){
				//len del string +1
				if ((cont>1)&(cont<89)){
					status = IORD_ALTERA_AVALON_UART_STATUS(UART_0_BASE);
					 while (!(status & ALTERA_AVALON_UART_STATUS_RRDY_MSK))
						status=IORD_ALTERA_AVALON_UART_STATUS(UART_0_BASE);
					a= IORD_ALTERA_AVALON_UART_RXDATA(UART_0_BASE);
					status=ALTERA_AVALON_UART_STATUS_TRDY_MSK;
					linea[cont-2]=((int)a);
					//printf ("%c",(int)a);
				}else{
					status = IORD_ALTERA_AVALON_UART_STATUS(UART_0_BASE);
					 while (!(status & ALTERA_AVALON_UART_STATUS_RRDY_MSK))
					status=IORD_ALTERA_AVALON_UART_STATUS(UART_0_BASE);
					a= IORD_ALTERA_AVALON_UART_RXDATA(UART_0_BASE);
					status=ALTERA_AVALON_UART_STATUS_TRDY_MSK;
				}
				cont++;


			}
			printf(linea);
			printf("\n");
			a=121;




		}

printf("Fin");

  return 0;
}