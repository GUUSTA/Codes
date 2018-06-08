#include <stdio.h>
#include <stdlib.h>

int main(void)
{

	int x = 10;
	double y = 40.6;
	char z = 'g';

	int *pX = &x;
	int *pY = &y;
	int *pZ = &z;

	printf("Valor de x = %d - Endereco de x = %d\n\n", *pX, pX);
	printf("Valor de y = %.2f - Endereco de y = %d\n\n", *pY, pY);
	printf("Valor de z = %c - Endereco de z = %d\n\n", *pZ, pZ);

	int *resultado;
	resultado = &x;

	printf("Valor de resultado = %d - Endereo de resultado = %d\n\n", *resultado, resultado);


	return 0;
}
