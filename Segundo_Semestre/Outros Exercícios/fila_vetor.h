//GUSTAVO GARCIA LEITE
//BCC - 2� SEMESTRE

#ifndef fila_vetor
#define fila_vetor
#include <stdio.h>
#include <stdlib.h>
#define tam 10

typedef struct{
    int tamanho;
    int vetor[tam];
    int topo;
    int inicio;
} Fila;

//Fun��o que inicializa��o da Fila
void inicializaFila(Fila *p)
{
    p->tamanho = 0;
    p->topo = 0;
    p->inicio = 0;
}

//Fun��o que verifica cheio
int cheio(Fila *p)
{
    if(p->topo > 9)
        return 1;
    return 0;
}

//Fun��o que Verifica vazio
int vazio (Fila *p)
{
    if(p->tamanho == 0)
        return 1;
    return 0;
}

//Fun��o que insere valor
void inserir(Fila *p, int valor)
{

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

//Fun��o que remove valor
void remover(Fila *p)
{
    if(vazio(p) == 1) {
        printf("ERRO, VAZIO\n");
        return;
    }
    p->tamanho--;
    p->inicio++;
}

//Fun��o que imprime a fila
void imprimeFila(Fila *p)
{
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

#endif
