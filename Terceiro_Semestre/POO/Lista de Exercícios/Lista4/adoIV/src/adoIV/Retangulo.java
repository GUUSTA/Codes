package adoIV;

public class Retangulo extends Quadrado {
	
	protected int altura;
	
	public Retangulo(int base, int altura, String cor) {
		super(base, cor);
		this.altura = altura;
	}
	public int getAltura() {
		return altura;
	}

	public void setAltura(int altura) {
		this.altura = altura;
	}
	
	public int calcularArea() {
		return this.base * this.altura;
	}
}
