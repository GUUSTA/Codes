#include <stdio.h>
#include "pilhaEncadeada.h"
//#include "pilhaVetor.h"


int main(){
  Pilha minhaPilha;
  int temp;

  inicializaPilha(&minhaPilha);
  inserir(&minhaPilha, 19);
  inserir(&minhaPilha, 28);
  inserir(&minhaPilha, 30);
  inserir(&minhaPilha, 12);
  imprimePilha(&minhaPilha);
  temp=remover(&minhaPilha);
  temp=remover(&minhaPilha);
  inserir(&minhaPilha, 51);
  inserir(&minhaPilha, 48);
  imprimePilha(&minhaPilha);
}
