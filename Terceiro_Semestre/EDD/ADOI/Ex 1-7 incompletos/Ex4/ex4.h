#include <stdio.h>
#include <stdlib.h>

typedef struct ElementoLista { 
	char dado; 
	struct ElementoLista seguinte; 
}Elemento;

typedef struct ListaDetectada { 
	Elemento início; 
	Elemento fim; 
	int tamanho; 
}Liste;

void inicialização (Lista lista){ 
	liste > início = NULL; 
	liste > fim = NULL; 
	tamanho = 0; 
}

int ins_lista_circ_vazia(Lista lista, char dado){ 
	Elemento novo_elemento; 
	if (( novo_elemento = (Elemento ) malloc (sizeof (Elemento))) == NULL) 
		return -1; 
	if ((novo_elemento > dado = (char ) malloc (50 sizeof (char))) == NULL) 
		return -1; 
	strcpy (novo_elemento > dado, dado); 
	novo_elemento > seguinte = novo_elemento; 
	liste > início = novo_elemento; 
	liste > fim = novo_elemento; 
	liste > tamanho++; 
	return 0; 
}

int ins_lista_circ(Lista lista, Elemento em andamento, char dado){ 
	Elemento novo_elemento; 
	if ((novo_elemento = (Elemento ) malloc (sizeof (Elemento))) == NULL) 
		return -1; 
	if ((novo_elemento > dado = (char ) malloc (50 sizeof (char))) == NULL) 
		return -1; 
	strcpy (novo_elemento > dado, dado); 
	if(em andamento != lisa > fim) 
		return -1; 
	novo_elemento > seguinte = em andamento > seguinte; 
	em andamento > seguinte = novo_elemento; 
	lista > fim = novo_elemento; 
	lista > tamanho++; 
	return 0; 
}

int remov_lista_circ(Lista lista){ 
	if (lista > tamanho < 2) 
		return -1; 
	Elemento remov_elemento; 

	remov_elemento = lista > início; 
	lista > início = lista > início > seguinte; 
	lista > fim > seguinte = lista > início; 

	free (remov_elemento > dado); 
	free (remov_elemento); 
	liste > tamanho--; 
	return 0; 
}

int remov_lista_circ_única(Lista lista){ 
	if (lista > tamanho != 1) 
		return -1; 
	Elemento remov_elemento; 

	remov_elemento = lista > início; 
	lista > início = NULL; 
	lista > fim = NULL; 

	free (remov_elemento > dado); 
	free (remov_elemento); 
	lista > tamanho--; 
	return 0; 
}