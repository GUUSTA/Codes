/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ordenacao;

/**
 *
 * @author gustavo
 */
public class Ordenacao {
    
    public static String cartas = "PCIALM";
    //private String[] nossasCartasString = {"", "", "", "", "", ""};
    public static String aux = "" + cartas.charAt(0);;
    public static int i = 0;
    

    public static void main(String[] args) {
        
        retorno();

    }
    
    static void retorno() {
        for (i = 0; i < 5; i++) {
            for (int j = 0; j < 4; j++) {
               if(converteParaNumero(""+cartas.charAt(j)) > converteParaNumero(""+cartas.charAt(j+1))) {
                   aux = "" + cartas.charAt(j+1);
               }
            }
        }
        
        System.out.println(aux);
    }
    
    static int converteParaNumero(String letra) {
        switch (letra) {
            case "A":
                return 0;
            case "B":
                return 1;
            case "C":
                return 2;
            case "D":
                return 3;
            case "E":
                return 4;
            case "F":
                return 5;
            case "G":
                return 6;
            case "I":
                return 7;
            case "L":
                return 8;
            case "M":
                return 9;
            case "N":
                return 10;
            case "O":
                return 11;
            case "P":
                return 12;
            default:
                break;
        }
        return -1;
    }
    
}


