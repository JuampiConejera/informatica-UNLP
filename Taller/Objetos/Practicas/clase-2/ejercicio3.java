/*
 * Hola crack. Espero que estes bien :D
 */

package tema2;
import PaqueteLectura.*;
 //@author Juampi conejera
public class ejercicio3 {
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        int dias = 5;
        int entrevistas = 8;
        int dimL = 0;
        int ultimoDia = 0;
        
        Persona [][] matriz = new Persona[dias][entrevistas];
        int [] vectorDimL = new int [dias];
        
        for(int i = 0 ;i < 5 ; i++)
            vectorDimL[i] = 0;
        
        int aux = 0; //Auxiliar para contar la cantidad de entrevistas por día.
        String nombre = GeneradorAleatorio.generarString(3);
        
        while(!nombre.equals("zzz") && (dimL < 40)){
            int DNI = GeneradorAleatorio.generarInt(1000);
            int edad = GeneradorAleatorio.generarInt(99);
            matriz[aux][vectorDimL[aux]] = new Persona(nombre,DNI,edad);
            
            vectorDimL[aux]++;
            ultimoDia = aux;
            if(vectorDimL[aux] == 8)
                aux++;
            dimL++;
            nombre = GeneradorAleatorio.generarString(3);
        }
        
        for(int i = 0; i <= ultimoDia; i++){
            System.out.println();
            System.out.println("Dia " + (i+1) + ":");
            for(int j = 0; j < vectorDimL[i]; j++)
                System.out.println("Turno: " + (j+1) + ". Su nombre es: " + matriz[i][j].getNombre());
        }
    }
}
