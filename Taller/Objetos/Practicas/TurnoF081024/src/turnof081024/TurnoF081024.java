/*
 * Hola crack. Espero que estes bien :D
 */
package turnof081024;

/**
 *
 * @author Juampi conejera
 */
public class TurnoF081024 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libreria libreria = new Libreria("Juan Pablo Conejera", 15);
        libreria.agregarCaja(1, 45573215, 100, 15000, "Credito");
        libreria.agregarCaja(3, 45573215, 1000, 15000, "Débito");
        libreria.agregarCaja(2, 45573215, 150, 30000, "Efectivo");
        libreria.agregarCaja(4, 45573215, 100, 25000, "Débito");
        libreria.agregarCaja(1, 45573215, 30, 115000, "CON LA COLA PA");
        libreria.deshabilitarCaja(500);
        System.out.println(libreria.buscarMayorMonto());
        System.out.println(libreria.toString());
    }
 
}
