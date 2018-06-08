#include <stdio.h>
#include <stdlib.h>

int main(void)
{
	void testeVatiavel(int x);
	void testePonteiro(int *pX);
	int teste = 1;
	int *pTeste = &teste; // O valor de *pTeste vai ser = 1;

	testeVatiavel(teste);
	printf("Valor de teste: %d\n", teste); // O valor de teste vai ser o mesmo.
	testePonteiro(pTeste);
	printf("Valor novo de teste: %d\n", teste); // O valor de teste vai ser alterado para 2.
}

void testeVatiavel (int x)
{
	++x; // Cria uma cópia da variavel teste, e da ++ na cópia.
	printf("Valor da copia feita de teste: %d\n", x);
}

void testePonteiro (int *pX)
{
	++*pX; // Vai no valor do endereço de memória e adicona ++;
}
