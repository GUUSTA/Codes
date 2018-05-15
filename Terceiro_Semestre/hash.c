#include <stdio.h>
#include <stdlib.h>
#include "hash.h"

struct hash {
	int qtd, tamanho;
	struct aluno **itens;
};

Hash* criaHash(int tamanho) {
	Hash* ha = (Hash*) malloc(sizeof(Hash));
	if (ha != NULL) {
		int i;
		ha->tamanho = tamanho;
		ha->itens = (struct aluno**) malloc(tamanho * sizeof(struct aluno*));
		
		if (ha->itens == NULL) {
			free(ha);
			return NULL;
		}

		ha->qtd = 0;
		for (i = 0; i < ha->tamanho; ++i){
			ha->itens[i] = NULL;
		}
	}
	return ha;
}

void liberaHash(Hash* ha) {
	if (ha != NULL) {
		int i;
		for (i = 0; i < ha->tamanho; ++i) {
			if (ha->itens[i] != NULL) {
				free(ha->itens[i]);
			}
		}
		free(ha->itens);
		free(ha);
	}
}


int main() {

	FilaPrio *fp;
	Hash* ha = criaHash(1427);
	liberaHash(ha);

	return 0;
}