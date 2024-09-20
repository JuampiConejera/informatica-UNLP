/*
 * Hola crack. Espero que estes bien :D
 */

package tema2;
import PaqueteLectura.*;
 //@author Juampi conejera
public class ejercicio2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Persona [] vector = new Persona[15];
        
        
        int dimL = 0;
        int edad = GeneradorAleatorio.generarInt(99);
        while((edad != 0) && (dimL < 15)){
            String nombre = GeneradorAleatorio.generarString(10);
            int DNI = GeneradorAleatorio.generarInt(1000);
            vector[dimL] = new Persona(nombre,DNI,edad);
            dimL++;
            edad = GeneradorAleatorio.generarInt(99);
        }
        
        Persona personaMinima = new Persona(); //lo declaro afuera porque no lo uso en el FOR
        int cantidad = 0;
        int minimo = 10001;
        
        for(int i = 0; i < dimL;i++){
            if(vector[i].getEdad() > 65)
                cantidad++;
            if (vector[i].getDNI()<minimo) {
                minimo = vector[i].getDNI();
                personaMinima = vector[i];
            }
        }
        
        System.out.println("Hay " + cantidad + " personas mayores a 65 anios.");
        System.out.println(personaMinima.toString());


    }
}
