#include <stdio.h>
#include <string.h>

int main (void)
{
    FILE *file = fopen("dados.txt", "r");
    char empresas[3][2719];
    char linhas[2719];
    int i=0, j=0;

    if(file == NULL)
    {
      printf("Não foi pssível abrir o arquivo");
      return -1;
    }

    while(fgets(linhas, 2719, file) > 0)
    {
        empresas[0][i] = linhas[0];
        empresas[1][i] = linhas[1];
        empresas[2][i] = linhas[2];

        printf("%s", empresas[0][i]);
        printf("%s", empresas[1][i]);
        printf("%s\n", empresas[2][i]);
    }

    fclose(file);

    return 0;
}
