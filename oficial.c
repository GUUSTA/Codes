#include <stdio.h>
#include <ctype.h> // Necessário para isdigit
#include <string.h> // Necessário para strcpy e strcat
#include <stdlib.h>

int LIN = 9999;
char *Vetor [9999];
FILE *arquivotxt;

int abrir_arquivo();
int ler_arquivo();
int busca_binaria();

int main ()
{

  abrir_arquivo();
  ler_arquivo();
  //busca_binaria(ler_arquivo());

  return 0;
}

int abrir_arquivo()
{
  // Abre um arquivo
  arquivotxt = fopen("Tabela.txt", "r");

  if (!arquivotxt)  // Verifica se houve erro na abertura
  {
    printf("Falha na abertura do arquivo\n");
    return 0;
  }
  return 1;
}

int ler_arquivo()
{
	char texto [LIN], carc1[2], carc2[2], carc3[2], valor[LIN];
	int i = 0;

	while (!feof(arquivotxt)) // Enquanto houver linhas preenchidas no arquivo
	{
		fgets(texto, LIN, arquivotxt); //string de uma linha inteira

    carc1[0] = texto [0];
    carc2[0] = texto [1];
    carc3[0] = texto [2];

    strcat(valor, carc1);
    strcat(valor, carc2);
    strcat(valor, carc3);

    Vetor[i] =  valor;
    printf("%s\n", Vetor[i]);

    i++;

    strcpy(valor,"");
	}

	fclose(arquivotxt); //Fecha o arquivo
	return i-1;
}

int busca_binaria (int d)
{

}
