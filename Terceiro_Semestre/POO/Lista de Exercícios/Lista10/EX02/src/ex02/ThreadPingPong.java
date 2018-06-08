package ex02;

public class ThreadPingPong implements Runnable{
    
    private PingPong pp;
    Thread t;
    
    final int NUM = 5;

    public ThreadPingPong(String nome, PingPong pp) {
        this.pp = pp;
        this.t = new Thread(this, nome);
        this.t.start();
    }

    @Override
    public void run() {
        if(t.getName().equalsIgnoreCase("Ping")) {
            for (int i = 0; i < NUM; i++) {
                pp.ping(true);
            }
            pp.ping(false);
        } else {
            for (int i = 0; i < 10; i++) {
                pp.pong(true);
            }
            pp.pong(false);
        }
    }
    
    
}
