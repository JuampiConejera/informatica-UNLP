package turnoe08102024;

public class Supermercado {
    private String direccion;
    private int numeroVentaActual;
    private Caja[] cajas;
    private int dimL;
    
    public Supermercado(String direccion){
        this.direccion = direccion;
        numeroVentaActual = 0;
        cajas = new Caja[5];
        dimL = 0;
    }
    
    public void agregarCaja(Caja caja){
        cajas[dimL] = caja;
        dimL++;
    }
    
    public void agregarCaja(int numeroCaja, int CUITCliente, int cantidadProductosComprados, double montoAbonado, String medioPago){
        cajas[numeroCaja-1].agregarTicket(numeroVentaActual, CUITCliente, cantidadProductosComprados, montoAbonado, medioPago);
    }
    
    public int minimoTicketsCredito(){
        int aux = 0;
        int minimo = 9999;
        for(int i = 0; i < 5; i++){
            if(cajas[i] != null){
                if(cajas[i].cantidadCredito() < minimo){
                    minimo = cajas[i].cantidadCredito();
                    aux = i+1;
                }
            }
        }
        
        return aux;
    }
    
    public String toString(){
        String aux = "Supermercado: " + direccion + "; " + dimL + "\n";
        for(int i = 0; i < dimL; i++){
            aux += "Caja " + (i+1) + ": "  + cajas[i].getNombreCajero() + cajas[i].toString() + "\n";
        }
            
        return aux;
    }
}
