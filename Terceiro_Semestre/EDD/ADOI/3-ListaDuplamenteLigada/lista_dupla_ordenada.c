#include "lista_dupla_ordenada.h"

int main() {
  void imprimeinv(no *lista);
  no *lista;
  lista =(no *)malloc(sizeof(no));
  lista -> valor = 0;
  lista -> next = NULL;
  lista -> prev = NULL;

  insere(lista,10);
  insere(lista,20);
  insere(lista,30);
  insere(lista,40);
  insere(lista,50);
  insere(lista,60);
  insere(lista,10);

  remove_todos(lista,10);
  imprimeinv(lista);
  return 0;
}

void imprimeinv(no *lista){
  while(lista->next){
    lista = lista->next;
  }
  while(lista){
    printf("%d\n", lista->valor );
    lista = lista->prev;
  }
}
