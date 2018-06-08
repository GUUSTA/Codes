package adoIV;

public class TObtusangulo extends TRetangulo {
	
	private int angulos90 = 0;
	private int angulosMaioresQ90 = 1;
	private int angulosMenoresQ90 = 2;

	public TObtusangulo(int base, int altura) {
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
