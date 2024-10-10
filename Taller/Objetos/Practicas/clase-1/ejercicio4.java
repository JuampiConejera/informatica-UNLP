/*
 * Hola crack. Espero que estes bien :D
 */

package tema1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

 //@author Juampi conejera
public class ejercicio4 {
    public static void main(String[] args) {
        /*4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido.*/
        int [][] matriz = new int [8][4];
        System.out.println("Indique su numero de piso: "); int numeroPiso = Lector.leerInt();
        while(numeroPiso != 9){
            System.out.println("Indique su numero de oficina: "); int numeroOficina = Lector.leerInt();
            
            matriz[numeroPiso][numeroOficina] += 1;
            
            System.out.println("Indique su numero de piso: "); numeroPiso = Lector.leerInt();
            System.out.println("Indique su numero de oficina: "); numeroOficina = Lector.leerInt();
        }
        for(int i = 0; i < 8; i++){
            System.out.println("Piso " + i);
            for(int j = 0; j < 4; j++) {
                System.out.print("Oficina " + j + " hay " + matriz[i][j] + " personas | ");
            }
            System.out.println();
            System.out.println();

        }
    }
}
