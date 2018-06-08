/*
1)  Considere um vetor ordenado formado apenas por valores 0 e 1, por exemplo V = [ 0, 0, 0, 0, 0, 1, 1, 1]. 
Implemente um método em O(lg N), onde N é o número de elementos do vetor, de se determinar a posição i do vetor de forma que V[i] = 0 e V[i+1] = 1.
Considere na implementação do seu método o seguinte protótipo: (2,5 pontos)
*/

#include <stdio.h>
#include <stdlib.h>


int determinaPosicao(int comeco, int n, int v[])
{
  int inicio;
  int metade;
  int final;

  inicio = comeco;
  final = n;
  metade = (inicio + final)/2;

  if(v[metade] == 0)
    return determinaPosicao(metade + 1, final, v);
  else if(v[metade - 1] == 0 && v[metade] == 1)
    return metade - 1;
  return determinaPosicao(inicio, metade - 1, v);
}


int main(){
  int v[]={0,0,0,0,0,1,1,1,1,1};
  int v2[]={0,0,0,1,1,1,1,1,1};
  int v3[]={0,0,0,0,0,0,1,1};
  
  int temp;
  
  temp=determinaPosicao(0, 9, v);
  printf("%d \n", temp);
  temp=determinaPosicao(0, 8, v2);
  printf("%d \n", temp);
  temp=determinaPosicao(0, 7, v3);
  printf("%d \n", temp);
}
