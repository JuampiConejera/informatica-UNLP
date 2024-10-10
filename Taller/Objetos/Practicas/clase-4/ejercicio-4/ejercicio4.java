/*
 * Hola crack. Espero que estes bien :D
 */
package tema4;
import PaqueteLectura.*;
/**
 *
 * @author Juampi conejera
 */
public class ejercicio4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        ReporteAnual reporteAnual = new ReporteAnual("La Plata",-34.921,-57.955,2021,3);
        for(int i = 0; i < 3; i++){
            for(int j = 0; j < 12; j++)
                reporteAnual.setTemperatura(j+1, 2021+i, GeneradorAleatorio.generarDouble(40)+1);
        }
        
        ReporteMensual reporteMensual = new ReporteMensual("Mar del Plata", -38.002, -57.556, 2021, 3);
        for(int i = 0; i < 3; i++){
            for(int j = 0; j < 12; j++)
                reporteMensual.setTemperatura(j+1, 2021+i, GeneradorAleatorio.generarDouble(40)+1);
        }
        
        System.out.println("maxima anual: " + reporteAnual.getMaximaTemperatura());
        System.out.println("\n");
        System.out.println(reporteAnual.toString());
        System.out.println("\n");
        System.out.println("maxima mensual: " + reporteMensual.getMaximaTemperatura());
        System.out.println("\n");
        System.out.println(reporteMensual.toString());
    }
    
}
