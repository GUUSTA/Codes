package adoIII;

public class Jogo {
	
	private int golsTime1;
	private int golstime2;
	
	public int getGolsTime1() {
		return golsTime1;
	}
	public void setGolsTime1(int golsTime1) {
		this.golsTime1 = golsTime1;
	}
	public int getGolstime2() {
		return golstime2;
	}
	public void setGolstime2(int golstime2) {
		this.golstime2 = golstime2;
	}
	
	public String comecarJogo(Time time1, Time time2) {
		int countTime1 = time1.getnJogadores();
		int countTime2 = time2.getnJogadores();
		if (countTime1 >= 11 && countTime2 >= 11)
			return "O jogo foi iniciado";
		else
			return "Adicione mais jogadores";
	}
	
}
