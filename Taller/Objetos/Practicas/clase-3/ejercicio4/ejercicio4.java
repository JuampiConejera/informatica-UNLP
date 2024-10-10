/*
 * Hola crack. Espero que estes bien :D
 */
package tema3;
import PaqueteLectura.*;
/**
 *
 * @author Juampi conejera
 */
public class ejercicio4 {

    public static void main(String[] args) {
        System.out.println("Ingrese cantidad de habitaciones:");
        int N = Lector.leerInt();
        Hotel hotel = new Hotel(N);
        for(int i = 0; i < N; i++){
            System.out.println("Ingrese nombre de cliente:");
            String nombre = Lector.leerString();
            System.out.println("Ingrese DNI de cliente:");
            int DNI = Lector.leerInt();
            System.out.println("Ingrese edad de cliente:");
            int edad = Lector.leerInt();
            Persona cliente = new Persona(nombre,DNI,edad);
            System.out.println("Ingrese numero de habitacion a agregar entre 1 y " + N);
            int numeroHabitacion = Lector.leerInt();
            hotel.agregarCliente(cliente, numeroHabitacion);
        }
        System.out.println("\n");
        hotel.toString();
        System.out.println("\n");
        System.out.println("Ingrese el monto en $ que desea aumentar las habitaciones.");
        double Monto = Lector.leerDouble();
        hotel.aumentarPrecio(Monto);
        System.out.println("\n");
        System.out.println(hotel.toString());
    }
    
}
