package adoIV;

public class Quadrado extends Quadrilatero {

	protected int base;
	protected String cor;
	
	public Quadrado(int base, String cor) {
		this.base = base;
		this.cor = cor;
	}	
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	public int getBase() {
		return base;
	}
	public void setBase(int base) {
		this.base = base;
	}
	public int calcularArea() {
		return this.base * this.base;
	}
}
