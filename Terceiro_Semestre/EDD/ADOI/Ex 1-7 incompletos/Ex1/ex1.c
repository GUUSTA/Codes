void printVetor(int v[]) {
  int i;
  for(i=0; i<11; i++)
    printf("%d", v[i]);
}

int main(void) {
  int vetorNOrdenado[10] = {3, 4 , 6, 10, 11, 3, 7, 3, 6};
  
  int vetorOrdenado[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  
  printf("%d\n", buscaOrdenada(7, 0, 10, vetorOrdenado));
  
  printf("%d\n", buscaNaordenada(5, 10, vetorNOrdenado));
  
  int n = 10;
  n = inserir(4, 999, n, vetorOrdenado);
  printf("\n%d\n", n);
  
  printVetor(vetorOrdenado);
  
  n = remover(4, n, vetorOrdenado);
  
  printf("\n%d\n", n);
  printVetor(vetorOrdenado);
  
  n = removerTodos(3, 10, vetorNOrdenado);
  printf("\n%d\n", n);
  
  printVetor(vetorNOrdenado);
  
  int p = lerValor(3, vetorOrdenado);
   printf("\n%d\n", p);
  
  return 0;
}