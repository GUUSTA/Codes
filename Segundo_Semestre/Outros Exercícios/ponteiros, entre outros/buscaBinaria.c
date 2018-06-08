#include <stdio.h>
#include <stdlib.h>
#define x 6

int buscaBinaria(int valor, int tamanho, int v[])
{
	int e = -1, d = tamanho;
   	while (e < d-1) {
    	int m = (e + d)/2;
      	if (v[m] < valor)
      		e = m;
      	else
      		d = m;
   }
   return d;
}

int main(void)
{
	int v[x] = {1, 4, 6, 7, 10, 17};
	printf("%d\n", buscaBinaria(6, x, v));

	return 0;
}
