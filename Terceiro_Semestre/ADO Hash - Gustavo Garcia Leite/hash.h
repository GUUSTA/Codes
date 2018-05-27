struct aluno {
	int matricula;
	char nome[39];
	float n1,n2,n3;
};

typedef struct hash Hash;

Hash* criaHash(int tamanho);
void liberaHash(Hash *h);
int valorString(char *str);
int insereHash_SemColisao(Hash *ha, struct aluno al);
int buscaHash_SemColisao(Hash *ha, int mat, struck aluno* al);
int insereHash_EnderAberto(Hash *ha, struct aluno al);
int buscaHash_EnderAberto(Hash *ha, int mat, struck aluno* al);