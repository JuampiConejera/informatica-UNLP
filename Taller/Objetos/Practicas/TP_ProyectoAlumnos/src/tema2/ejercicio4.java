/*
 * Hola crack. Espero que estes bien :D
 */
/*4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de
casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.

*/
package tema2;
import PaqueteLectura.*;
 //@author Juampi conejera
public class ejercicio4 {
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        int dias = 5;
        int entrevistas = 8;
        int dimL = 0;
        
        Persona [][] matriz = new Persona[dias][entrevistas];
        int [] vectorDimL = new int [dias];
        
        for(int i = 0 ;i < 5 ; i++)
            vectorDimL[i] = 0;
        
        String nombre = GeneradorAleatorio.generarString(3);
        
        while(!nombre.equals("zzz") && (dimL < 40)){
            int diaAnotar = GeneradorAleatorio.generarInt(5);
            if(vectorDimL[diaAnotar] == 8){
                System.out.println("El dia tiene los turnos completos");
            } else {
                int DNI = GeneradorAleatorio.generarInt(1000);
                int edad = GeneradorAleatorio.generarInt(99);
                matriz[diaAnotar][vectorDimL[diaAnotar]] = new Persona(nombre,DNI,edad);
                vectorDimL[diaAnotar]++;
                dimL++;
                System.out.println("pasa");
            }
            nombre = GeneradorAleatorio.generarString(3);
        }
        
        for(int i = 0; i < 5; i++){
            System.out.println();
            System.out.println("Dia " + (i+1) + ":");
            for(int j = 0; j < vectorDimL[i]; j++)
                System.out.println("Turno: " + (j+1) + ". Su nombre es: " + matriz[i][j].getNombre());
        }
    }
}
