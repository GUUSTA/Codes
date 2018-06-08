/*

3)  Implemente uma TAD com lista duplamente encadeada com o nome dupla.h que contenha valores inteiros e implemente os seguintes métodos: 
a.  inicializaLista(lista *l); listaVazia(lista *l); inseriLista(lista *l, int valor). (2,0 pontos). 
Os métodos inicializaLista e listaVazia fazem o que é esperado deles. O método inseriLista inseri um valor na frente da lista se o valor for par e no final da lista se o valor for impar.

b.  removeLista(lista *l, int valor). (1,5 pontos). 
O método removeLista remove o item indicado por valor caso ele esteja na lista ou imprime uma mensagem de erro se o item não estiver na lista.

c.  imprimeLista(lista *l). (1,5 pontos). 
O método imprimeLista imprime a lista de traz para frente.
*/

#include <stdio.h>
#include <stdlib.h>

typedef struct E
{

  int elemt;
  struct E *previous;
  struct E *next;

} elemento;

typedef struct
{

  int size;
  elemento *fim;
  elemento *inicio;

}lista;

void inicializaLista(lista *lst)
{

  lst -> size = 0;
  lst -> fim = NULL;
  lst -> inicio = NULL;

}

int listaVazia(lista *lst)
{

  if(lst -> size == 0)
    return 1;
  return 0;

}

void imprimeLista(lista *lst)
{

  elemento *tmp = lst -> fim;
  while(tmp != NULL)
  {
    printf("%d ", tmp -> elemt);
    tmp = tmp -> previous;
  }
  printf("\n\n");
  
}

void inserirLista(lista *lst, int valor)
{
  elemento *cel;
  elemento *temp;
  int dvd_dois = 2;

  cel = (elemento *)malloc(sizeof(elemento));
  cel -> elemt = valor;
  cel -> next = NULL;
  cel -> previous = NULL;

  if(listaVazia(lst))
  {
    lst -> fim = cel;
    lst -> inicio = cel;
  }
  else if(valor%dvd_dois == 0)
  {
    lst -> inicio -> previous = cel;
    cel -> next = lst -> inicio;
    lst -> inicio = cel;
  }
  else
  {
    lst -> fim -> next = cel;
    cel -> previous = lst -> fim;
    lst -> fim=cel;
  }
  lst -> size++;
}


/*void removerLista(lista *lst, int valor){
  if(listaVazia(lst)==1){
    printf("ERRO: lista vazia\n");
    return;
  }
  int flag=0;
  elemento *temp;
  temp=lst->inicio;
  if(temp->valor==valor){
    lst->inicio=temp->next;
    lst->inicio->previous=NULL;
    lst->size--;
  }
  else{
    while((temp->next!=NULL)&&(flag==0)){
      if(temp->next->valor==valor){
        flag=1;
      }
      else{
        temp=temp->next;
      }
    }
    if(flag==1){
      temp->next=temp->next->next;
      temp->next->previous=temp->next;
      lst->size--;
    }
    else{
      printf("O valor a ser removido nao esta na lista\n");
    }
  }
}*/
