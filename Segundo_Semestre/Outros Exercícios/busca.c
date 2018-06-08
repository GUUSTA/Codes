//ALGORITMOS E PROGRAMAÇÃO II.
//ADO#02 - DUPLA: GUSTAVO GARCIA LEITE E PAULO BELFI.
//FORAM ENCONTRADAS 90 EMPRESAS.

#include <stdio.h>
#include <string.h> // usado para strcpy e strcat
#include <stdlib.h>

//declaracoes de variaveis globas
FILE *file;
char empresas[9999][4];
int qt = 1;
int linha = 0;

//prototipagem das funcoes
int abrir_arquivo();
int ler_arquivo();
int busca_empresa_efi(int ini, int fim, int meioant);

//funcao main
int main() {
  if(!abrir_arquivo()){
    return;
  }
  ler_arquivo();
  busca_busca_efi(0, linha, ""); //envia, inicio do vetor, quantidade de linhas lidas e valor vazio
  printf("Dentre %d registros, existem %d empresas diferentes.\n",linha, qt);
  return 0;
}

//funcao de abrir o arquivo
int abrir_arquivo(){
  // Abre um arquivo
  file = fopen("DadosCompletos.txt", "r");

  if (!file)  // Verifica se houve erro na abertura
  {
    printf("Falha na abertura do arquivo\n");
    return 0;
  }
  return 1;
}

//funcao que le o arquivo e insere os dados na matriz empresas
int ler_arquivo(){
  char texto[9999];
  int i=0;
  while(!feof(file)){
    fgets(texto, 99999, file);
    empresas[i][0] = texto[0];
    empresas[i][1] = texto[1];
    empresas[i][2] = texto[2];
    empresas[i][3] = '\0';
    i++;
  }
  linha = i;
}


//funcao de busca de diferencas dentro do vetor
void busca_busca_efi(int ini, int fim, char meioant[]){
  if(ini > fim || !strcmp(empresas[ini], empresas[fim])){
    return;
  }

  int meio = (ini + fim) / 2;
  //veririca primeira metade do vetor
  //verificando se do inicio até a metade do vetor os valores coincidem
  if(strcmp(empresas[ini],empresas[meio])){
    //caso nao sejam coincidentes chama novamente a funcao
    busca_busca_efi(ini, meio -1 , empresas[meio]);
    //e adiciona um a contagem caso seja verdadeira a codicao a baixo
    if(strcmp(empresas[ini], meioant) && strcmp(empresas[meio], meioant)){
        qt++;
      }
  }
  //executa os mesmos passos da primeira metade do vetor para a parte final
  if(strcmp(empresas[fim], empresas[meio])){
    busca_busca_efi(meio+1, fim , empresas[meio]);
    if(strcmp(empresas[fim],meioant) && strcmp(empresas[meio], meioant)){
        qt++;
      }
  }
}
