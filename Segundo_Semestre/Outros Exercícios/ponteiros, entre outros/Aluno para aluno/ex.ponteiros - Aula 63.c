#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	struct horario
	{
		int hora;
		int minuto;
		int segundo;
	};

	struct horario agora, *depois;
	depois = &agora;

	depois->hora = 11;
	depois->minuto = 25;
	depois->segundo = 40;

	printf("%d:%d:%d\n", agora.hora, agora.minuto, agora.segundo);


	return 0;
}
