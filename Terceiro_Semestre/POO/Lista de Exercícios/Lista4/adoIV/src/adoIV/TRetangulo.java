package adoIV;

public class TRetangulo extends Triangulo{

	protected int angulos90 = 1;
	protected int angulosMaioresQ90 = 0;
	protected int angulosMenoresQ90 = 2;
	
	public TRetangulo(int base, int altura) {
		super(base, altura);
	}
	public int getAngulos90() {
		return angulos90;
	}
	public int getAngulosMaioresQ90() {
		return angulosMaioresQ90;
	}
	public int getAngulosMenoresQ90() {
		return angulosMenoresQ90;
	}
	public int calcularArea() {
		return (this.base * this.altura)/2;
	}
}
