#include <stdio.h>
#include <stdlib.h>

typedef struct{
  int vetor[10];
  int topo;
  int inicio;
} Fila;

//void inicializaFila();
//int cheio();
//int vazio();
//void inserir();
//int remover();
//void imprimeFila();

void inicializaFila(Fila *p){
  p->topo=0;
  p->inicio=0;
}

int cheio(Fila *p) {
    if(p->topo >= 10)
        return 1;
    return 0;
}

int vazio (Fila *p) {
    if(p->topo == 0)
        return 1;
    return 0;
}

void inserir(Fila *p, int valor) {
    if(cheio(p) == 1) {
        printf("ERRO, CHEIO");
        return;
    }
    p->vetor[p->topo] = valor;
    p->topo++;
}

int remover(Fila *p){
    if(vazio(p) == 1) {
        printf("ERRO, VAZIO");
        return;
    }

    p->inicio++;
    return p->vetor[p->inicio];
}

void imprimeFila(Fila *p){
  int i;
  for(i=p->inicio; i<p->topo; i++){
    printf("%d ", p->vetor[i]);
  }
  printf("\n");
}

int main() {

    Fila minhafila;
    int temp;

    inicializaFila(&minhafila);

    inserir(&minhafila, 19);
    inserir(&minhafila, 28);
    inserir(&minhafila, 30);
    inserir(&minhafila, 12);
    imprimeFila(&minhafila);
    temp=remover(&minhafila);
    temp=remover(&minhafila);
    inserir(&minhafila, 51);
    inserir(&minhafila, 48);
    imprimeFila(&minhafila);

    return 0;
}





