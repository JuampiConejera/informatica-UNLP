/*
 * Hola crack. Espero que estes bien :D
 */

/*B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.*/

package tema3;
import PaqueteLectura.*;
 //@author Juampi conejera
public class ejercicio1b {
    public static void main(String [] args){
        System.out.println("Longitud lado A.");
        double ladoA = Lector.leerDouble();
        System.out.println("Longitud lado B.");
        double ladoB = Lector.leerDouble();
        System.out.println("Longitud lado C.");
        double ladoC = Lector.leerDouble();
        System.out.println("Designe el color de fondo del triangulo.");
        String colorRelleno = Lector.leerString();
        System.out.println("Designe el color de la linea del triangulo.");
        String colorLinea = Lector.leerString();
        Ejercicio1a triangulo = new Ejercicio1a(ladoA,ladoB,ladoC,colorRelleno,colorLinea);
        System.out.println("El perimetro del triangulo es: " + triangulo.calcularPerimetro());
        System.out.println("El area del triangulo es: " + triangulo.calcularArea());
        System.out.println(triangulo.toString());
    }
}
