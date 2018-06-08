package adoV;
import java.util.ArrayList;

public class main {

	public static void main(String[] args) {
		
		ArrayList<Jaula> jaulas = new ArrayList<Jaula>();
		
		Panda panda = new Panda();
		Jaula jaula0 = new Jaula(panda);
		jaulas.add(jaula0);
		
		Leao leao = new Leao();
		Jaula jaula1 = new Jaula(leao);
		jaulas.add(jaula1);
		
		Vaca vaca = new Vaca();
		Jaula jaula2 = new Jaula(vaca);
		jaulas.add(jaula2);

		Macaco macaco = new Macaco();
		Jaula jaula3 = new Jaula(macaco);
		jaulas.add(jaula3);
		
		Leopardo leopardo = new Leopardo();
		Jaula jaula4 = new Jaula(leopardo);
		jaulas.add(jaula4);
		
		Girafa girafa = new Girafa();
		Jaula jaula5 = new Jaula(girafa);
		jaulas.add(jaula5);
		
		Urso urso = new Urso();
		Jaula jaula6 = new Jaula(urso);
		jaulas.add(jaula6);
		
		Tartaruga tartaruga = new Tartaruga();
		Jaula jaula7 = new Jaula(tartaruga);
		jaulas.add(jaula7);
		
		Zebra zebra = new Zebra();
		Jaula jaula8 = new Jaula(zebra);
		jaulas.add(jaula8);
		
		Pinguim pinguim = new Pinguim();
		Jaula jaula9 = new Jaula(pinguim);
		jaulas.add(jaula9);		
		
		for (int i=0; i < jaulas.size() ; i++) {
			jaulas.get(i).mover();
		}
	}
}
