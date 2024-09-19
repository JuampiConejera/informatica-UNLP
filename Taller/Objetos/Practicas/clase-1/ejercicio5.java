/*
 * Hola crack. Espero que estes bien :D
 */

package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

 //@author Juampi conejera
public class ejercicio5 {
    public static void main(String[] args){
        /*5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.*/
        GeneradorAleatorio.iniciar();
        double [][] matriz = new double [5][4];
        for(int i = 0; i < 5; i++){
            System.out.println();
            System.out.println("Cliente " + (i+1));
            for(int j = 0; j < 4; j++){
                System.out.println("Puntaje del aspecto: " + (j+1));
                matriz[i][j] = /*Lector.leerInt();*/ GeneradorAleatorio.generarDouble(10);
            }
        }
        for(int j = 0; j < 4; j++) {
            double suma = 0;
            for(int i = 0; i < 5; i++){
                suma += matriz[i][j];
            }
            System.out.println("El promedio del aspecto: " + j + " es: " + suma/5);
        }
    
    }
}
