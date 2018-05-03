#include <stdio.h>
#include <stdlib.h>
#define tam 10

typedef struct{
    int tamanho;
    int vetor[tam];
    int topo;
    int inicio;
} Fila;

void inicializaFila(Fila *p){
    p->tamanho = 0;
    p->topo = 0;
    p->inicio = 0;
}

int cheio(Fila *p) {
    if(p->topo > 9)
        return 1;
    return 0;
}

int vazio (Fila *p) {
    if(p->tamanho == 0)
        return 1;
    return 0;
}

void inserir(Fila *p, int valor) {

    if(cheio(p) == 1 && p->tamanho != tam) {
        p->topo = 0;
        p->vetor[p->topo] = valor;
        p->tamanho++;
        p->topo++;
    }
    else if (p->tamanho == tam){
        printf("ERRO, CHEIO\n");
        return;
    } else
    {
        p->vetor[p->topo] = valor;
        p->topo++;
        p->tamanho++;
    }
}

int remover(Fila *p){
    if(vazio(p) == 1) {
        printf("ERRO, VAZIO\n");
        return;
    }
    p->tamanho--;
    p->inicio++;
    return p->vetor[p->inicio];
}

void imprimeFila(Fila *p){
  int i;
  int temp=0;
  int k = p->inicio;
  for(i=0; i<p->tamanho; i++){

    printf("%d ", p->vetor[k]);
    k++;
    if(k > 9)
    {
        temp = p->inicio;
        p->inicio = 0;
        p->vetor[p->topo];
        k = 0;
    }
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
    inserir(&minhafila, 51);
    inserir(&minhafila, 51);
    inserir(&minhafila, 51);
    inserir(&minhafila, 51);
    inserir(&minhafila, 21);
    inserir(&minhafila, 31);
    inserir(&minhafila, 41);
    //inserir(&minhafila, 41);
    imprimeFila(&minhafila);

    return 0;
}
