#include <stdio.h>
#include <stdlib.h>

int buscaNaordenada (int chave, int tamanho, int v[]) {
  int aux = 0;
  while(aux <= tamanho) {
    if(chave == v[aux]) {
      return aux;
    } else {
      aux++;
    }
  }
}

int buscaOrdenada (int chave, int inicio, int tamanho, int v[]){ 
  while (inicio <= tamanho) { 
     int meio = (inicio + tamanho)/2;
     
     if (chave == v[meio]) {
        return meio;
     }
     if (chave < v[ meio]) {
        tamanho = meio - 1; 
     }
     else {
        inicio = meio + 1;
     }
  }
  return -1;
}

int inserir(int k, int x, int n, int v[]) {
    int j;
    for (j = n; j > k; --j)  
        v[j] = v[j-1];
    v[k] = x;
    return n + 1;
}

int remover(int k, int n, int v[]) {
   int j;
   for (j = k+1; j < n; ++j)  
      v[j-1] = v[j];
   return n - 1;
}

int removerTodos(int k, int n, int v[]) {
  int j;
  for(j=0; j<n; j++) {
    if(k == v[j-1]) {
      v[j-1] = v[j];
      n--;
    }
    v[j] = v[j+1];
  }
  return n;
}

int lerValor(int p, int v[]) {
  return v[p];
}