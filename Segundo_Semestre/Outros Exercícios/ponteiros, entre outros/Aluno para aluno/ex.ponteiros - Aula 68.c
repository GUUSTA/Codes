#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	struct lista
	{
		int valor;
		struct lista *proximo;
	};

	struct lista m1, m2, m3;
	struct lista *gancho = &m1;

	m1.valor = 10;
	m2.valor = 20;
	m3.valor = 30;

	m1.proximo = &m2; //o ponteiro próximo vai apontar para o endereço de m2
	m2.proximo = &m3; //o ponteiro próximo vai apontar para o endereço de m3
	m3.proximo = NULL; //o ponteiro próximo vai apontar para NULL

	//Imrimindo esses valores.
    int i = 1;
	while(gancho != NULL)
	{
		printf("Valor de m%d eh: %d\n", i, gancho->valor); //Vai imprimir o valor de m
		gancho = gancho->proximo; // Vai apontar para o próximo valor de m
		i++;
	}


	return 0;
}

