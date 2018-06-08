#include <stdio.h>

typedef struct{
  int vetor[10];
  int topo;
} Pilha;

void inicializaPilha(Pilha *p){
  p->topo=0;
}

int vazia(Pilha *p){
  if(p->topo==0){
    return 1;
  }
  return 0;
}

int cheia(Pilha *p){
  if(p->topo>=10){
    return 1;
  }
  return 0;
}

void inserir(Pilha *p, int valor){
  if(cheia(p)==1){
    printf("ERRO: pilha cheia\n");
    return;
  }
  p->vetor[p->topo]=valor;
  p->topo++;
}

int remover(Pilha *p){
  if(vazia(p)==1){
    printf("ERRO: pilha vazia\n");
    return;
  }
  p->topo--;
  return p->vetor[p->topo];
}

void imprimePilha(Pilha *p){
  for(int i=0; i<p->topo; i++){
    printf("%d ", p->vetor[i]);
  }
  printf("\n");
}