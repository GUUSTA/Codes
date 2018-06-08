#include <stdio.h>
#include <stdlib.h>

struct lista
{
	int valor;
	struct lista *proximo;
};

struct lista *procuraValor (struct lista *pLista, int valor)
{
	while(pLista != NULL)
	{
		if (pLista->valor == valor)
		{
			return(pLista);
		}
		else
		{
			pLista = pLista->proximo;
		}
	}
	return NULL;
}

int main(void)
{
	struct lista *procuraValor (struct lista *pLista, int valor);
	struct lista m1, m2, m3;
	struct lista *resultado, *gancho = &m1;
	int valor;

	m1.valor = 5;
	m2.valor = 10;
	m3.valor = 15;

	m1.proximo = &m2;
	m2.proximo = &m3;
	m3.proximo = NULL;

	printf("Digite o valor da pesquisa: ");
	scanf("%d", &valor);

	resultado = procuraValor(gancho, valor);

	if(resultado == NULL)
	{
		printf("\nO Valor nao foi encontrado\n");
	}
	else
		printf("\nO Valor %d foi encontrado\n", resultado->valor);

	return 0;
}
