/*
 * Hola crack. Espero que estes bien :D
 */

package tema2;
import PaqueteLectura.*;
 //@author Juampi conejera
public class ejercicio1 {
    public static void main(String[] args) {
        Persona p = new Persona();
        System.out.println("Nombre de la persona:");
        p.setNombre(Lector.leerString());
        System.out.println("DNI de la persona:");
        p.setDNI(Lector.leerInt());
        System.out.println("Edad de la persona:");
        p.setEdad(Lector.leerInt());
        System.out.println(p.toString());
    }
}
