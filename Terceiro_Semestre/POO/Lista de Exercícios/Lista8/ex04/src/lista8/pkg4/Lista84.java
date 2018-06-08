
package lista8.pkg4;

public class Lista84 {

    public static void main(String[] args) {
        // TODO code application logic here
    
    Cofrinho meu = new Cofrinho(100.0);
    
    try {
        meu.depositar(100);
        System.out.println("DEPOSITEI");
    } catch (IllegalArgumentException E) {
        System.out.println("Insira um valor positivo.");
    }
    
    try {
        meu.depositar(-100);
    } catch (IllegalArgumentException E) {
        System.out.println("Insira um valor positivo.");
    }
    
    
    try {
        meu.saca(300);
    } catch (IllegalArgumentException E) {
        System.out.println("Salso insuficiente");
    }
    
    
    }
    
}
