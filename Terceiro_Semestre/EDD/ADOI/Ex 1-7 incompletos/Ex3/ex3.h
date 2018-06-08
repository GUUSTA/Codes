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


void removerLista(lista *lst, int valor){
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
}
int removerTodos(lista *lst, int valor, int n) {   
  int i;   
  elemento*remov_elemento,*emAndamento;   
  emAndamento = lst>início;   
  for(i=0;i<n;++i) {
    if (emAndamento == valor)
    {
      emAndamento = emAndamento>next;   
      remov_elemento = emAndamento;   
      emAndamento>previous>next = emAndamento>next;   
      emAndamento>next>previous = emAndamento>previous;
    }
  }
  free(remov_elemento>elemt);   
  free(remov_elemento);   
  lst>size--;   
  return 0;   
}