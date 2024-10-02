/*
 * Hola crack. Espero que estes bien :D
 */
package tema4;
import PaqueteLectura.*;
/**
 *
 * @author Juampi conejera
 */
public class ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Indique en orden por linea para jugador: ");
        Jugador jugador = new Jugador(Lector.leerInt(),Lector.leerInt(),Lector.leerString(),Lector.leerDouble(),Lector.leerInt());
        
        System.out.println("\n");
        
        System.out.println("Indique en orden por linea para entrenador: ");
        Entrenador entrenador = new Entrenador(Lector.leerInt(),Lector.leerString(),Lector.leerDouble(),Lector.leerInt());
        System.out.println("\n");
        
        System.out.println(jugador.toString());
        
        System.out.println("\n");
        
        System.out.println(entrenador.toString());
    }
    
}
