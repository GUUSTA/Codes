// Código desenvolvido por: Gustavo Garcia Leite - BCC - 3° SEMESTRE

class Main {

	public static void main(String[] args) {


    	double resultado = 0;


		for(int n = 1; n <= 100; n++) {

		      resultado = log(10, 1.3);

      resultado = resultado + log(10, 1.3);

        }
    System.out.println(resultado);

  	}

	public static double log(double base, double valor) {

       return Math.log(valor) / Math.log(base);

	}

}
