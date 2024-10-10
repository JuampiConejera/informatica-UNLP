/*
 * Hola crack. Espero que estes bien :D
 */

package tema4;

 //@author Juampi conejera
public abstract class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;
    private double[][] lecturas;
    private int anioInicio;
    private int cantidadAnios;  
    
    public Estacion(String nombre, double latitud, double longitud, int anioInicio,int cantidadAnios){
        this.nombre = nombre;
        this.latitud = latitud;
        this.longitud = longitud;
        this.anioInicio = anioInicio;
        this.cantidadAnios = cantidadAnios;
        lecturas = new double[cantidadAnios][12];
        for(int i = 0; i < cantidadAnios; i++){
            for(int j = 0; j < 12; j++)
                lecturas[i][j] = 99;
        }
    }
    
    public void setTemperatura(int mes, int anio, double temperatura){
        lecturas[anio-anioInicio][mes-1] = temperatura;
    }

    public double getTemperatura(int mes, int anio){
        return lecturas[anio-anioInicio][mes-1];
    }
    
    public String getMaximaTemperatura(){
        double maximo = -999;
        int mes = 0;
        int anio = 0;
        for(int i = 0; i < cantidadAnios;i++){
            for(int j = 0; j < 12; j++){
                if(lecturas[i][j] > maximo){
                    maximo = lecturas[i][j];
                    mes = j+1;
                    anio = i+anioInicio;
                }
            }
        }
        return "En el mes: " + mes + " de " + anio + " se registro la temperatura mas alta. Fue: " + maximo;
    }

    public double[][] getLecturas() {
        return lecturas;
    }

    public void setLecturas(double[][] lecturas) {
        this.lecturas = lecturas;
    }

    public int getAnioInicio() {
        return anioInicio;
    }

    public void setAnioInicio(int anioInicio) {
        this.anioInicio = anioInicio;
    }

    
    public int getCantidadAnios() {
        return cantidadAnios;
    }

    public void setCantidadAnios(int cantidadAnios) {
        this.cantidadAnios = cantidadAnios;
    }
    
    public String toString(){
        return nombre + "(" + latitud + " S - " + longitud + " O): \n";
    }
}

