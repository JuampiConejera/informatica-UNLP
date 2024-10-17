/*
 * Hola crack. Espero que estes bien :D
 */

package turnoc16102024;

 //@author Juampi conejera
public class Estreno {
    private String titulo;
    private String tipoContenido;
    private double recaudacion;
    private int cantidadVisualizaciones;
    
    public Estreno(String titulo, String tipoContenido, double recaudacion, int cantidadVisualizaciones){
        this.titulo = titulo;
        this.tipoContenido = tipoContenido;
        this.recaudacion = recaudacion;
        this.cantidadVisualizaciones = cantidadVisualizaciones;
    }

    public double getRecaudacion() {
        return recaudacion;
    }
    
    
    
    public String toString(){
        return "Titulo: " + titulo + ", " + tipoContenido + ", recaudacion: " + recaudacion + ", cantidad de visualizaciones: " + cantidadVisualizaciones;
    }
}
