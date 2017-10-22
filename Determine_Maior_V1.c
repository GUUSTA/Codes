#include <stdio.h>

int main (void)
{
    int tamanho = 10;
    int v[10] = {3, 10, 13, 15, 16, 20, 14, 11, 5};
    int Determine_Maior(int vetor[], int tamanho);

    printf("O maior eh: %d", Determine_Maior(v, tamanho));

    return 0;
}

int Determine_Maior(int vetor[], int tamanho)
{
    int i = tamanho - 1, k = 1;
    while (k < i)
    {
        if((vetor[k] > vetor[k - 1]) && (vetor[k] > vetor[k + 1]))
        {
           return vetor[k];
        }
        else{
            k++;
        }
    }
}
