#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	struct horario
	{
		int *pHora;
		int *pMinuto;
		int *pSegundos;
	};

	struct horario hoje;

	int hora = 200;
	int minuto = 300;
	int segundo = 400;

	hoje.pHora = &hora;
	hoje.pMinuto = &minuto;
	hoje.pSegundos = &segundo;

	printf("Hora: %d\n", *hoje.pHora);
	printf("Minuto: %d\n", *hoje.pMinuto);
	printf("Segundo: %d\n", *hoje.pSegundos);

	*hoje.pSegundos = 1000;
	printf("Segundos passa a ser: %d\n", *hoje.pSegundos);

	return 0;
}
