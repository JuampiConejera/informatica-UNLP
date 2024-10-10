/*
 * Hola crack. Espero que estes bien :D
 */

package tema2;
import PaqueteLectura.*;
 //@author Juampi conejera
public class ejercicio5 {
    public static void main(String [] args){
        Partido [] vector = new Partido [5];
        int dimL = 0;
        //cargo los partidos
        System.out.println("Equipo Visitante:");
        String nombreVisitante = Lector.leerString();
        while(!nombreVisitante.equals("ZZZ") && (dimL < 5)){
            System.out.println("Equipo local:");
            String nombreLocal = Lector.leerString();
            System.out.println("Goles local:");
            int golesLocal = Lector.leerInt();
            System.out.println("Goles visitante:");
            int golesVisitante = Lector.leerInt();
            vector[dimL] = new Partido(nombreLocal,nombreVisitante,golesLocal,golesVisitante);
            dimL++;
            nombreVisitante = Lector.leerString();
        }
        
        int cantidadGanadosRiver = 0;
        int golesLocalBoca = 0;
        for(int i = 0; i < dimL; i++){
            System.out.println("Partido " + (i+1));
            System.out.println(vector[i].getLocal() + " " + vector[i].getGolesLocal() + " - " + vector[i].getGolesVisitante() + " " + vector[i].getVisitante());
            if(vector[i].getGanador().equals("River"))
                cantidadGanadosRiver++;
            if(vector[i].getLocal().equals("Boca"))
                golesLocalBoca += vector[i].getGolesLocal();
        }
        System.out.println("River gano " + cantidadGanadosRiver + " partidos.");
        System.out.println("Boca metio " + golesLocalBoca + " goles de local.");

    }
}
