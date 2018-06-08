#include <stdio.h>

struct coordenada
{
    int x,y;
};

typedef struct elemento *Lista;

struct elemento
{
    struct elemento *anterior;
    struct coordenada *xy;
    struct elemento *proximo;

};

typedef struct elemento Elem;

int criaLista(Lista *li)
{
    Lista *li;
    li = (Lista*) malloc(sizeof(Lista));
    if(li != NULL)
        *li = NULL;
    return li;
}
