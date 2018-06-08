package adoV;

public class Jaula {

	private Animal animal;
	
	public Jaula(Animal x) {
		animal = x;
	}
	
	public void mover() {
		animal.emitirSom();
		String mover = animal.mover();
		if(mover == "") {
			System.out.println("O animal n�o se moveu");
			return;
		} else
			System.out.println(mover);
	}
}
