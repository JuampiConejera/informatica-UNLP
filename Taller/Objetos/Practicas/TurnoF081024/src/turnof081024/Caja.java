/*
 * Hola crack. Espero que estes bien :D
 */

package turnof081024;

 //@author Juampi conejera
public class Caja {
    private boolean disponible;
    private Ticket[] tickets;
    private int cantidadMaxima;
    private int dimL;
    
    
    public Caja(int T){
        disponible = true;
        tickets = new Ticket[T];
        cantidadMaxima = T;
        dimL = 0;
    }
    
    public void agregarTicket(int numeroTicket, int DNICliente, int cantidadLibrosComprados, double montoAbonado, String medioPago){
        if(dimL < cantidadMaxima){
            tickets[dimL] = new Ticket(numeroTicket, DNICliente,cantidadLibrosComprados,montoAbonado,medioPago);
            dimL++;
        }
    }
    
    private void setDisponibilidad(){
        disponible = false;
    }
    
    public void contarCantidadLibros(int X){
        int aux = 0;
        for(int i = 0; i < dimL; i++){
            aux += tickets[i].getCantidadLibrosComprados();
        }
        if(aux < X){
            this.setDisponibilidad();
        }
    }
    
    public Ticket maximoPago(Ticket ticketMaximo,double montoMaximo){
        for(int i = 0; i < dimL; i++){
            if(tickets[i].getMontoAbonado() > montoMaximo){
                ticketMaximo = tickets[i];
                montoMaximo = tickets[i].getMontoAbonado();
            }
        }
        return ticketMaximo;
    }
    
    public String toString(){
        String aux = "Disponibilidad: " + disponible + ". Tickets emitidos: ";
        for(int i = 0; i < dimL; i++){
            aux += tickets[i].toString();
        }
        return aux;
    }
}
