#include <stdio.h>
#include "teste.h"

int main(void) {

	Pilha p;

	inicializarPilha(&p);

	inserir(&p, 10);
	inserir(&p, 20);
	
	remover(&p);
	
	inserir(&p, 20);
	inserir(&p, 30);
	inserir(&p, 40);
	remover(&p);
	remover(&p);
	inserir(&p, 50);
	inserir(&p, 60);
	inserir(&p, 10);
	inserir(&p, 80);
	
	
	
	imprimirPilha(&p);
	


}