#include "lista_ligada_circular_nao_ordenada.h"

int main() {
  void imprime(no *lista);
  no *lista;
  lista =(no *)malloc(sizeof(no));
  lista -> valor = 0;
  lista -> next = NULL;
  insere(lista,10);
  insere(lista,30);
  insere(lista,20);
  insere(lista,40);
  insere(lista,50);
  insere(lista,60);
  imprime(lista);

  return 0;
}

void imprime(no *lista){
  no *inicial= lista;

  while(lista->next){
    lista = lista->next;
    if(inicial == lista) break;
    printf("%d\n", lista->valor );
  }
}