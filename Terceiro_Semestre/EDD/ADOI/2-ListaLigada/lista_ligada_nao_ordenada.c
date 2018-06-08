#include "lista_ligada_nao_ordenada.h"

int main() {
  no *lista;
  lista =(no *)malloc(sizeof(no));
  lista -> valor = 0;
  lista -> next = NULL;

  insere(lista,10);
  insere(lista,20);
  insere(lista,30);
  insere(lista,40);
  insere(lista,50);
  insere(lista,60);
  insere(lista,70);
  insere(lista,70);
  insere(lista,70);
  insere(lista,70);
  insere(lista,70);
  insere(lista,70);
  remove_todos(lista,70);
  return 0;
}

void imprime(no *lista){
  while(lista->next){
    lista = lista->next;
    printf("%d\n", lista->valor );
  }
}
