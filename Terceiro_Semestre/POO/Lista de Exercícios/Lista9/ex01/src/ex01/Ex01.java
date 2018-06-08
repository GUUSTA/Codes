package ex01;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Ex01 {

    public static void main(String[] args) throws FileNotFoundException, IOException {

        FileReader leitura = null;
        BufferedReader ler = null;
        FileWriter escrita = null;
        BufferedWriter escrever = null;
        
        int linhas = 0;
        int espaco = 0;

        try {
            leitura = new FileReader("entrada.txt");
            ler = new BufferedReader(leitura);
            
            String linha = ler.readLine();
            
            while(linha != null) {
                System.out.println(linha);
                if(linha.contains("f")) {
                    espaco ++;
                }
                linha = ler.readLine();
                linhas++;
            }
            leitura.close();
        } catch (FileNotFoundException e) {
            System.err.println("Nao foi possivel abrir o arquivo de entrada");
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
        }
        
        System.out.println(linhas);
        System.out.println(espaco);
        
        
        try {
            escrita = new FileWriter("saida.txt");
            escrever = new BufferedWriter(escrita);
            
            
            escrever.write(Integer.toString(espaco));
            escrever.write(linhas);
            escrever.write("ROLA");
            
            
            escrita.close();
        } catch (FileNotFoundException e) {
            System.err.println("Nao foi possivel abrir o arquivo de saida");
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
        }
        

    }

}
