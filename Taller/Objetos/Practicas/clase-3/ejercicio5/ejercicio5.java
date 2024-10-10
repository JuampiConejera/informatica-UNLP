/*
 * Hola crack. Espero que estes bien :D
 */
package tema3;
import PaqueteLectura.*;
/**
 *
 * @author Juampi conejera
 */
public class ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Indique el radio del circulo.");
        double radio = Lector.leerDouble();
        System.out.println("Indique el color de relleno del circulo.");
        String colorRelleno = Lector.leerString();
        System.out.println("Indique el color de linea del circulo.");
        String colorLinea = Lector.leerString();
        Circulo circulo = new Circulo(radio, colorRelleno, colorLinea);
        
        System.out.println("Area: " + circulo.calcularArea());        
        System.out.println("Perimetro: " + circulo.calcularPerimetro());

    }
    
}
