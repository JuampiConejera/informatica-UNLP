/*
 * Hola crack. Espero que estes bien :D
 */
/*5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto Partido sabe responder a los siguientes mensajes:
getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate
Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local
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
