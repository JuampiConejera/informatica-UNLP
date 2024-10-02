/*
 * Hola crack. Espero que estes bien :D
 */

package tema3;
import PaqueteLectura.*;
 //@author Juampi conejera
public class Habitacion {
    private double costoPorNoche;
    private boolean disponibilidad;
    private Persona cliente;
    
    public Habitacion(){
        costoPorNoche = GeneradorAleatorio.generarDouble(6001)+2000;
        cliente = null;
    }

    public double getCostoPorNoche() {
        return costoPorNoche;
    }

    public void setCostoPorNoche(double costoPorNoche) {
        this.costoPorNoche = costoPorNoche;
    }

    public boolean isDisponibilidad() {
        return disponibilidad;
    }


    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
        disponibilidad = true;
    }

    @Override
    public String toString() {
        String aux;
        aux = "Costo: $" + costoPorNoche + ", ocupacion: " + disponibilidad;
        if(disponibilidad){
            aux += ", cliente: " + cliente.toString();
        }
        return aux;
    }
    
    
    
}
