/*
 * Hola crack. Espero que estes bien :D
 */
package tema4;
import PaqueteLectura.Lector;

/**
 *
 * @author Juampi conejera
 */
public class ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Indique en orden por linea para persona: ");
        Persona persona = new Persona(Lector.leerString(),Lector.leerInt(),Lector.leerInt());
        
        System.out.println("\n");
        
        System.out.println("Indique en orden por linea para trabajador: ");
        Trabajador trabajador = new Trabajador(Lector.leerString(),Lector.leerString(),Lector.leerInt(),Lector.leerInt());
        System.out.println("\n");
        
        System.out.println(persona.toString());
        
        System.out.println("\n");
        
        System.out.println(trabajador.toString());
    }
    
}
