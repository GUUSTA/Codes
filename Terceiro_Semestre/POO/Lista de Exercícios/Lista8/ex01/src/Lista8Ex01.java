public class Lista8Ex01 {

    public static void main(String[] args) throws Exception {
        System.out.println("Comeco do main");
        try {
            metodo1();
        } catch (NullPointerException e) {
            System.out.println("erro: " + e);
        }

        System.out.println("Fim do main");
    }

    static void metodo1() {
        System.out.println("comeco metodo1");
        metodo2();
        System.out.println("fim metodo1");
    }

    static void metodo2() {
        System.out.println("comeco metodo2");
        int[] array;
        array = new int[10];
        for (int i = 0; i <= 15; i++) {
            array[i] = i;
            System.out.println(i);
        }

        System.out.println("fim metodo2");
    }

}
