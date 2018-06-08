#include <stdio.h>

typedef struct N
{
	int x, y;
	struct N *proximo, *anterior;
}coordenada;

typedef struct {
	coordenada *inicio;
	coordenada *fim;	
}Fila;

void inicializaFila(Fila *p){
  p->fim=NULL;
  p->inicio = NULL;
}

int vazia(Fila *p){
  if(p->inicio==NULL){
    return 1;
  }
  return 0;
}

void inserir(Fila *p, int valor_x, int valor_y){
    coordenada *xy;
    
    xy =(coordenada *)malloc(sizeof(coordenada));
     
    xy->x->valor_x;
    xy->y->valor_y;

    xy->proximo = NULL;


    if(vazia(p)==1)
    {
        p->inicio = xy;
    }
    else
    {
        p->fim->proximo = xy;
    }


    p->fim = xy;

}

int remover(Fila *p){
  if(vazia(p)==1){
    printf("ERRO: pilha vazia\n");
    return;
  }
  node *temp;
  temp=p->inicio;
  p->inicio=p->inicio->proximo;
  return temp->valor;
}

void imprimePilha(Fila *p){
  node *temp;
  temp=p->inicio;
  while(temp!=NULL){
    printf("%d ", temp->valor);
    temp=temp->proximo;
  }
  printf("\n");
}