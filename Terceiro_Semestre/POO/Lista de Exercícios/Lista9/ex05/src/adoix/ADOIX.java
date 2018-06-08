package adoix;

import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class ADOIX {

    public static void main(String[] args) throws IOException, ClassNotFoundException {

        Placa placa1 = new Placa(123, "vermelho", "SP");
        Placa placa2 = new Placa(456, "azul", "RJ");
        Placa placa3 = new Placa(789, "branca", "RS");

        FileInputStream fluxoIn;
        FileOutputStream fluxoOut;

        int numeroDePlacas = 0;

        try {
            fluxoOut = new FileOutputStream("text.txt");
            ObjectOutputStream escrever = new ObjectOutputStream(fluxoOut);
            
            System.out.println("Abri o arquivo");

            escrever.writeObject(placa1);
            System.out.println("Escrevi a placa: " + placa1.getNumero());
            escrever.writeObject(placa2);
            System.out.println("Escrevi a placa: " + placa2.getNumero());
            escrever.writeObject(placa3);
            System.out.println("Escrevi a placa: " + placa3.getNumero());

            fluxoIn = new FileInputStream("text.txt");
            ObjectInputStream ler = new ObjectInputStream(fluxoIn);

            while (true) {
                Placa nova;
                nova = (Placa) ler.readObject();
                System.out.println("Clonei " + nova);
                numeroDePlacas++;
            }
        } catch (EOFException e) {
            System.out.println("Chegou ao final do arquivo, e clonou " + numeroDePlacas + " placas");
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
