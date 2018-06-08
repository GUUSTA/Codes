/*
2)  Considere um vetor com valores inteiros positivos e não ordenado, V = [ 17, 32, 45, 27, 8, 30, 51, 57, 81, 4, 23]. Implemente um método que separe o vetor de forma que os valores pares fiquem na frente do vetor e os valores impares fiquem atrás no vetor, por exemplo V = [ 4, 32, 30, 8, 27, 45, 51, 57, 81, 17, 23]. Na sua implementação você não pode utilizar um vetor auxiliar para resolver este problema. Considere na implementação do seu método o seguinte protótipo: (2,5 pontos)
*/
#include <stdio.h>
#include <stdlib.h>

void separarVetor(int comeco, int fim, int v[])
{
  int ant = comeco;
  int prox = fim;
  int dvd_dois = 2;

  while(prox > ant)
  {
    while((v[prox]) %dvd_dois == 1)
      prox -= 1;
    while((v[ant]) %dvd_dois == 0)
      ant += 1;
    if(prox > ant)
    {
      int troca = v[prox];
      v[prox] = v[ant];
      v[ant] = troca;
      ant += 1;
      prox -= 1;
    }
  }
}

void imprimeVetor(int vetor[], int comeco, int final){
  int i;
  for(i=comeco; i <=final; i++){
    printf("%d ", vetor[i]);
  }
  printf("\n");
}

int main(){
  int vetor[]={17, 32, 45, 27, 8, 30, 51, 57, 81, 4, 23};
  int vetor2[]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16};
  int vetor3[]={1,3,5,7,9,2,4,6,8,10};
  int vetor4[]={2,4,6,1,3,5};

  imprimeVetor(vetor, 0, 10);
  separarVetor(0, 10, vetor);
  imprimeVetor(vetor, 0, 10);
  printf("\n");
  imprimeVetor(vetor2, 0, 15);
  separarVetor(0, 15, vetor2);
  imprimeVetor(vetor2, 0, 15);
  printf("\n");
  imprimeVetor(vetor3, 0, 9);
  separarVetor(0, 9, vetor3);
  imprimeVetor(vetor3, 0, 9);
  printf("\n");
  imprimeVetor(vetor4, 0, 5);
  separarVetor(0, 5, vetor4);
  imprimeVetor(vetor4, 0, 5);


}
