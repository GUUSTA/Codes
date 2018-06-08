package adoIV;

public class Losango extends Retangulo {

	private int angulos126 = 2;
	private int angulos53 = 2;
	
	public Losango(int base, String cor, int altura) {
		super(base, altura, cor);
	}
	public int getAngulos126() {
		return angulos126;
	}

	public int getAngulos53() {
		return angulos53;
	}
	
	public int calcularArea() {
		return this.base * this.altura;
	}
}
