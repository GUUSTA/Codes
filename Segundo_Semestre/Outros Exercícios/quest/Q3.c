#include <stdio.h>
#include "Q3.h"

int main(){
    lista minhaLista;
    
    inicializaLista(&minhaLista);
    inserirLista(&minhaLista, 19);
    inserirLista(&minhaLista, 28);
    inserirLista(&minhaLista, 30);
    inserirLista(&minhaLista, 12);
    imprimeLista(&minhaLista);
    //removerLista(&minhaLista, 30);
    //removerLista(&minhaLista, 12);
    imprimeLista(&minhaLista);
    inserirLista(&minhaLista, 51);
    inserirLista(&minhaLista, 48);
    imprimeLista(&minhaLista);
    //printf("chegou aqui\n");
    //removerLista(&minhaLista, 69);
    inserirLista(&minhaLista, 69);
    inserirLista(&minhaLista, 36);
    inserirLista(&minhaLista, 43);
    imprimeLista(&minhaLista);
    
}
