#include <stdio.h>
#include <stdlib.h>
#include "hash.h"

struct hash {
	int qtd, tamanho;
	struct aluno **itens;
};

Hash *criaHash(int tamanho) {
	Hash *ha = (Hash*) malloc(sizeof(Hash));
	if (ha != NULL) {

		int i;
		ha->tamanho = tamanho;
		ha->itens = (struct aluno**) malloc(tamanho* sizeof(struct aluno*));
		if (ha->itens == NULL) {
			free(ha);
			return NULL;
		}
		ha->qtd = 0;

		for (i = 0; i < ha->tamanho; ++i) {
			ha->itens[i] = NULL;
		}
	}
	return ha;
}

void liberaHash(Hash *ha) {
	if(ha != NULL) {
		int i;
		for (int i = 0; i < ha->tamanho; ++i) {
			if(ha->itens[i] != NULL) {
				free(ha->itens[i]);
			}
		}
		free(ha->itens);
		free(ha);
	}
}

int definePosicaoSoldagem(int chave, int tamanho, int index) {
	return (chave + index) % tamanho;
}

int definePosicaoQuadratica(int chave, int tamanho, int index) {
  	int c1 = 3, c2 = 4;
	return (chave + c1 * index + c2 * (i*i)) % tamanho;
}

int insereHash(Hash* ha, int chave) {
	if(ha == NULL || ha->qtd == ha->tamanho) {
		return 0;
	}

  struct aluno *novo = malloc(sizeof(struct aluno));

	if(novo == NULL) {
		return 0;
	}

	novo->matricula = chave;

	int pos = definePosicaoSoldagem(chave, ha->tamanho, 0);

	if(ha->itens[pos] == NULL) {
		ha->itens[pos] = novo;
		ha->qtd++;
		return 1;
	} else {
		int i = 0;
		int pInicial = pos;
		while(i < ha->tamanho) {
			pos = definePosicaoSoldagem(chave, ha->tamanho, i);
			if(ha->itens[pos] == NULL) {
				ha->itens[pos] = novo;
				ha->qtd++;
				return 1;
			} else {
				i++;
			}
		}
	} 
}
void imprime(Hash *ha) {
	for (int i = 0; i < ha->tamanho; ++i) {
		if(ha->itens[i] != NULL) {
			printf("%d %d\n", i, ha->itens[i]->matricula);
		}
	}
}



// Programa Principal
int main (void) {
	Hash *ha = criaHash(11);
	
  int x = insereHash(ha, 11);
  int x1 = insereHash(ha, 12);
  int x2 = insereHash(ha, 23);
  int x3 = insereHash(ha, 17);
  imprime(ha);
  //liberaHash(ha);

	return 0;
}