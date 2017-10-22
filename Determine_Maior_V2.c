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
    int metade = tamanho/2;
    int inicio = 0;
    int fim = tamanho - 1;

    //Se a metade do vetor for o maior número.
    if((vetor[metade] > vetor[metade - 1]) && (vetor[metade] > vetor[metade + 1]))
    {
        return vetor[metade];
    }
    //Se a metade do vetor é menor que o maior número.
    else if((vetor[metade] > vetor[metade - 1]) && (vetor[metade] < vetor[metade + 1]))
    {
        int i = 1;
        while(i < metade)
        {
            if((vetor[i] > vetor[i - 1]) && (vetor[i] > vetor[i + 1]))
            {
                return vetor[i];
            }
            else
            {
               i++;
            }
        }
    }
    //Se a metade do vetor é maior que o maior número.
    else if((vetor[metade] < vetor[metade - 1]) && (vetor[metade] > vetor[metade + 1]))
    {
         int i = metade + 1;
         while(i < fim)
        {
            if((vetor[i] > vetor[i - 1]) && (vetor[i] > vetor[i + 1]))
            {
                return vetor[i];
            }
            else
            {
               i++;
            }
        }
    }
}
