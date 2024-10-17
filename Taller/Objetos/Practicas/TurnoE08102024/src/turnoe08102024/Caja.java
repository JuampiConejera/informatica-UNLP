package turnoe08102024;

public class Caja {

    private String nombreCajero;
    private Ticket[] tickets;
    private int cantidadMaximaTickets;
    private int dimL;

    public Caja(String nombreCajero, int T) {
        this.nombreCajero = nombreCajero;
        tickets = new Ticket[T];
        cantidadMaximaTickets = T;
        dimL = 0;
    }

    public void agregarTicket(int numeroTicket, int CUITCliente,
            int cantidadProductosComprados, double montoAbonado,
            String medioPago) {
        if (dimL < cantidadMaximaTickets) {
            tickets[dimL] = new Ticket(numeroTicket, CUITCliente,
                    cantidadProductosComprados, montoAbonado, medioPago);
            dimL++;
        }
    }

    public int getDimL() {
        return dimL;
    }

    public String getNombreCajero() {
        return nombreCajero;
    }

    public int cantidadCredito(){
        int aux = 0;
        for(int i = 0; i < dimL; i++){
            if(tickets[i].getMedioPago().equals("Credito")){
                aux++;
            }
        }
        
        return aux;
    }
    
    public String devolverMedioPago(int numeroTicket) {
        return tickets[numeroTicket].getMedioPago();
    }

    public String toString() {
        String aux = "";
        for (int i = 0; i < dimL; i++) {
            aux += "; Tickets emitidos: [" + tickets[i].toString() + "] ";
        }
        return aux;
    }
}
