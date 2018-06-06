#include <stdlib.h>
#include <stdio.h>

int main(void) {
  arvoreB *root;
  int contador;

  root = NULL;
  
  for( contador = 9; contador > 0; contador -- ) {
       root = insere_arvoreB(root, contador);
       em_ordem( root );
       printf("\n**************************************************\n");
  }
  
  return 0;     
}
