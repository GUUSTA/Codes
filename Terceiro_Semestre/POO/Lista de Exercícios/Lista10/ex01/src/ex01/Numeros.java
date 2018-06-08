package ex01;

public class Numeros extends Thread{
    
    private int limite;
    private int start;

    public Numeros(int limite, int start) {
        this.limite = limite;
        this.start = start;
    }

//    static void run() {
//        
//    }
    
    public int getLimite() {
        return limite;
    }

    public void setLimite(int limite) {
        this.limite = limite;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }
    
}
