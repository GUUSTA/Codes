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

	printf("DEPOIS: %d:%d:%d\n\n", agora.hora, agora.minuto, agora.segundo);

	struct horario antes;
	int somatorio = 100;

	antes.hora = somatorio * depois->segundo; // 100 * 40
	antes.minuto = agora.minuto + depois->segundo; // 25 + 40
	antes.segundo = depois->hora + depois->minuto; // 11 + 25

	printf("ANTES : %d:%d:%d\n\n", antes.hora, antes.minuto, antes.segundo);


	return 0;
}
