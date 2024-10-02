/*
 * Hola crack. Espero que estes bien :D
 */
package tema4;
import PaqueteLectura.*;
/**
 *
 * @author Juampi conejera
 */
public class ejercicio1 {

    public static void main(String[] args) {
        System.out.println("Indique por linea y por orden: Lado A, lado B, lado C, color de relleno y color de linea para armar un triangulo.");
        Triangulo triangulo = new Triangulo(Lector.leerDouble(),Lector.leerDouble(),Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        System.out.println("Indique por linea y por orden: radio, color de relleno y color de linea para armar un triangulo.");
        Circulo circulo = new Circulo(Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        
        System.out.println("\n");
        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
        
        triangulo.despintar();
        circulo.despintar();
        
        System.out.println("\n");

        System.out.println(triangulo.toString());
        System.out.println(circulo.toString());
        
    }
    
}
