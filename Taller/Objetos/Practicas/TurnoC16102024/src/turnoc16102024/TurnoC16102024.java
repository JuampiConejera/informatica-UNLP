/*
 * Hola crack. Espero que estes bien :D
 */
package turnoc16102024;
import PaqueteLectura.*;
/**
 *
 * @author Juampi conejera
 */
public class TurnoC16102024 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Plataforma plataforma = new Plataforma("Plataforma de Juampi", GeneradorAleatorio.generarInt(10000), 12);
        for(int i = 0; i < GeneradorAleatorio.generarInt(20); i++){
            plataforma.AgregarEstreno(GeneradorAleatorio.generarInt(12), new Estreno(GeneradorAleatorio.generarString(5),"Serie",GeneradorAleatorio.generarDouble(5000000),GeneradorAleatorio.generarInt(999999)));
            plataforma.AgregarEstreno(GeneradorAleatorio.generarInt(12), new Estreno(GeneradorAleatorio.generarString(5),"Pelicula",GeneradorAleatorio.generarDouble(5000000),GeneradorAleatorio.generarInt(999999)));
        }
        
        System.out.println(plataforma.toString());
    }
    
}
