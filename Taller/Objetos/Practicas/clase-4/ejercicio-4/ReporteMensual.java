/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public class ReporteMensual extends Estacion{
    public ReporteMensual(String nombre, double latitud, double longitud, int anioInicio, int cantidadAnios){
        super(nombre,latitud,longitud,anioInicio,cantidadAnios);
    }
    
    public String toString(){
        String aux = super.toString();
        for(int i = 0; i < 12;i++){
            double totalTemperaturas = 0;
            for(int j = 0; j < getCantidadAnios(); j++){
                totalTemperaturas += getLecturas()[j][i];
            }
            totalTemperaturas = totalTemperaturas / 12;
            aux += "- Mes " + i + ": " + totalTemperaturas + " °C; \n";
        }
        return aux;
    }
}
