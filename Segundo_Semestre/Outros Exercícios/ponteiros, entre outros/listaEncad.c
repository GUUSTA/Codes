#include <stdio.h>
#include <stdlib.h>

typedef struct x
{
	int x;
	int y;
	struct x *prox;
}coordenada;

typedef struct
{
	coordenada *inicio;
	coordenada *fim;
}Lista;

void cria (Lista *p)
{
	p->fim = NULL;
	p-inicio = NULL;
}

void imprime (Lista *p) {
   if (p != NULL) {
      printf ("%d\n", p->x);
      printf ("%d\n", p->y);
      imprime (p->prox);
   }
}

void inserir (Lista *p, int valor_x, int valor_y)
{
	coordenada *coord;
	coord = (coordenada *)malloc(sizeof(coordenada));
	coord->x = valor_x;
	coord->y = valor_y;
	coord->prox = NULL;

	if(p->inicio == NULL)
	{
		p->inicio = coord;
	}
	else
	{
		p->fim->prox = coord;
	}

	p->fim = coord;
}

