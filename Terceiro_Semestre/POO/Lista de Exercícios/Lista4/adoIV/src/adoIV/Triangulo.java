package adoIV;

public class Triangulo {

	protected int lados = 3;
	protected int base;
	protected int altura;
	
	public Triangulo(int base, int altura) {
		this.base = base;
		this.altura = altura;
	}
	
	public int getBase() {
		return base;
	}
	public void setBase(int base) {
		this.base = base;
	}
	public int getAltura() {
		return altura;
	}
	public void setAltura(int altura) {
		this.altura = altura;
	}
	public int calcularArea() {
		return (this.base * this.altura)/2;
	}
	
}
