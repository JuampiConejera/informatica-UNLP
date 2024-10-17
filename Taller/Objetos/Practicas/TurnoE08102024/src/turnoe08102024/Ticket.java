package turnoe08102024;

public class Ticket {
    private int numeroTicket;
    private int CUITCliente;
    private int cantidadProductosComprados;
    private double montoAbonado;
    private String medioPago;
    
    public Ticket(int numeroTicket, int CUITCliente, int cantidadProductosComprados, double montoAbonado, String medioPago){
        this.numeroTicket = numeroTicket;
        this.CUITCliente = CUITCliente;
        this.cantidadProductosComprados = cantidadProductosComprados;
        this.montoAbonado = montoAbonado;
        this.medioPago = medioPago;
    }

    public String getMedioPago() {
        return medioPago;
    }
    
    public String toString(){
        return numeroTicket + ", " + CUITCliente + ", " + cantidadProductosComprados + ", " + montoAbonado + ", " + medioPago;
    }
    
}
