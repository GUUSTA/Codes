package ex02;

public class EX02 {

    public static void main(String[] args) {

        PingPong pp = new PingPong();
        ThreadPingPong ping = new ThreadPingPong("Ping", pp);
        ThreadPingPong pong = new ThreadPingPong("Pong", pp);

        try {
            ping.t.join();
            pong.t.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
