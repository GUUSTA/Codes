package adoIII;
import java.util.ArrayList;

public class Time {

	ArrayList<Jogador> time = new ArrayList<Jogador>();
	private String nome;
	private int nJogadores = 0;
	
	public void addJogadores(Jogador jogador) {
		time.add(jogador);
		this.nJogadores++;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getnJogadores() {
		return nJogadores;
	}
}
