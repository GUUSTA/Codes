#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#define Total_Sorteio 1962
#define Dezenas_por_Linha 6


int main ()
{
    FILE *file = fopen("arquivo.txt", "r");
    char linhas[11772];
    int i=0, j=0, k=0, l=0, m=0, n=0, o=0, p=0, q=0;
    int sorteio;
    int matriz[Total_Sorteio][Dezenas_por_Linha];
    int Todos_numeros[11772];
    int igual[61] ={0};
    int contador=0;

    if(file == NULL)
    {
        printf("Não foi pssível abrir o arquivo");
        return 1;
    }

     while(fgets(linhas, 11772, file) > 0)
     {

        if(strlen(linhas) > 30 && isdigit(linhas[0]))
        {

          sorteio = atoi(&linhas[0]);

          if(sorteio < 10)
          {

              matriz[i][0] = atoi(&linhas[13]);
              matriz[i][1] = atoi(&linhas[16]);
              matriz[i][2] = atoi(&linhas[19]);
              matriz[i][3] = atoi(&linhas[22]);
              matriz[i][4] = atoi(&linhas[25]);
              matriz[i][5] = atoi(&linhas[28]);
              i++;

          }

          if((sorteio >= 10) && (sorteio < 100))
          {

              matriz[i][0] = atoi(&linhas[14]);
              matriz[i][1] = atoi(&linhas[17]);
              matriz[i][2] = atoi(&linhas[20]);
              matriz[i][3] = atoi(&linhas[23]);
              matriz[i][4] = atoi(&linhas[26]);
              matriz[i][5] = atoi(&linhas[29]);
              i++;

          }

          if((sorteio >= 100) && (sorteio < 1000))
          {

              matriz[i][0] = atoi(&linhas[15]);
              matriz[i][1] = atoi(&linhas[18]);
              matriz[i][2] = atoi(&linhas[21]);
              matriz[i][3] = atoi(&linhas[24]);
              matriz[i][4] = atoi(&linhas[27]);
              matriz[i][5] = atoi(&linhas[30]);
              i++;

          }

          if(sorteio > 1000)
          {
              matriz[i][0] = atoi(&linhas[16]);
              matriz[i][1] = atoi(&linhas[19]);
              matriz[i][2] = atoi(&linhas[22]);
              matriz[i][3] = atoi(&linhas[25]);
              matriz[i][4] = atoi(&linhas[28]);
              matriz[i][5] = atoi(&linhas[31]);
              i++;
          }
       }
    }

    fclose(file);

    for(k=0; k <= 1960; k++)
    {
        printf("%d %d %d %d %d %d\n", matriz[k][0], matriz[k][1], matriz[k][2], matriz[k][3], matriz[k][4], matriz[k][5]);
    }

    for(m=0; m <= 1960; m++)
    {
      for(n=0; n <= 5; n++)
      {
      Todos_numeros[l] = matriz[m][n];
      l++;
      }
    }
    printf("\n\n");

    for(int bla = 0; bla < 11766; bla++)
    {
        igual[Todos_numeros[bla]]++;
    }

    int maximo[5], minimo[5];
    minimo[0] = igual[2];
    maximo[0] = igual[1];

    printf("%d %d %d\n", maximo, igual[1], igual[1]);
    int h[10];

    for(int f = 1; f < 61; f++)
    {
      printf("O numero %d apareceu %d vezes\n", f, igual[f]);
    }

    for(int g = 1; g <= 60; g++)
    {
      if((igual[g] > maximo[0]))
      {
        maximo[0] = igual[g];
        h[0] = g;
      }
      if((igual[g] < minimo[0]) && (igual[g] != maximo[0]))
      {
        minimo[0] = igual[g];
        h[1] = g;
      }
      if((igual[g] > minimo[0]) && (igual[g] < maximo[0]))
      {
        maximo[1] = igual[g];
        h[3] = g;
      }
    }
    printf("Os numeros abaixo foram os mais sorteados\n");
    printf("O numero %d foi sorteado %d vezes\n", h[0], maximo[0]);
    printf("O numero %d foi sorteado %d vezes\n", h[3], maximo[1]);

    printf("O numero %d foi o menos sorteado: %d vezes\n", h[1], minimo[0]);






    return 0;
}
