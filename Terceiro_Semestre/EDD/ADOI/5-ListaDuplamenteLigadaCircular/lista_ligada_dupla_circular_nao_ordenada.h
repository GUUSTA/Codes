#include <stdio.h>
#include <stdlib.h>

typedef struct n {
  int valor;
  struct n *next;
  struct n *prev;
} no;


void insere(no *node, int val){
  no *novo_no, *inicial = node;
  novo_no =(no *)malloc(sizeof(no));
  novo_no -> valor = val;
  novo_no -> next = node;

  while(node->next){
    if (node->valor >= val){
      novo_no->prev = node->prev;
      node->prev = novo_no;
      novo_no->next = node->next;
      node->next= novo_no;
      return;
    }
    if(inicial == node->next) break;
    node = node->next;
  }
  novo_no->prev = node;
  node->next = novo_no;
}


int remover(no *node, int val){
  no *anterior, *inicial = node;
  while(node->next){
    if (node->valor == val){
      anterior->next = node->next;
      node->next->prev = anterior;
      return 1;
    }
    anterior = node;
    node = node->next;
    if(inicial == node->next) break;
  }
  return -1;
}


int remove_todos(no *node, int val){
  no *anterior, *inicial = node;
  while(node){
    if (node->valor == val){
      anterior->next = node->next;
      if (node->next) node->next->prev = anterior;
    }else anterior = node;
    node = node->next;
    if(inicial == node->next) break;
  }
  return -1;
}

int busca(no *node, int val){
  int i=0;
  no *inicial = node;
  while(node){
    i++;
    if (node->valor == val){
      return i-1;
    }
    node = node->next;
    if(inicial == node->next) break;
  }
  return -1;
}
