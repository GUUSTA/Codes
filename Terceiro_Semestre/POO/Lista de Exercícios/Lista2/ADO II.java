// Código desenvolvido por: Gustavo Garcia Leite - BCC - 3° SEMESTRE

class Fibonacci {
  
  private int x;
  
    public int calculaFibonacci(int n)  {
      if(n == 0) {
          return 0;
      }  else if(n == 1) {
        return 1;
      } else {
        return calculaFibonacci(n-1)+calculaFibonacci(n-2);
     }
  }
}

class Main {
  public static void main(String[] args) {
    Fibonacci fib = new Fibonacci();
    int i = fib.calculaFibonacci(6);
    System.out.println(i);
    
  }
}