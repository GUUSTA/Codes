/*- busca em vetor (ordenado e n�o ordenado)
- Inser��o em vetor (ordenado e n�o ordenado)
- Remo��o em vetor (ordenado e n�o ordenado)
- Remover todos os elementos de valor X em um vetor(ordenado e n�o ordenado)
- Ler valor em posi��o espec�fica do vetor
*/

#include <stdio.h>
#include <stdlib.h>

int ultimo_inserido=0;

int busca(int vet[],int val){
    for(int i=0; i< 50;i++){
        if((int) (vet[i]) == val){
            return i;
        }
    }
    return -1;
}

int insere(int vet[],int val){

  if(ultimo_inserido>=50|| val < 0) return -1;
  vet[ultimo_inserido++] = val;
  return 1;
}

int remover(int vet[], int val){
  if(val >= 50 || val < 0) return -1;
  for(int i = val; i<50; i++){
    vet[i] = vet[i+1];
  }
  ultimo_inserido--;
  return 1;
}

void removetodos(int vet[], int val){
    for(int i =0; i< 50; i++){
      if(vet[i] == val){
        ultimo_inserido--;
        for(int j = i; j< 50; j++){
          vet[j] = vet[j+1];
        }
      }
    }
}

int lepos(int vet[], int val){
  if(val >= 50 || val < 0){
    printf("%d\n",vet[val]);
    return 1;
  }
  return -1;
}