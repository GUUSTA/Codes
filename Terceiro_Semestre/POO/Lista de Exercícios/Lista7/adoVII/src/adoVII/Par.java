package adoVII;

public class Par <T, E> {
	
	private T elemento1;
	private E elemento2;

	public Par(T elemento1, E elemento2) {
		this.elemento1 = elemento1;
		this.elemento2 = elemento2;
	}
	
	public void print(T elemento1, E elemento2) {
		System.out.println(elemento1 + " : " + elemento2 );
	}
	
	public T getElemento1() {
		return elemento1;
	}

	public void setElemento1(T elemento1) {
		this.elemento1 = elemento1;
	}

	public E getElemento2() {
		return elemento2;
	}

	public void setElemento2(E elemento2) {
		this.elemento2 = elemento2;
	}
	
	public <T,E> void imprimir() {
		System.out.println(getElemento1() + ": " + getElemento2());
	}
	
}
