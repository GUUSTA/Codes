package lista8.ex02;

import java.util.Scanner;

public class Lista8Ex02 {
    
    public static void main(String[] args) {
        
        Scanner teclado = new Scanner(System.in);
        System.out.println("Eu sei dividir");
        System.out.print("Informe o primeiro valor: ");
        int x = teclado.nextInt();
        
        int y = 0;
        
        while(y == 0) {
            System.out.print("Informe o segundo valor: ");
            int w = teclado.nextInt();
            if(w != 0) {
                y = w;
            }
        }
        
        
        try {
             double r = (x/y);
             System.out.println("O resultado da divisao é: " + r);
        } catch (ArithmeticException e) {
            System.out.println("Vc tentou fazer uma divisao por zero");
        }
       
        
    }
    
}
