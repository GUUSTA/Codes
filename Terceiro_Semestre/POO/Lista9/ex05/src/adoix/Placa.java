package adoix;

import java.io.Serializable;

public class Placa implements Serializable{

    private int numero;
    private String cor;
    private String estado;

    public Placa(int numero, String cor, String estado) {
        this.numero = numero;
        this.cor = cor;
        this.estado = estado;
    }
    
    @Override
    public String toString () {
        return "Numero de placa: " + getNumero();
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}
