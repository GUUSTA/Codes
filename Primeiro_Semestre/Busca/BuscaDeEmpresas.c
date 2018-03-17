#include <stdio.h>
#include <string.h> // Necessário para strcpy e strcat
#include <stdlib.h>

int Linhas = 9999;
char *Vetor [9999];
FILE *file;

int abrir_arquivo();
void ler_arquivo();
int busca();

int main ()
{
    abrir_arquivo();
    ler_arquivo();
    printf("%d", busca());

  return 0;
}

int abrir_arquivo()
{
  // Abre um arquivo
  file = fopen("DadosImcompletos.txt", "r");

  if (!file)  // Verifica se houve erro na abertura
  {
    printf("Falha na abertura do arquivo\n");
    return 0;
  }
  return 1;
}

void ler_arquivo()
{
	char texto [Linhas], caractere1[2]= "", caractere2[2] = "", caractere3[2] = "", valor[Linhas];
	int i = 0;

	while (!feof(file)) // Enquanto houver linhas preenchidas no arquivo
	{
		fgets(texto, Linhas, file); //string de uma linha inteira

        caractere1[0] = texto[0];
        caractere2[0] = texto[1];
        caractere3[0] = texto[2];


        strcat(valor, caractere1);
        strcat(valor, caractere2);
        strcat(valor, caractere3);

        Vetor[i] =  valor;
        printf("%s\n", Vetor[i]);

        i++;

        strcpy(valor,"");
	}

	fclose(file); //Fecha o arquivo
}

int busca()
{
    int i = 0;
    int comparar = 0;
    while(i < 31)
    {
        if (strcmp(Vetor[i], Vetor[i+1]) == 0)
        {
            i++;
        }
        else
        {
            comparar++;
            i++;
        }
    }

    return comparar;
}
