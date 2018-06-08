#include <stdio.h>
#include <stdlib.h>


/* Cada nó armazena três informações:
   nesse caso um número (num),
   ponteiro para subárvore à direita (sad)
   e ponteiro para subárvore à esquerda (sae).*/
typedef struct arv {

  int elemento;
  int tam;
  struct arv *subd;
  struct arv *sube;

} arvore;

/* A estrutura da árvore é representada por um ponteiro
   para o nó raiz. Com esse ponteiro, temos acesso aos
   demais nós. */

arvore *createArvore()
{
  /* Uma árvore é representada pelo endereço do nó raiz,
     essa função cria uma árvore com nenhum elemento,
     ou seja, cria uma árvore vazia, por isso retorna NULL. */
  return NULL;
}

/* Função que verifica se uma árvore é vazia */
int verificaVazia(arvore *p)
{
  if(p == NULL)
    return 1;
  else
    return 0;
  /* Retorna 1 se a árvore for vazia e 0 caso contrário */
}

/* Função que mostra a informação da árvore */
void imprimeArvore(arvore *p)
{
  /* Essa função imprime os elementos de forma recursiva */

  printf(""); /* notação para organizar na hora de mostrar os elementos */
  if(verificaVazia(p) == 0) /* se a árvore não for vazia... */
  {
    /* Mostra os elementos em pré-ordem */
    printf("%d ", p->elemento); /* mostra a raiz */
    imprimeArvore(p->sube); /* mostra a sube (subárvore à esquerda) */
    imprimeArvore(p->subd); /* mostra a subd (subárvore à direita) */
  }
  printf(""); /* notação para organizar na hora de mostrar os elementos */
}

void inserir(arvore **p, int valor)
{
  if(*p == NULL) {
    /* Essa função insere os elementos de forma recursiva */
    *p = (arvore*)malloc(sizeof(arvore)); /* Aloca memória para a estrutura */
    (*p)->subd = NULL; /* Subárvore à esquerda é NULL */
    (*p)->sube = NULL; /* Subárvore à direita é NULL */
    (*p)->elemento = valor; /* Armazena a informação */
    (*p)->tam++;
  } else {
    if(valor < (*p)->elemento) /* Se o número for menor então vai pra esquerda */
      inserir(&(*p)->sube, valor); /* Percorre pela subárvore à esquerda */
    if(valor > (*p)-> elemento) /* Se o número for maior então vai pra direita */
      inserir(&(*p)->subd, valor); /* Percorre pela subárvore à direita */
  }
}

/* Função que verifica se um elemento pertence ou não à árvore */
int buscaValor(arvore *p, int valor) {

  if(verificaVazia(p)) { /* Se a árvore estiver vazia, então retorna 0 */
    return 0;
  }

  /* O operador lógico || interrompe a busca quando o elemento for encontrado */
  return p->elemento == valor || buscaValor(p->sube, valor) || buscaValor(p->subd, valor);
}

int main(void) {

  arvore *p = createArvore(); /* cria uma árvore */

  inserir(&p, 10); /* insere o elemento 10 na árvore */
  inserir(&p, 20); /* insere o elemento 20 na árvore */
  inserir(&p, 13); /* insere o elemento 13 na árvore */
  inserir(&p, 7); /* insere o elemento 07 na árvore */

  imprimeArvore(p); /* Mostra os elementos da árvore em pré-ordem */
  if(buscaValor(p, 10)) { /* Verifica se o número 22 pertence a árvore */
    printf("\nO numero 10 pertence a arvore!\n\n");
  } else {
     printf("\nO numero 10 NAO pertence a arvore!\n\n");
  }
  return 0;
}
