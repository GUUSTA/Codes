import java.util.Random;

public class AdoX20 {

    public static void main(String[] args) {
        
        Random rand = new Random();
        
        int vel1 = rand.nextInt(50) + 1;
        int vel2 = rand.nextInt(50) + 1;
        
        
        Kart kart1 = new Kart("Gustavo", vel1);
        Kart kart2 = new Kart("FracaRola", vel2);
        
        
        
        
    }
    
}
