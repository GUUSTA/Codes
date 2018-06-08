package ex02;

public class PingPong {
    
    private boolean ping;
    
    synchronized void ping(boolean executando) {
        
        if(!executando) {
            setPing(true);
            notify();
            return;
        }
        
        System.out.println("Ping ");
        setPing(true);
        notify();
        
        try {
            while(isPing()) {
                wait(1000);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    
    synchronized void pong(boolean executando) {
        
        if(!executando) {
            setPing(false);
            notify();
            return;
        }
        
        System.out.println("Pong");
        setPing(false);
        notify();
        
        try {
            while(!isPing()) {
                wait(1000);
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
    

    public boolean isPing() {
        return ping;
    }

    public void setPing(boolean ping) {
        this.ping = ping;
    }
    
}
