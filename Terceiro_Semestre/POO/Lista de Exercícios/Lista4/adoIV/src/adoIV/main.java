package adoIV;

public class main {

	public static void main(String[] args) {
		
		Quadrado quadrado = new Quadrado(2, "Verde");
		System.out.println("Area do quadrado �: " + quadrado.calcularArea() +
				", e tem cor " + quadrado.getCor());
		quadrado.setBase(10);
		quadrado.setCor("Azul");
		System.out.println("Area do quadrado �: " + quadrado.calcularArea() +
				", e tem cor " + quadrado.getCor());
		
		Retangulo retangulo = new Retangulo(10, 20, "Vermelho");
		System.out.println("Area do retangulo �: " + retangulo.calcularArea() +
				", e tem cor " + retangulo.getCor());
		
		Losango losango = new Losango(2, "Marrom", 4);
		System.out.println("Area do losango �: " + losango.calcularArea() + ", tem cor " 
		+ losango.getCor() + ", possui: " + losango.getAngulos126() +
		" angulos de 126 graus e possui: " + losango.getAngulos53() + " angulos de 53 graus.");
		
		TRetangulo tRetangulo = new TRetangulo(10, 10);
		System.out.println("Area do Triangulo Retangulo �: " + tRetangulo.calcularArea() +
		", possui: " + tRetangulo.getAngulos90() + " angulos de 90 graus, possui: " 
		+ tRetangulo.getAngulosMaioresQ90() + " angulos maiores que 90 graus e " 
				+ tRetangulo.getAngulosMenoresQ90() + " angulos menoress que 90 graus.");
		
		TAcutangulo tAcutangulo = new TAcutangulo(10, 10);
		System.out.println("Area do Triangulo Acutangulo �: " + tAcutangulo.calcularArea() +
		", possui: " + tAcutangulo.getAngulos90() + " angulos de 90 graus, possui: " 
		+ tAcutangulo.getAngulosMaioresQ90() + " angulos maiores que 90 graus e " 
		+ tAcutangulo.getAngulosMenoresQ90() + " angulos menoress que 90 graus.");
		
		TObtusangulo tObtusangulo = new TObtusangulo(10, 10);
		System.out.println("Area do Triangulo Obtusangulo �: " + tObtusangulo.calcularArea() +
		", possui: " + tObtusangulo.getAngulos90() + " angulos de 90 graus, possui: " 
		+ tObtusangulo.getAngulosMaioresQ90() + " angulos maiores que 90 graus e " 
		+ tObtusangulo.getAngulosMenoresQ90() + " angulos menoress que 90 graus.");

	}

}
