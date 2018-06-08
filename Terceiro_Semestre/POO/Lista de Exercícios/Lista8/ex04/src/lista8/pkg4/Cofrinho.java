/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lista8.pkg4;

/**
 *
 * @author gustavo
 */
public class Cofrinho {

    private double saldo;

    public Cofrinho(double saldo) {
        this.saldo = saldo;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
    
    public void depositar(int valor) {
        
        if(valor < 0) {
            throw  new IllegalArgumentException();
        } else {
            this.saldo += valor;
        }
    }
    
    public void saca(int valor) {
        
        if(valor > getSaldo()) {
            throw  new IllegalArgumentException();
        } else {
            this.saldo -= valor;
        }
        
    }

    
}
