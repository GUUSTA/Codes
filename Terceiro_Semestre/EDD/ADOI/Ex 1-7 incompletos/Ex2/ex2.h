#include <stdio.h>
#include <stdlib.h>

struct reg {
  	int conteudo; 
  	struct reg *prox;
};

typedef struct reg celula;

void iniciar (celula *le) {
	celula *le;
   	le = malloc (sizeof (celula));
   	le->prox = NULL;
}

celula *busca (int x, celula *le) {
 	celula *p;
   	p = le;
   	while (p != NULL && p->conteudo != x) 
   		p = p->prox; 
   	return p; 
}

void insere (int x, celula *p) {
   celula *nova;
   nova = mallocc (sizeof (celula));
   nova->conteudo = x;
   nova->prox = p->prox;
   p->prox = nova;
}

void remove (celula *p) {
   celula *lixo;
   lixo = p->prox;
   p->prox = lixo->prox;
   free (lixo);
}