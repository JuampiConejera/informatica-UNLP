/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public class ReporteAnual extends Estacion {
    public ReporteAnual(String nombre, double latitud, double longitud, int anioInicio, int cantidadAnios){
        super(nombre, latitud, longitud, anioInicio, cantidadAnios);
    }
    
    public String toString(){
        String aux = super.toString();
        for(int i = 0; i < getCantidadAnios(); i++){
            double totalTemperaturas = 0;
            for(int j = 0; j < 11; j++)
                totalTemperaturas += getLecturas()[i][j]; //posible fallo
            totalTemperaturas = totalTemperaturas / 12.0;
            aux += "- Anio " + (i+getAnioInicio()) + ": " + totalTemperaturas + "°C;" + "\n";
        }
        return aux;
    }
}