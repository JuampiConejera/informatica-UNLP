/*
 * Hola crack. Espero que estes bien :D
 */

package turnof081024;

 //@author Juampi conejera
public class Ticket {
    private int numeroTicket;
    private int DNICliente;
    private int cantidadLibrosComprados;
    private double montoAbonado;
    private String modoPago;
    
    public Ticket(int numeroTicket, int DNICliente, int cantidadLibrosComprados, double montoAbonado, String modoPago){
        this.numeroTicket = numeroTicket;
        this.DNICliente = DNICliente;
        this.cantidadLibrosComprados = cantidadLibrosComprados;
        this.montoAbonado = montoAbonado;
        this.modoPago = modoPago;
    }

    public int getCantidadLibrosComprados() {
        return cantidadLibrosComprados;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }
    
    public String toString(){
        return "[" + numeroTicket + ", " + DNICliente + ", " + cantidadLibrosComprados + ", " + montoAbonado + ", " + modoPago + "]";
    }
    
    
}
