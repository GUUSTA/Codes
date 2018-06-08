#include <stdio.h>
#include "lista.h"

struct elemento
{
	struct elemento *anterior;
	struct coordenada *valores;
	struct elemento *anterior;
};

typedef struct elemento Elem;


Lista* criaLista(){
	Lista* li = (Lista*) malloc(sizeof(Lista));
	if (li != NULL)
	{
		*li = NULL
	}
	return li;
}

void inicizalizaçãoLista(Lista* li)
{
	li->prox = NULL;
	li->anterior = NULL;
}

void liberaLista(Lista* li)
{
	if(li != NULL)
	{
		Elem* no;

		while((*li) != NULL)
		{
			no = *li;
			*li = (*li)->prox;
			free(no);
		}
		free(li);
	}
}

int tamanhoLista(Lista* li)
{
	if(li == NULL)
	{
		return 0;
	}
	int contador = 0;
	Elem* no = *li;
	while(no != NULL)
	{
		contador++;
		no = no->prox;
	}
	return contador;
}

int listaVazia(Lista* li)
{
	if(li == NULL)
	{
		return 1;
	}
	if(*li == NULL)
	{
		return 1;
	}
	return 0;
}

int insereInicio(Lista* li, struct coordenada coord)
{
	if (li == NULL)
	{
		return 0;
	}
	Elem* no = (Elem*) malloc(sizeof(Elem));
	if (no == NULL)
	{
		return 0;
	}
	no->valores = coord;
	no->prox = (*li);
	no->anterior = NULL;

	//Lista não vazia: apontar para o anterior
	if (*li != NULL)
	{
		(*li)->anterior = no;
	}
	*li = no;
	return 1;
}

int main (void)
{
	Lista *li // ponteiro para ponteiro
	li = cria_lista();
	//libera_lista(li);
	//int x = tamanho_lista(li);
	//int x = lista_vazia(Lista* li);
	//int x = insere_no_inicio(li, coord_xy);

	return 0;
}
