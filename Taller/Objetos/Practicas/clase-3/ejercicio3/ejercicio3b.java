/*
 * Hola crack. Espero que estes bien :D
 */

package tema3;
import PaqueteLectura.*;
 //@author Juampi conejera
public class ejercicio3b {
    public static void main(String [] args){
        GeneradorAleatorio.iniciar();
        Estanteria estante = new Estanteria();
        
        for(int i = 0; i < 20; i++)
        {
            Autor autor = new Autor(GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarString(5),GeneradorAleatorio.generarString(6));
            Libro libro = new Libro(GeneradorAleatorio.generarString(7),"es",autor,"978-1512108347");
            estante.agregarLibro(libro);
        }

        Libro resultado = estante.libroExiste("m");
        if(resultado != null)
            System.out.println(resultado.getPrimerAutor().getNombre());
    }
}
