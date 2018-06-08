package adoVII;

public class App {

	public static void main(String[] args) {
		
		Par<String, Double> aluno = new Par<String, Double>("Geraldinho", 9.75);
		aluno.imprimir();
		
		Par<Integer, String> funcionario = new Par<Integer, String>(123456, "José Eduardo");
		funcionario.imprimir();
		
		Par<Float, Float> coordenada = new Par<Float, Float>((float)7.71, (float) 8.86);
		coordenada.imprimir();
	}
}
