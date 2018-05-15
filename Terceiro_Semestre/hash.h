#include <stdio.h>
#include <stdlib.h>

struct aluno {
	int 
	char nome[10];
};

typedef struct hash Hash;

Hash* criaHash(int tamanho);
void liberaHash(Hash* ha);
int insereHash_SemColisao(Hash* ha, struct aluno al);
int Hash_SemColisao(Hash* ha, struct aluno al);
int insereHash_EnderAberto(Hash* ha, struct aluno al);
int buscaHash_EnderAberto(Hash* ha, int mat, struct aluno* al);