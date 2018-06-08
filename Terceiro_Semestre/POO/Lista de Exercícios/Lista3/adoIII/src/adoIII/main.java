package adoIII;

public class main {

	public static void main(String[] args) {
		
		Time time1 = new Time();
		Time time2 = new Time();
		Jogo jogo = new Jogo();
		
		time1.setNome("PAULO1 e amigos");
		time2.setNome("Marcel KappaPride");
		
		System.out.println(time1.getNome() + " contém: " + time1.getnJogadores() + " Jogadores");
		System.out.println(time2.getNome() + " contém: " + time2.getnJogadores() + " Jogadores");
		System.out.println(jogo.comecarJogo(time1, time2));
		
		Jogador time1Jogador1 = new Jogador("Goleiro");
		Jogador time1Jogador2 = new Jogador("Lateral");
		Jogador time1Jogador3 = new Jogador("Zagueiro");
		Jogador time1Jogador4 = new Jogador("Zagueiro");
		Jogador time1Jogador5 = new Jogador("Volante");
		Jogador time1Jogador6 = new Jogador("Lateral");
		Jogador time1Jogador7 = new Jogador("Atacante");
		Jogador time1Jogador8 = new Jogador("Volante");
		Jogador time1Jogador9 = new Jogador("Centroavante");
		Jogador time1Jogador10 = new Jogador("Meia");
		Jogador time1Jogador11 = new Jogador("Atacante");
		
		Jogador time2Jogador1 = new Jogador("Goleiro");
		Jogador time2Jogador2 = new Jogador("Lateral");
		Jogador time2Jogador3 = new Jogador("Zagueiro");
		Jogador time2Jogador4 = new Jogador("Zagueiro");
		Jogador time2Jogador5 = new Jogador("Volante");
		Jogador time2Jogador6 = new Jogador("Lateral");
		Jogador time2Jogador7 = new Jogador("Atacante");
		Jogador time2Jogador8 = new Jogador("Volante");
		Jogador time2Jogador9 = new Jogador("Centroavante");
		Jogador time2Jogador10 = new Jogador("Meia");
		Jogador time2Jogador11 = new Jogador("Atacante");
		
		time1.addJogadores(time1Jogador1);
		time1.addJogadores(time1Jogador2);
		time1.addJogadores(time1Jogador3);
		time1.addJogadores(time1Jogador4);
		time1.addJogadores(time1Jogador5);
		time1.addJogadores(time1Jogador6);
		time1.addJogadores(time1Jogador7);
		time1.addJogadores(time1Jogador8);
		time1.addJogadores(time1Jogador9);
		time1.addJogadores(time1Jogador10);
		time1.addJogadores(time1Jogador11);
		
		time2.addJogadores(time2Jogador1);
		time2.addJogadores(time2Jogador2);
		time2.addJogadores(time2Jogador3);
		time2.addJogadores(time2Jogador4);
		time2.addJogadores(time2Jogador5);
		time2.addJogadores(time2Jogador6);
		time2.addJogadores(time2Jogador7);
		time2.addJogadores(time2Jogador8);
		time2.addJogadores(time2Jogador9);
		time2.addJogadores(time2Jogador10);
		time2.addJogadores(time2Jogador11);
		
		System.out.println(jogo.comecarJogo(time1, time2));

	}

}
