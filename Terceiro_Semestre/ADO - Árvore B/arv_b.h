#include <stdlib.h>
#include <stdio.h>

#define true  1
#define false 0

typedef int bool;

typedef struct no_arvoreB arvoreB;

struct no_arvoreB {
   int num_chaves;
   int chaves[3];
   arvoreB *filhos[4];
};

int busca_binaria();

void insere_chave(arvoreB *raiz, int info, arvoreB *filhodir) {
  int k, pos;

  pos = busca_binaria(raiz, info);
  k = raiz->num_chaves;


  while (k > pos && info < raiz->chaves[k-1]) {
    raiz->chaves[k] = raiz->chaves[k-1];
    raiz->filhos[k+1] = raiz->filhos[k];
    k--;
  }

  raiz->chaves[pos] = info;
  raiz->filhos[pos+1] = filhodir;
  raiz->num_chaves++;
}


arvoreB *insere(arvoreB *raiz, int info, bool *h, int *info_retorno) {

  int i, j, pos, info_mediano;
  arvoreB *temp, *filho_dir;

  if (raiz == NULL) {
    *h = true;
    *info_retorno = info;
    return(NULL);
  }
  else {
        pos = busca_binaria(raiz,info);
         if (raiz->num_chaves > pos && raiz->chaves[pos] == info) {
             printf("Chave já contida na Árvore");
             *h = false;
         }
         else {
          filho_dir = insere(raiz->filhos[pos],info,h,info_retorno);
          if (*h) {
             if (raiz->num_chaves < 3) {
               insere_chave(raiz, *info_retorno, filho_dir);
               *h = false;
             }
             else { 
                temp = (arvoreB *) malloc (sizeof(arvoreB));
                temp->num_chaves = 0;

                for (i = 0; i < 4; i++) {
                  temp->filhos[i] = NULL;
                }
                info_mediano = raiz->chaves[1];
                temp->filhos[0] = raiz->filhos[1+1];

                for (i = 1 + 1; i < 3; i++) {
                  insere_chave(temp, raiz->chaves[i], raiz->filhos[i+1]);
                }

                for (i = 1; i<3; i++) {
                  raiz->chaves[i] = 0;
                  raiz->filhos[i+1] = NULL;
                }

                raiz->num_chaves = 1;

                if (pos <= 1) {
                  insere_chave(raiz, *info_retorno, filho_dir);
                } 
                else {
                  insere_chave(temp, *info_retorno, filho_dir);
                }
                *info_retorno = info_mediano;
                return(temp);
            }
          }
        }
     }
}

arvoreB *insere_arvoreB(arvoreB *raiz, int info) {
  bool h;
  int info_retorno, i;
  arvoreB *filho_dir, *nova_raiz;

  filho_dir = insere(raiz,info,&h,&info_retorno);

  if (h) {
     nova_raiz = (arvoreB *) malloc (sizeof(arvoreB));
     nova_raiz->num_chaves = 1;
     nova_raiz->chaves[0] = info_retorno;
     nova_raiz->filhos[0] = raiz;
     nova_raiz->filhos[1] = filho_dir;
     for (i = 2; i <= 3; i++) {
       nova_raiz->filhos[i] = NULL;
     }
     return(nova_raiz);
  }
  else {
   return(raiz);
  }
}

int busca_binaria(arvoreB *no, int info) { 
  int meio, i, f; 

  i = 0;
  f = no->num_chaves-1;

  while (i <= f) {
    meio = (i + f)/2;
    if (no->chaves[meio] == info) {
      return(meio); 
    }
       
    else if (no->chaves[meio] > info)
    {
      f = meio - 1;
    }
    else { 
      i = meio + 1;
    }
  }
  return(i);
}

bool busca(arvoreB *raiz, int info) {
  arvoreB *no;
  int pos;

  no = raiz;
  while (no != NULL) {
     pos = busca_binaria(no, info);
     if (pos < no->num_chaves && no->chaves[pos] == info) {
      return(true);
     }
         
     else {
      no = no->filhos[pos];
     } 
   }
  return(false);
}

void em_ordem(arvoreB *raiz) {
  int i;

  if (raiz != NULL) {
     for (i = 0; i < raiz->num_chaves; i++) {
        em_ordem(raiz->filhos[i]);
        printf("\n%d", raiz->chaves[i]);
     }
     em_ordem(raiz->filhos[i]);
  }
}