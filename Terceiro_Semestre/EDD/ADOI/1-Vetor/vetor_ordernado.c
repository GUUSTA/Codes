#include "vetor_ordenado.h"

void main(){

    void imprimevetor(int vet[]);

    int vetor[50] = {0,1,2,3,4,5,6,7};
    ultimo_inserido = 8;
    imprimevetor(vetor);
    insere(vetor, 6);
    imprimevetor(vetor);
    remover(vetor,5);
    imprimevetor(vetor);
    remover_todos(vetor,6);
    imprimevetor(vetor);
    //printf("%d\n",buscapf(5,8,vetor));
    //printf("%d\n", busca(vetor,5,0,8));//insere(vetor, 1);
    //imprimevetor(vetor);
    //insere(vetor, 100);
    //insere(vetor, 50);
    //insere(vetor, 10);
    //insere(vetor, 100);
    //imprimevetor(vetor);
    //removetodos(vetor,100);
    //imprimevetor(vetor);
}

void imprimevetor(int vet[]){
  for(int i = 0; i< ultimo_inserido; i++) printf("%d - %d\n",i, vet[i]);
  printf("\n" );
}