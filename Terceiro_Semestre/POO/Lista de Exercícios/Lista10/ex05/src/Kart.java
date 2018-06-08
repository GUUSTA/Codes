
import java.util.logging.Level;
import java.util.logging.Logger;

public class Kart extends Thread{
    
    private String carro;
    private int velocidade;

    public Kart(String carro, int velocidade) {
        this.carro = carro;
        this.velocidade = velocidade;
        start();
    }
    
    public void run() {
        try { 
         for(int i = 0; i < 10; i++) {
             System.out.println("Completei a volta: " + i);
             Thread.sleep(getVelocidade());
         }
         System.out.println("CHEGUEI AO FINAL");
            
        } catch (InterruptedException ex) {
            Logger.getLogger(Kart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    

    public String getCarro() {
        return carro;
    }

    public void setCarro(String carro) {
        this.carro = carro;
    }

    public int getVelocidade() {
        return velocidade;
    }

    public void setVelocidade(int velocidade) {
        this.velocidade = velocidade;
    }
    
    
    
    
    
    
}
