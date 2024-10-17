/*
 * Hola crack. Espero que estes bien :D
 */

package turnof081024;

 //@author Juampi conejera
public class Libreria {
    private String nombre;
    private int numeroVentaActual;
    private Caja[] cajas;
    
    public Libreria(String nombre, int T){
        this.nombre = nombre;
        numeroVentaActual = 0;
        cajas = new Caja[4];
        for(int i = 0; i < 4; i++){
            cajas[i] = new Caja(T);
        }
    }
    
    public void agregarCaja(int N, int DNICliente, int cantidadLibrosComprados, double montoAbonado, String medioPago){
        numeroVentaActual++;
        cajas[N-1].agregarTicket(numeroVentaActual,DNICliente,cantidadLibrosComprados,montoAbonado,medioPago);
    }
    
    public void deshabilitarCaja(int X){
        for(int i = 0; i < 4; i++){
            cajas[i].contarCantidadLibros(X);
        }
    }
    
    public Ticket buscarMayorMonto(){
        Ticket ticketMaximo = null;
        double montoMaximo = -1;
        for(int i = 0; i < 4; i++){
            ticketMaximo = cajas[i].maximoPago(ticketMaximo,montoMaximo);
            if(ticketMaximo != null){
                montoMaximo = ticketMaximo.getMontoAbonado();
            }
        }
        return ticketMaximo;
    }
    
    public String toString(){
        String aux = "Libreria: " + nombre + ";\n";
        for(int i = 0; i < 4; i++){
            aux += "Caja " + (i+1) + ": " + cajas[i].toString() + "\n";
        }
        return aux;
    }

}
