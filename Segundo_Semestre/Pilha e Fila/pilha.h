#define max 6

typedef struct pilha
{
	int vetor[max];
	int topo, ini;
} Pilha;

void inicializarPilha(Pilha *p) {
	p->topo = 0;
	p->topo = 0;
}

int vazia(Pilha *p) {
	if(p->topo == 0)
		return 1;
	else
		return 0;
}

int cheia(Pilha *p) {
	if (p->topo == max)
		return 1;
	else
		return 0;
}

void inserir(Pilha *p, int valor) {
	if(cheia(p))
		printf("fila CHEIA\n");
	else if(p->topo == 0) {
	  p->vetor[p->topo] = valor;
		p->topo++;
		p->ini++;
	} else {
		p->vetor[p->topo] = valor;
		p->topo++;
	}
	
}

int remover(Pilha *p) {
	if(vazia(p))
		printf("fila VAZIA\n");
	else {
  	p->topo--;
  	return p->vetor[p->topo];
	}
}

void imprimirPilha(Pilha *p) {
	int i = 0;
	for(i=0; i < p->topo; i++) {
		printf("%d ", p->vetor[i]);
	}
	printf("\n");
}