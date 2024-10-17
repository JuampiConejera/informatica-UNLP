/*
 * Hola crack. Espero que estes bien :D
 */
package puto;

/**
 *
 * @author Juampi conejera
 */
public class Puto {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BancoTradicional bancoT = new BancoTradicional("nombre",10,500,"rojas","9dj");
        
        System.out.println(bancoT.agregarCuenta(1311, "frandogil", 43851, "Dolares"));
        
        BancoDigital bancoD = new BancoDigital("nombreDigital",10,500,"www.com");
        
        System.out.println(bancoD.agregarCuenta(1311, "frandogil", 43851, "Pesos"));
        
        bancoT.depositarDinero(1311, 401);
        
        System.out.println(bancoT);
        bancoD.depositarDinero(1311, 100000);
        
        System.out.println("(BANCO TRADICIONAL)Recibe tarjeta?: " + bancoT.puedeRecibirTarjeta(1311));
        
         System.out.println("(BANCO DIGITAL)Recibe tarjeta?: " + bancoD.puedeRecibirTarjeta(1311));

    }
    
}
